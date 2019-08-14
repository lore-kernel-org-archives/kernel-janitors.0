From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Aug 2019 10:46:42 +0000
Subject: [PATCH] rtw88: Fix an error message
Message-Id: <20190814104642.GA14268@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yan-Hsuan Chuang <yhchuang@realtek.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

The WARN_ON() macro takes a condition, not a warning message.  I've
changed this to use WARN() instead.

Fixes: 4136214f7c46 ("rtw88: add BT co-existence support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/realtek/rtw88/coex.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/coex.c b/drivers/net/wireless/realtek/rtw88/coex.c
index 4577fceddc5e..13701ec40302 100644
--- a/drivers/net/wireless/realtek/rtw88/coex.c
+++ b/drivers/net/wireless/realtek/rtw88/coex.c
@@ -1059,7 +1059,7 @@ static void rtw_coex_set_ant_path(struct rtw_dev *rtwdev, bool force, u8 phase)
 		pos_type = COEX_SWITCH_TO_WLG_BT;
 		break;
 	default:
-		WARN_ON("unknown phase when setting antenna path\n");
+		WARN(1, "unknown phase when setting antenna path\n");
 		return;
 	}
 
-- 
2.20.1
