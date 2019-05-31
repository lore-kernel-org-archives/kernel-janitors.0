From: Colin King <colin.king@canonical.com>
Date: Fri, 31 May 2019 14:14:12 +0000
Subject: [PATCH] rtlwifi: remove redundant assignment to variable k
Message-Id: <20190531141412.18632-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190530184044.8479-1-colin.king@canonical.com>
In-Reply-To: <20190530184044.8479-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The assignment of 0 to variable k is never read once we break out of
the loop, so the assignment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/realtek/rtlwifi/efuse.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/efuse.c b/drivers/net/wireless/realtek/rtlwifi/efuse.c
index e68340dfd980..83e5318ca04f 100644
--- a/drivers/net/wireless/realtek/rtlwifi/efuse.c
+++ b/drivers/net/wireless/realtek/rtlwifi/efuse.c
@@ -117,10 +117,8 @@ u8 efuse_read_1byte(struct ieee80211_hw *hw, u16 address)
 						 rtlpriv->cfg->
 						 maps[EFUSE_CTRL] + 3);
 			k++;
-			if (k = 1000) {
-				k = 0;
+			if (k = 1000)
 				break;
-			}
 		}
 		data = rtl_read_byte(rtlpriv, rtlpriv->cfg->maps[EFUSE_CTRL]);
 		return data;
-- 
2.20.1
