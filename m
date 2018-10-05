From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 05 Oct 2018 04:15:45 +0000
Subject: [PATCH] b43: remove set but not used variable 'wl'
Message-Id: <1538712945-141866-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, Colin Ian King <colin.king@canonical.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-wireless@vger.kernel.org, b43-dev@lists.infradead.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/wireless/broadcom/b43/main.c: In function 'b43_one_core_detach':
drivers/net/wireless/broadcom/b43/main.c:5496:17: warning:
 variable 'wl' set but not used [-Wunused-but-set-variable]
 
After commit 644aa4d62096 ("b43: remove list of IEEE 802.11 devices")
'wl' is not used any more.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/wireless/broadcom/b43/main.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/broadcom/b43/main.c b/drivers/net/wireless/broadcom/b43/main.c
index 4daa1ce..74be3c8 100644
--- a/drivers/net/wireless/broadcom/b43/main.c
+++ b/drivers/net/wireless/broadcom/b43/main.c
@@ -5493,13 +5493,11 @@ static int b43_wireless_core_attach(struct b43_wldev *dev)
 static void b43_one_core_detach(struct b43_bus_dev *dev)
 {
 	struct b43_wldev *wldev;
-	struct b43_wl *wl;
 
 	/* Do not cancel ieee80211-workqueue based work here.
 	 * See comment in b43_remove(). */
 
 	wldev = b43_bus_get_wldev(dev);
-	wl = wldev->wl;
 	b43_debugfs_remove_device(wldev);
 	b43_wireless_core_detach(wldev);
 	list_del(&wldev->list);
