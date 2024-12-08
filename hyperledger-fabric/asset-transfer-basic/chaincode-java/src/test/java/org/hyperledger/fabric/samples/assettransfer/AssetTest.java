/*
 * SPDX-License-Identifier: Apache-2.0
 */

package org.hyperledger.fabric.samples.assettransfer;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;

public final class AssetTest {

    /**
     *  CreateAsset(ctx, "asset1", "blue", 5, "Rashmi Nair", 300);
        CreateAsset(ctx, "asset2", "red", 5, "Anjali Menon", 400);
        CreateAsset(ctx, "asset3", "green", 10, "Alex Abraham", 500);
        CreateAsset(ctx, "asset4", "yellow", 10, "Karishma A", 600);
        CreateAsset(ctx, "asset5", "black", 15, "John Mathai", 700);
        CreateAsset(ctx, "asset6", "white", 15, "Araf Karsh", 700);
     */


    @Nested
    class Equality {

        @Test
        public void isReflexive() {
            Asset asset = new Asset("asset5", "black", 15, "John Mathai", 100);

            assertThat(asset).isEqualTo(asset);
        }

        @Test
        public void isSymmetric() {
            Asset assetA = new Asset("asset5", "black", 15, "John Mathai", 100);
            Asset assetB = new Asset("asset5", "black", 15, "John Mathai", 100);

            assertThat(assetA).isEqualTo(assetB);
            assertThat(assetB).isEqualTo(assetA);
        }

        @Test
        public void isTransitive() {
            Asset assetA = new Asset("asset5", "black", 15, "John Mathai", 100);
            Asset assetB = new Asset("asset5", "black", 15, "John Mathai", 100);
            Asset assetC = new Asset("asset5", "black", 15, "John Mathai", 100);

            assertThat(assetA).isEqualTo(assetB);
            assertThat(assetB).isEqualTo(assetC);
            assertThat(assetA).isEqualTo(assetC);
        }

        @Test
        public void handlesInequality() {
            Asset assetA = new Asset("asset5", "black", 15, "John Mathai", 100);
            Asset assetB = new Asset("asset2", "Red", 40, "Anjali Menon", 200);

            assertThat(assetA).isNotEqualTo(assetB);
        }

        @Test
        public void handlesOtherObjects() {
            Asset assetA = new Asset("asset5", "black", 15, "John Mathai", 100);
            String assetB = "not a asset";

            assertThat(assetA).isNotEqualTo(assetB);
        }

        @Test
        public void handlesNull() {
            Asset asset = new Asset("asset5", "black", 15, "John Mathai", 100);

            assertThat(asset).isNotEqualTo(null);
        }
    }

    @Test
    public void toStringIdentifiesAsset() {
        Asset asset = new Asset("asset1", "Blue", 20, "Guy", 100);

        assertThat(asset.toString()).isEqualTo("Asset@e04f6c53 [assetID=asset1, color=Blue, size=20, owner=Guy, appraisedValue=100]");
    }
}
