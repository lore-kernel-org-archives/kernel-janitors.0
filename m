From: Colin King <colin.king@canonical.com>
Date: Thu, 03 May 2018 14:16:28 +0000
Subject: [PATCH] staging: r8822be: fix typo in variable name "offest" -> "offset"
Message-Id: <20180503141628.32330-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ping-Ke Shih <pkshih@realtek.com>, Larry Finger <Larry.Finger@lwfinger.net>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are multiple occurrances of typos of "offest" that should be
"offset". Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 .../rtlwifi/phydm/rtl8822b/halphyrf_8822b.c   | 34 +++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/rtlwifi/phydm/rtl8822b/halphyrf_8822b.c b/drivers/staging/rtlwifi/phydm/rtl8822b/halphyrf_8822b.c
index ae3e2278fefd..14c3fb52f5b8 100644
--- a/drivers/staging/rtlwifi/phydm/rtl8822b/halphyrf_8822b.c
+++ b/drivers/staging/rtlwifi/phydm/rtl8822b/halphyrf_8822b.c
@@ -29,7 +29,7 @@
 static bool
 get_mix_mode_tx_agc_bb_swing_offset_8822b(void *dm_void,
 					  enum pwrtrack_method method,
-					  u8 rf_path, u8 tx_power_index_offest)
+					  u8 rf_path, u8 tx_power_index_offset)
 {
 	struct phy_dm_struct *dm = (struct phy_dm_struct *)dm_void;
 	struct dm_rf_calibration_struct *cali_info = &dm->rf_calibrate_info;
@@ -42,24 +42,24 @@ get_mix_mode_tx_agc_bb_swing_offset_8822b(void *dm_void,
 
 	ODM_RT_TRACE(
 		dm, ODM_COMP_TX_PWR_TRACK,
-		"Path_%d cali_info->absolute_ofdm_swing_idx[rf_path]=%d, tx_power_index_offest=%d\n",
+		"Path_%d cali_info->absolute_ofdm_swing_idx[rf_path]=%d, tx_power_index_offset=%d\n",
 		rf_path, cali_info->absolute_ofdm_swing_idx[rf_path],
-		tx_power_index_offest);
+		tx_power_index_offset);
 
-	if (tx_power_index_offest > 0XF)
-		tx_power_index_offest = 0XF;
+	if (tx_power_index_offset > 0XF)
+		tx_power_index_offset = 0XF;
 
 	if (cali_info->absolute_ofdm_swing_idx[rf_path] >= 0 &&
 	    cali_info->absolute_ofdm_swing_idx[rf_path] <-		    tx_power_index_offest) {
+		    tx_power_index_offset) {
 		tx_agc_index = cali_info->absolute_ofdm_swing_idx[rf_path];
 		tx_bb_swing_index = cali_info->default_ofdm_index;
 	} else if (cali_info->absolute_ofdm_swing_idx[rf_path] >
-		   tx_power_index_offest) {
-		tx_agc_index = tx_power_index_offest;
+		   tx_power_index_offset) {
+		tx_agc_index = tx_power_index_offset;
 		cali_info->remnant_ofdm_swing_idx[rf_path]  			cali_info->absolute_ofdm_swing_idx[rf_path] -
-			tx_power_index_offest;
+			tx_power_index_offset;
 		tx_bb_swing_index = cali_info->default_ofdm_index +
 				    cali_info->remnant_ofdm_swing_idx[rf_path];
 
@@ -85,9 +85,9 @@ get_mix_mode_tx_agc_bb_swing_offset_8822b(void *dm_void,
 
 	ODM_RT_TRACE(
 		dm, ODM_COMP_TX_PWR_TRACK,
-		"MixMode Offset Path_%d   cali_info->absolute_ofdm_swing_idx[rf_path]=%d   cali_info->bb_swing_idx_ofdm[rf_path]=%d   tx_power_index_offest=%d\n",
+		"MixMode Offset Path_%d   cali_info->absolute_ofdm_swing_idx[rf_path]=%d   cali_info->bb_swing_idx_ofdm[rf_path]=%d   tx_power_index_offset=%d\n",
 		rf_path, cali_info->absolute_ofdm_swing_idx[rf_path],
-		cali_info->bb_swing_idx_ofdm[rf_path], tx_power_index_offest);
+		cali_info->bb_swing_idx_ofdm[rf_path], tx_power_index_offset);
 
 	return true;
 }
@@ -97,7 +97,7 @@ void odm_tx_pwr_track_set_pwr8822b(void *dm_void, enum pwrtrack_method method,
 {
 	struct phy_dm_struct *dm = (struct phy_dm_struct *)dm_void;
 	struct dm_rf_calibration_struct *cali_info = &dm->rf_calibrate_info;
-	u8 tx_power_index_offest = 0;
+	u8 tx_power_index_offset = 0;
 	u8 tx_power_index = 0;
 
 	struct rtl_priv *rtlpriv = (struct rtl_priv *)dm->adapter;
@@ -139,11 +139,11 @@ void odm_tx_pwr_track_set_pwr8822b(void *dm_void, enum pwrtrack_method method,
 	if (tx_power_index >= 63)
 		tx_power_index = 63;
 
-	tx_power_index_offest = 63 - tx_power_index;
+	tx_power_index_offset = 63 - tx_power_index;
 
 	ODM_RT_TRACE(dm, ODM_COMP_TX_PWR_TRACK,
-		     "tx_power_index=%d tx_power_index_offest=%d rf_path=%d\n",
-		     tx_power_index, tx_power_index_offest, rf_path);
+		     "tx_power_index=%d tx_power_index_offset=%d rf_path=%d\n",
+		     tx_power_index, tx_power_index_offset, rf_path);
 
 	if (method =
 	    BBSWING) { /*use for mp driver clean power tracking status*/
@@ -178,7 +178,7 @@ void odm_tx_pwr_track_set_pwr8822b(void *dm_void, enum pwrtrack_method method,
 		switch (rf_path) {
 		case ODM_RF_PATH_A:
 			get_mix_mode_tx_agc_bb_swing_offset_8822b(
-				dm, method, rf_path, tx_power_index_offest);
+				dm, method, rf_path, tx_power_index_offset);
 			odm_set_bb_reg(
 				dm, 0xC94, (BIT(29) | BIT(28) | BIT(27) |
 					    BIT(26) | BIT(25)),
@@ -201,7 +201,7 @@ void odm_tx_pwr_track_set_pwr8822b(void *dm_void, enum pwrtrack_method method,
 
 		case ODM_RF_PATH_B:
 			get_mix_mode_tx_agc_bb_swing_offset_8822b(
-				dm, method, rf_path, tx_power_index_offest);
+				dm, method, rf_path, tx_power_index_offset);
 			odm_set_bb_reg(
 				dm, 0xE94, (BIT(29) | BIT(28) | BIT(27) |
 					    BIT(26) | BIT(25)),
-- 
2.17.0

