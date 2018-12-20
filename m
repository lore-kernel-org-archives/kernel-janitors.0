From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 20 Dec 2018 02:51:25 +0000
Subject: [PATCH] mac80211-next: remove duplicated include from virt_wifi.c
Message-Id: <1545274285-143886-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/wireless/virt_wifi.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/wireless/virt_wifi.c b/drivers/net/wireless/virt_wifi.c
index 64b2186..245d4d0 100644
--- a/drivers/net/wireless/virt_wifi.c
+++ b/drivers/net/wireless/virt_wifi.c
@@ -14,11 +14,6 @@
 #include <linux/etherdevice.h>
 #include <linux/module.h>
 
-#include <net/cfg80211.h>
-#include <net/rtnetlink.h>
-#include <linux/etherdevice.h>
-#include <linux/module.h>
-
 static struct wiphy *common_wiphy;
 
 struct virt_wifi_wiphy_priv {
