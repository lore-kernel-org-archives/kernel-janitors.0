From: Colin King <colin.king@canonical.com>
Date: Wed, 20 Feb 2019 09:27:27 +0000
Subject: [PATCH][next] rtlwifi: rtl8192ce: fix typo, "PairwiseENcAlgorithm" -> "PairwiseEncAlgorithm"
Message-Id: <20190220092727.17119-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Larry Finger <Larry.Finger@lwfinger.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is an uppercase 'N' that should be a lowercase 'n', fix this.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/realtek/rtlwifi/rtl8192ce/hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192ce/hw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192ce/hw.c
index 5cf5a85d1376..d8f496e2d68b 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192ce/hw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192ce/hw.c
@@ -876,7 +876,7 @@ void rtl92ce_enable_hw_security_config(struct ieee80211_hw *hw)
 	u8 sec_reg_value;
 
 	RT_TRACE(rtlpriv, COMP_INIT, DBG_LOUD,
-		 "PairwiseENcAlgorithm = %d GroupEncAlgorithm = %d\n",
+		 "PairwiseEncAlgorithm = %d GroupEncAlgorithm = %d\n",
 		 rtlpriv->sec.pairwise_enc_algorithm,
 		 rtlpriv->sec.group_enc_algorithm);
 
-- 
2.20.1
