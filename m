From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 07 Oct 2019 08:48:05 +0000
Subject: [PATCH] rtw88: Fix an error message
Message-Id: <20191007084805.GA3865@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190814104642.GA14268@mwanda>
In-Reply-To: <20190814104642.GA14268@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yan-Hsuan Chuang <yhchuang@realtek.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

The WARN_ON() macro doesn't take an error message, the argument is a
condition so this won't display the warning message.

Fixes: 27e117e4b01b ("rtw88: add deep power save support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/realtek/rtw88/ps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/ps.c b/drivers/net/wireless/realtek/rtw88/ps.c
index 83db6cf6a219..228309b411ec 100644
--- a/drivers/net/wireless/realtek/rtw88/ps.c
+++ b/drivers/net/wireless/realtek/rtw88/ps.c
@@ -108,7 +108,7 @@ void rtw_power_mode_change(struct rtw_dev *rtwdev, bool enter)
 		 * read/write. It should be treated as fatal error and
 		 * requires an entire analysis about the firmware/hardware
 		 */
-		WARN_ON("Hardware power state locked\n");
+		WARN(1, "Hardware power state locked\n");
 	}
 }
 EXPORT_SYMBOL(rtw_power_mode_change);
-- 
2.20.1
