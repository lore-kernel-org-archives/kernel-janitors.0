From: Colin King <colin.king@canonical.com>
Date: Thu, 23 Jul 2020 16:32:14 +0000
Subject: [PATCH] rtlwifi: btcoex: remove redundant initialization of variables ant_num and single_ant_path
Message-Id: <20200723163214.995226-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variables ant_num and single_ant_path are being initialized with a
value that is never read and are being updated later with a new value.
The initializations are redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c b/drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c
index a4940a3842de..4949f99844b5 100644
--- a/drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c
+++ b/drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c
@@ -1318,7 +1318,7 @@ bool exhalbtc_bind_bt_coex_withadapter(void *adapter)
 {
 	struct rtl_priv *rtlpriv = adapter;
 	struct btc_coexist *btcoexist = rtl_btc_coexist(rtlpriv);
-	u8 ant_num = 2, chip_type, single_ant_path = 0;
+	u8 ant_num, chip_type, single_ant_path;
 
 	if (!btcoexist)
 		return false;
-- 
2.27.0
