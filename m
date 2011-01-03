From: Dan Carpenter <error27@gmail.com>
Date: Mon, 03 Jan 2011 05:46:29 +0000
Subject: [patch -next] ath5k: ath5k_eeprom_mode_from_channel() returns
Message-Id: <20110103054629.GR1886@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Luis R. Rodriguez" <lrodriguez@atheros.com>
Cc: Nick Kossifidis <mickflemm@gmail.com>, Jiri Slaby <jirislaby@gmail.com>, Bob Copeland <me@bobcopeland.com>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, ath5k-devel@lists.ath5k.org, kernel-janitors@vger.kernel.org

ath5k_eeprom_mode_from_channel() returns -1 on error but we're storing
the result in "ee_mode" which is an unsigned char.  This breaks the
error handling.  This patch makes "ee_mode" an int.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/wireless/ath/ath5k/phy.c b/drivers/net/wireless/ath/ath5k/phy.c
index 9306d5f..78c26fd 100644
--- a/drivers/net/wireless/ath/ath5k/phy.c
+++ b/drivers/net/wireless/ath/ath5k/phy.c
@@ -1916,7 +1916,8 @@ ath5k_hw_set_antenna_mode(struct ath5k_hw *ah, u8 ant_mode)
 	struct ieee80211_channel *channel = ah->ah_current_channel;
 	bool use_def_for_tx, update_def_on_tx, use_def_for_rts, fast_div;
 	bool use_def_for_sg;
-	u8 def_ant, tx_ant, ee_mode;
+	int ee_mode;
+	u8 def_ant, tx_ant;
 	u32 sta_id1 = 0;
 
 	/* if channel is not initialized yet we can't set the antennas
@@ -3081,7 +3082,8 @@ ath5k_hw_txpower(struct ath5k_hw *ah, struct ieee80211_channel *channel,
 {
 	struct ath5k_rate_pcal_info rate_info;
 	struct ieee80211_channel *curr_channel = ah->ah_current_channel;
-	u8 type, ee_mode;
+	int ee_mode;
+	u8 type;
 	int ret;
 
 	if (txpower > AR5K_TUNE_MAX_TXPOWER) {
