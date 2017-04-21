From: Colin King <colin.king@canonical.com>
Date: Fri, 21 Apr 2017 16:19:31 +0000
Subject: [PATCH] staging: rtl8192u: fix spelling mistake in variable name *attentuation
Message-Id: <20170421161931.14574-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Salah Triki <salah.triki@acm.org>, Binoy Jayan <binoy.jayan@linaro.org>, Jes Sorensen <Jes.Sorensen@redhat.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Fix the spelling of a bunch of variables, from *attentuation to
*attenuation.  No functional change.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8192u/r8192U.h      |  8 ++---
 drivers/staging/rtl8192u/r8192U_core.c | 10 +++---
 drivers/staging/rtl8192u/r8192U_dm.c   | 56 +++++++++++++++++-----------------
 drivers/staging/rtl8192u/r819xU_phy.c  | 34 ++++++++++-----------
 4 files changed, 54 insertions(+), 54 deletions(-)

diff --git a/drivers/staging/rtl8192u/r8192U.h b/drivers/staging/rtl8192u/r8192U.h
index 524c1c94193a..e702afb5a70e 100644
--- a/drivers/staging/rtl8192u/r8192U.h
+++ b/drivers/staging/rtl8192u/r8192U.h
@@ -1041,10 +1041,10 @@ typedef struct r8192_priv {
 	u8 rfc_txpowertrackingindex;
 	u8 rfc_txpowertrackingindex_real;
 
-	s8 cck_present_attentuation;
-	u8 cck_present_attentuation_20Mdefault;
-	u8 cck_present_attentuation_40Mdefault;
-	s8 cck_present_attentuation_difference;
+	s8 cck_present_attenuation;
+	u8 cck_present_attenuation_20Mdefault;
+	u8 cck_present_attenuation_40Mdefault;
+	s8 cck_present_attenuation_difference;
 	bool btxpower_tracking;
 	bool bcck_in_ch14;
 	bool btxpowerdata_readfromEEPORM;
diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
index 8448e83f64f3..9f370e8d84d3 100644
--- a/drivers/staging/rtl8192u/r8192U_core.c
+++ b/drivers/staging/rtl8192u/r8192U_core.c
@@ -3023,14 +3023,14 @@ static bool rtl8192_adapter_start(struct net_device *dev)
 
 			for (i = 0; i < CCKTxBBGainTableLength; i++) {
 				if (TempCCk = priv->cck_txbbgain_table[i].ccktxbb_valuearray[0]) {
-					priv->cck_present_attentuation_20Mdefault = (u8)i;
+					priv->cck_present_attenuation_20Mdefault = (u8)i;
 					break;
 				}
 			}
-			priv->cck_present_attentuation_40Mdefault = 0;
-			priv->cck_present_attentuation_difference = 0;
-			priv->cck_present_attentuation -				priv->cck_present_attentuation_20Mdefault;
+			priv->cck_present_attenuation_40Mdefault = 0;
+			priv->cck_present_attenuation_difference = 0;
+			priv->cck_present_attenuation +				priv->cck_present_attenuation_20Mdefault;
 		}
 	}
 	write_nic_byte(dev, 0x87, 0x0);
diff --git a/drivers/staging/rtl8192u/r8192U_dm.c b/drivers/staging/rtl8192u/r8192U_dm.c
index 623d49585bee..975f707827e1 100644
--- a/drivers/staging/rtl8192u/r8192U_dm.c
+++ b/drivers/staging/rtl8192u/r8192U_dm.c
@@ -598,8 +598,8 @@ static void dm_TXPowerTrackingCallback_TSSI(struct net_device *dev)
 				RT_TRACE(COMP_POWER_TRACKING, "tx power track is done\n");
 				RT_TRACE(COMP_POWER_TRACKING, "priv->rfa_txpowertrackingindex = %d\n", priv->rfa_txpowertrackingindex);
 				RT_TRACE(COMP_POWER_TRACKING, "priv->rfa_txpowertrackingindex_real = %d\n", priv->rfa_txpowertrackingindex_real);
