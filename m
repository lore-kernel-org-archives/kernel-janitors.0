From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 17 Jan 2019 03:17:03 +0000
Subject: [PATCH v2] virt_wifi: remove set but not used variable 'w_priv'
Message-Id: <1547695023-71081-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545274318-144187-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1545274318-144187-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/wireless/virt_wifi.c: In function 'virt_wifi_net_device_stop':
drivers/net/wireless/virt_wifi.c:432:31: warning:
 variable 'w_priv' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
v2: fix prefix to 'virt_wifi:'
---
 drivers/net/wireless/virt_wifi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/virt_wifi.c b/drivers/net/wireless/virt_wifi.c
index 64b2186..ea10f58 100644
--- a/drivers/net/wireless/virt_wifi.c
+++ b/drivers/net/wireless/virt_wifi.c
@@ -429,13 +429,11 @@ static int virt_wifi_net_device_open(struct net_device *dev)
 static int virt_wifi_net_device_stop(struct net_device *dev)
 {
 	struct virt_wifi_netdev_priv *n_priv = netdev_priv(dev);
-	struct virt_wifi_wiphy_priv *w_priv;
 
 	n_priv->is_up = false;
 
 	if (!dev->ieee80211_ptr)
 		return 0;
-	w_priv = wiphy_priv(dev->ieee80211_ptr->wiphy);
 
 	virt_wifi_cancel_scan(dev->ieee80211_ptr->wiphy);
 	virt_wifi_cancel_connect(dev);
