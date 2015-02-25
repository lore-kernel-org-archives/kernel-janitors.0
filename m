From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Feb 2015 13:24:51 +0000
Subject: [patch] rtlwifi: rtl8188ee: missing curly braces in handle_branch1()
Message-Id: <20150225132451.GL19745@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Chaoming Li <chaoming_li@realsil.com.cn>, Kalle Valo <kvalo@codeaurora.org>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

From the indenting, it seems like the READ_NEXT_PAIR() was supposed to
be inside the while loop.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/rtlwifi/rtl8188ee/phy.c b/drivers/net/wireless/rtlwifi/rtl8188ee/phy.c
index 3f6c59c..a2bb02c 100644
--- a/drivers/net/wireless/rtlwifi/rtl8188ee/phy.c
+++ b/drivers/net/wireless/rtlwifi/rtl8188ee/phy.c
@@ -452,9 +452,10 @@ static void handle_branch1(struct ieee80211_hw *hw, u16 arraylen,
 				READ_NEXT_PAIR(v1, v2, i);
 				while (v2 != 0xDEAD &&
 				       v2 != 0xCDEF &&
-				       v2 != 0xCDCD && i < arraylen - 2)
+				       v2 != 0xCDCD && i < arraylen - 2) {
 					_rtl8188e_config_bb_reg(hw, v1, v2);
 					READ_NEXT_PAIR(v1, v2, i);
+				}
 
 				while (v2 != 0xDEAD && i < arraylen - 2)
 					READ_NEXT_PAIR(v1, v2, i);