-				RT_TRACE(COMP_POWER_TRACKING, "priv->cck_present_attentuation_difference = %d\n", priv->cck_present_attentuation_difference);
-				RT_TRACE(COMP_POWER_TRACKING, "priv->cck_present_attentuation = %d\n", priv->cck_present_attentuation);
+				RT_TRACE(COMP_POWER_TRACKING, "priv->cck_present_attenuation_difference = %d\n", priv->cck_present_attenuation_difference);
+				RT_TRACE(COMP_POWER_TRACKING, "priv->cck_present_attenuation = %d\n", priv->cck_present_attenuation);
 				return;
 			}
 			if (Avg_TSSI_Meas_from_driver < TSSI_13dBm - E_FOR_TX_POWER_TRACK) {
@@ -618,17 +618,17 @@ static void dm_TXPowerTrackingCallback_TSSI(struct net_device *dev)
 
 				}
 			}
-			priv->cck_present_attentuation_difference
+			priv->cck_present_attenuation_difference
 				= priv->rfa_txpowertrackingindex - priv->rfa_txpowertracking_default;
 
 			if (priv->CurrentChannelBW = HT_CHANNEL_WIDTH_20)
-				priv->cck_present_attentuation
-					= priv->cck_present_attentuation_20Mdefault + priv->cck_present_attentuation_difference;
+				priv->cck_present_attenuation
+					= priv->cck_present_attenuation_20Mdefault + priv->cck_present_attenuation_difference;
 			else
-				priv->cck_present_attentuation
-					= priv->cck_present_attentuation_40Mdefault + priv->cck_present_attentuation_difference;
+				priv->cck_present_attenuation
+					= priv->cck_present_attenuation_40Mdefault + priv->cck_present_attenuation_difference;
 
