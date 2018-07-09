From: Colin King <colin.king@canonical.com>
Date: Mon, 09 Jul 2018 12:41:38 +0000
Subject: [PATCH] ath5k: remove redundant pointer rf
Message-Id: <20180709124138.14996-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Slaby <jirislaby@gmail.com>, Nick Kossifidis <mickflemm@gmail.com>, "Luis R . Rodriguez" <mcgrof@do-not-panic.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer rf is being assigned but is never used hence it is redundant
and can be removed.

Cleans up two clang warnings:
warning: variable 'rf' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath5k/phy.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath5k/phy.c b/drivers/net/wireless/ath/ath5k/phy.c
index b1b8bc326830..ae08572c4b58 100644
--- a/drivers/net/wireless/ath/ath5k/phy.c
+++ b/drivers/net/wireless/ath/ath5k/phy.c
@@ -483,7 +483,6 @@ static u32
 ath5k_hw_rf_gainf_corr(struct ath5k_hw *ah)
 {
 	u32 mix, step;
-	u32 *rf;
 	const struct ath5k_gain_opt *go;
 	const struct ath5k_gain_opt_step *g_step;
 	const struct ath5k_rf_reg *rf_regs;
@@ -502,7 +501,6 @@ ath5k_hw_rf_gainf_corr(struct ath5k_hw *ah)
 	if (ah->ah_rf_banks = NULL)
 		return 0;
 
-	rf = ah->ah_rf_banks;
 	ah->ah_gain.g_f_corr = 0;
 
 	/* No VGA (Variable Gain Amplifier) override, skip */
@@ -549,13 +547,10 @@ ath5k_hw_rf_check_gainf_readback(struct ath5k_hw *ah)
 {
 	const struct ath5k_rf_reg *rf_regs;
 	u32 step, mix_ovr, level[4];
-	u32 *rf;
 
 	if (ah->ah_rf_banks = NULL)
 		return false;
 
-	rf = ah->ah_rf_banks;
-
 	if (ah->ah_radio = AR5K_RF5111) {
 
 		rf_regs = rf_regs_5111;
-- 
2.17.1

