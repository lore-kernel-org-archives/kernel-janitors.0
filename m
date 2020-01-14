From: Colin King <colin.king@canonical.com>
Date: Tue, 14 Jan 2020 16:56:01 +0000
Subject: [PATCH] rtlwifi: rtl8188ee: remove redundant assignment to variable cond
Message-Id: <20200114165601.374597-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190608105800.26571-1-colin.king@canonical.com>
In-Reply-To: <20190608105800.26571-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable cond is being assigned with a value that is never
read, it is assigned a new value later on. The assignment is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/realtek/rtlwifi/rtl8188ee/phy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/phy.c b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/phy.c
index 5ca900f97d66..d13983ec09ad 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/phy.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/phy.c
@@ -264,7 +264,7 @@ static bool _rtl88e_check_condition(struct ieee80211_hw *hw,
 	u32 _board = rtlefuse->board_type; /*need efuse define*/
 	u32 _interface = rtlhal->interface;
 	u32 _platform = 0x08;/*SupportPlatform */
-	u32 cond = condition;
+	u32 cond;
 
 	if (condition = 0xCDCDCDCD)
 		return true;
-- 
2.24.0
