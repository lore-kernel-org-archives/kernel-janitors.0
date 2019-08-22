From: Colin King <colin.king@canonical.com>
Date: Thu, 22 Aug 2019 11:37:28 +0000
Subject: [PATCH] rtw88: remove redundant assignment to pointer debugfs_topdir
Message-Id: <20190822113728.25494-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yan-Hsuan Chuang <yhchuang@realtek.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer debugfs_topdir is initialized to a value that is never read
and it is re-assigned later. The initialization is redundant and can
be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/realtek/rtw88/debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/debug.c b/drivers/net/wireless/realtek/rtw88/debug.c
index 383b04c16703..5d235968d475 100644
--- a/drivers/net/wireless/realtek/rtw88/debug.c
+++ b/drivers/net/wireless/realtek/rtw88/debug.c
@@ -672,7 +672,7 @@ static struct rtw_debugfs_priv rtw_debug_priv_rsvd_page = {
 
 void rtw_debugfs_init(struct rtw_dev *rtwdev)
 {
-	struct dentry *debugfs_topdir = rtwdev->debugfs;
+	struct dentry *debugfs_topdir;
 
 	debugfs_topdir = debugfs_create_dir("rtw88",
 					    rtwdev->hw->wiphy->debugfsdir);
-- 
2.20.1