-			if (priv->cck_present_attentuation > -1 && priv->cck_present_attentuation < 23) {
+			if (priv->cck_present_attenuation > -1 && priv->cck_present_attenuation < 23) {
 				if (priv->ieee80211->current_network.channel = 14 && !priv->bcck_in_ch14) {
 					priv->bcck_in_ch14 = true;
 					dm_cck_txpower_adjust(dev, priv->bcck_in_ch14);
@@ -640,10 +640,10 @@ static void dm_TXPowerTrackingCallback_TSSI(struct net_device *dev)
 			}
 			RT_TRACE(COMP_POWER_TRACKING, "priv->rfa_txpowertrackingindex = %d\n", priv->rfa_txpowertrackingindex);
 			RT_TRACE(COMP_POWER_TRACKING, "priv->rfa_txpowertrackingindex_real = %d\n", priv->rfa_txpowertrackingindex_real);
-			RT_TRACE(COMP_POWER_TRACKING, "priv->cck_present_attentuation_difference = %d\n", priv->cck_present_attentuation_difference);
-			RT_TRACE(COMP_POWER_TRACKING, "priv->cck_present_attentuation = %d\n", priv->cck_present_attentuation);
+			RT_TRACE(COMP_POWER_TRACKING, "priv->cck_present_attenuation_difference = %d\n", priv->cck_present_attenuation_difference);
+			RT_TRACE(COMP_POWER_TRACKING, "priv->cck_present_attenuation = %d\n", priv->cck_present_attenuation);
 
-			if (priv->cck_present_attentuation_difference <= -12 || priv->cck_present_attentuation_difference >= 24) {
+			if (priv->cck_present_attenuation_difference <= -12 || priv->cck_present_attenuation_difference >= 24) {
 				priv->ieee80211->bdynamic_txpower_enable = true;
 				write_nic_byte(dev, 0x1ba, 0);
 				RT_TRACE(COMP_POWER_TRACKING, "tx power track--->limited\n");
@@ -1384,35 +1384,35 @@ static void dm_CCKTxPowerAdjust_TSSI(struct net_device *dev, bool  bInCH14)
 	TempVal = 0;
 	if (!bInCH14) {
 		/* Write 0xa22 0xa23 */
-		TempVal =	priv->cck_txbbgain_table[priv->cck_present_attentuation].ccktxbb_valuearray[0] +
-					(priv->cck_txbbgain_table[priv->cck_present_attentuation].ccktxbb_valuearray[1]<<8);
+		TempVal =	priv->cck_txbbgain_table[priv->cck_present_attenuation].ccktxbb_valuearray[0] +
+					(priv->cck_txbbgain_table[priv->cck_present_attenuation].ccktxbb_valuearray[1]<<8);
 
 		rtl8192_setBBreg(dev, rCCK0_TxFilter1, bMaskHWord, TempVal);
 		/* Write 0xa24 ~ 0xa27 */
-		TempVal =	priv->cck_txbbgain_table[priv->cck_present_attentuation].ccktxbb_valuearray[2] +
-					(priv->cck_txbbgain_table[priv->cck_present_attentuation].ccktxbb_valuearray[3]<<8) +
-					(priv->cck_txbbgain_table[priv->cck_present_attentuation].ccktxbb_valuearray[4]<<16)+
-					(priv->cck_txbbgain_table[priv->cck_present_attentuation].ccktxbb_valuearray[5]<<24);
+		TempVal =	priv->cck_txbbgain_table[priv->cck_present_attenuation].ccktxbb_valuearray[2] +
+					(priv->cck_txbbgain_table[priv->cck_present_attenuation].ccktxbb_valuearray[3]<<8) +
+					(priv->cck_txbbgain_table[priv->cck_present_attenuation].ccktxbb_valuearray[4]<<16)+
+					(priv->cck_txbbgain_table[priv->cck_present_attenuation].ccktxbb_valuearray[5]<<24);
 		rtl8192_setBBreg(dev, rCCK0_TxFilter2, bMaskDWord, TempVal);
 		/* Write 0xa28  0xa29 */
-		TempVal =	priv->cck_txbbgain_table[priv->cck_present_attentuation].ccktxbb_valuearray[6] +
-					(priv->cck_txbbgain_table[priv->cck_present_attentuation].ccktxbb_valuearray[7]<<8);
+		TempVal =	priv->cck_txbbgain_table[priv->cck_present_attenuation].ccktxbb_valuearray[6] +
+					(priv->cck_txbbgain_table[priv->cck_present_attenuation].ccktxbb_valuearray[7]<<8);
 
 		rtl8192_setBBreg(dev, rCCK0_DebugPort, bMaskLWord, TempVal);
 	} else {
-		TempVal =	priv->cck_txbbgain_ch14_table[priv->cck_present_attentuation].ccktxbb_valuearray[0] +
-					(priv->cck_txbbgain_ch14_table[priv->cck_present_attentuation].ccktxbb_valuearray[1]<<8);
+		TempVal =	priv->cck_txbbgain_ch14_table[priv->cck_present_attenuation].ccktxbb_valuearray[0] +
+					(priv->cck_txbbgain_ch14_table[priv->cck_present_attenuation].ccktxbb_valuearray[1]<<8);
 
 		rtl8192_setBBreg(dev, rCCK0_TxFilter1, bMaskHWord, TempVal);
 		/* Write 0xa24 ~ 0xa27 */
-		TempVal =	priv->cck_txbbgain_ch14_table[priv->cck_present_attentuation].ccktxbb_valuearray[2] +
-					(priv->cck_txbbgain_ch14_table[priv->cck_present_attentuation].ccktxbb_valuearray[3]<<8) +
-					(priv->cck_txbbgain_ch14_table[priv->cck_present_attentuation].ccktxbb_valuearray[4]<<16)+
-					(priv->cck_txbbgain_ch14_table[priv->cck_present_attentuation].ccktxbb_valuearray[5]<<24);
+		TempVal =	priv->cck_txbbgain_ch14_table[priv->cck_present_attenuation].ccktxbb_valuearray[2] +
+					(priv->cck_txbbgain_ch14_table[priv->cck_present_attenuation].ccktxbb_valuearray[3]<<8) +
+					(priv->cck_txbbgain_ch14_table[priv->cck_present_attenuation].ccktxbb_valuearray[4]<<16)+
+					(priv->cck_txbbgain_ch14_table[priv->cck_present_attenuation].ccktxbb_valuearray[5]<<24);
 		rtl8192_setBBreg(dev, rCCK0_TxFilter2, bMaskDWord, TempVal);
 		/* Write 0xa28  0xa29 */
-		TempVal =	priv->cck_txbbgain_ch14_table[priv->cck_present_attentuation].ccktxbb_valuearray[6] +
-					(priv->cck_txbbgain_ch14_table[priv->cck_present_attentuation].ccktxbb_valuearray[7]<<8);
+		TempVal =	priv->cck_txbbgain_ch14_table[priv->cck_present_attenuation].ccktxbb_valuearray[6] +
+					(priv->cck_txbbgain_ch14_table[priv->cck_present_attenuation].ccktxbb_valuearray[7]<<8);
 
 		rtl8192_setBBreg(dev, rCCK0_DebugPort, bMaskLWord, TempVal);
 	}
@@ -1495,7 +1495,7 @@ static void dm_txpower_reset_recovery(
 	RT_TRACE(COMP_POWER_TRACKING, "Reset Recovery: Fill in 0xc80 is %08x\n", priv->txbbgain_table[priv->rfa_txpowertrackingindex].txbbgain_value);
 	RT_TRACE(COMP_POWER_TRACKING, "Reset Recovery: Fill in RFA_txPowerTrackingIndex is %x\n", priv->rfa_txpowertrackingindex);
 	RT_TRACE(COMP_POWER_TRACKING, "Reset Recovery : RF A I/Q Amplify Gain is %ld\n", priv->txbbgain_table[priv->rfa_txpowertrackingindex].txbb_iq_amplifygain);
-	RT_TRACE(COMP_POWER_TRACKING, "Reset Recovery: CCK Attenuation is %d dB\n", priv->cck_present_attentuation);
+	RT_TRACE(COMP_POWER_TRACKING, "Reset Recovery: CCK Attenuation is %d dB\n", priv->cck_present_attenuation);
 	dm_cck_txpower_adjust(dev, priv->bcck_in_ch14);
 
 	rtl8192_setBBreg(dev, rOFDM0_XCTxIQImbalance, bMaskDWord, priv->txbbgain_table[priv->rfc_txpowertrackingindex].txbbgain_value);
diff --git a/drivers/staging/rtl8192u/r819xU_phy.c b/drivers/staging/rtl8192u/r819xU_phy.c
index c99130fdb8ee..3874f8307117 100644
--- a/drivers/staging/rtl8192u/r819xU_phy.c
+++ b/drivers/staging/rtl8192u/r819xU_phy.c
@@ -1559,17 +1559,17 @@ void rtl8192_SetBWModeWorkItem(struct net_device *dev)
 				 0x00100000, 1);
 
 		/* Correct the tx power for CCK rate in 20M. */
-		priv->cck_present_attentuation -			priv->cck_present_attentuation_20Mdefault +
-			priv->cck_present_attentuation_difference;
-
-		if (priv->cck_present_attentuation > 22)
-			priv->cck_present_attentuation = 22;
-		if (priv->cck_present_attentuation < 0)
-			priv->cck_present_attentuation = 0;
+		priv->cck_present_attenuation +			priv->cck_present_attenuation_20Mdefault +
+			priv->cck_present_attenuation_difference;
+
+		if (priv->cck_present_attenuation > 22)
+			priv->cck_present_attenuation = 22;
+		if (priv->cck_present_attenuation < 0)
+			priv->cck_present_attenuation = 0;
 		RT_TRACE(COMP_INIT,
 			 "20M, pHalData->CCKPresentAttentuation = %d\n",
-			 priv->cck_present_attentuation);
+			 priv->cck_present_attenuation);
 
 		if (priv->chan = 14 && !priv->bcck_in_ch14) {
 			priv->bcck_in_ch14 = true;
@@ -1590,18 +1590,18 @@ void rtl8192_SetBWModeWorkItem(struct net_device *dev)
 		rtl8192_setBBreg(dev, rFPGA0_AnalogParameter1, 0x00100000, 0);
 		rtl8192_setBBreg(dev, rOFDM1_LSTF, 0xC00,
 				 priv->nCur40MhzPrimeSC);
-		priv->cck_present_attentuation -			priv->cck_present_attentuation_40Mdefault +
-			priv->cck_present_attentuation_difference;
+		priv->cck_present_attenuation +			priv->cck_present_attenuation_40Mdefault +
+			priv->cck_present_attenuation_difference;
 
-		if (priv->cck_present_attentuation > 22)
-			priv->cck_present_attentuation = 22;
-		if (priv->cck_present_attentuation < 0)
-			priv->cck_present_attentuation = 0;
+		if (priv->cck_present_attenuation > 22)
+			priv->cck_present_attenuation = 22;
+		if (priv->cck_present_attenuation < 0)
+			priv->cck_present_attenuation = 0;
 
 		RT_TRACE(COMP_INIT,
 			 "40M, pHalData->CCKPresentAttentuation = %d\n",
-			 priv->cck_present_attentuation);
+			 priv->cck_present_attenuation);
 		if (priv->chan = 14 && !priv->bcck_in_ch14) {
 			priv->bcck_in_ch14 = true;
 			dm_cck_txpower_adjust(dev, priv->bcck_in_ch14);
-- 
2.11.0

