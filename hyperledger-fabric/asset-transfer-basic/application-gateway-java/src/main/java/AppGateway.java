import io.grpc.ManagedChannel;
import io.grpc.ManagedChannelBuilder;
import org.hyperledger.fabric.client.*;
import org.hyperledger.fabric.client.identity.*;

public class AppGateway {

    public static void main(final String[] args) throws CommitException, GatewayException, InterruptedException {
        Reader certReader = Files.newBufferedReader(certificatePath);
        X509Certificate certificate = Identities.readX509Certificate(certReader);
        Identity identity = new X509Identity("mspId", certificate);

        Reader keyReader = Files.newBufferedReader(privateKeyPath);
        PrivateKey privateKey = Identities.readPrivateKey(keyReader);
        Signer signer = Signers.newPrivateKeySigner(privateKey);

        ManagedChannel grpcChannel = ManagedChannelBuilder.forAddress("gateway.example.org", 1337)
                .usePlaintext()
                .build();

        Gateway.Builder builder = Gateway.newInstance()
                .identity(identity)
                .signer(signer)
                .connection(grpcChannel);

        try (Gateway gateway = builder.connect()) {
            Network network = gateway.getNetwork("channelName");
            Contract contract = network.getContract("chaincodeName");

            byte[] putResult = contract.submitTransaction("put", "time", 
                                            LocalDateTime.now().toString());
            System.out.println(new String(putResult, StandardCharsets.UTF_8));

            byte[] getResult = contract.evaluateTransaction("get", "time");
            System.out.println(new String(getResult, StandardCharsets.UTF_8));
        } finally {
            grpcChannel.shutdownNow().awaitTermination(5, TimeUnit.SECONDS);
        }
    }
}
