From: Colin King <colin.king@canonical.com>
Date: Thu, 28 Jan 2021 17:10:48 +0000
Subject: [PATCH] rtlwifi: rtl8192se: remove redundant initialization of variable rtstatus
Message-Id: <20210128171048.644669-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable rtstatu is being initialized with a value that is never
read and it is being updated later with a new value.  The initialization
is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/realtek/rtlwifi/rtl8192se/phy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192se/phy.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192se/phy.c
index 63283d9e7485..aaa004d4d6d0 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192se/phy.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192se/phy.c
@@ -1017,7 +1017,7 @@ bool rtl92s_phy_bb_config(struct ieee80211_hw *hw)
 {
 	struct rtl_priv *rtlpriv = rtl_priv(hw);
 	struct rtl_phy *rtlphy = &(rtlpriv->phy);
-	bool rtstatus = true;
+	bool rtstatus;
 	u8 pathmap, index, rf_num = 0;
 	u8 path1, path2;
 
-- 
2.29.2
