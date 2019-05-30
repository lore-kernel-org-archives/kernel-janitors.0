From: Colin King <colin.king@canonical.com>
Date: Thu, 30 May 2019 18:40:44 +0000
Subject: [PATCH] rtlwifi: remove redundant assignment to variable badworden
Message-Id: <20190530184044.8479-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable badworden is assigned with a value that is never read and
it is re-assigned a new value immediately afterwards.  The assignment is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/realtek/rtlwifi/efuse.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/efuse.c b/drivers/net/wireless/realtek/rtlwifi/efuse.c
index e68340dfd980..37ab582a8afb 100644
--- a/drivers/net/wireless/realtek/rtlwifi/efuse.c
+++ b/drivers/net/wireless/realtek/rtlwifi/efuse.c
@@ -986,7 +986,6 @@ static int efuse_pg_packet_write(struct ieee80211_hw *hw,
 		} else if (write_state = PG_STATE_DATA) {
 			RTPRINT(rtlpriv, FEEPROM, EFUSE_PG,
 				"efuse PG_STATE_DATA\n");
-			badworden = 0x0f;
 			badworden  			    enable_efuse_data_write(hw, efuse_addr + 1,
 						    target_pkt.word_en,
-- 
2.20.1
