From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Fri, 18 Jan 2019 07:29:52 +0000
Subject: [PATCH net-next] virt_wifi: fix error return code in virt_wifi_newlink()
Message-Id: <1547796592-99034-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, Cody Schuffelen <schuffelen@google.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix to return a negative error code from the error handling
case instead of 0, as done elsewhere in this function.

Fixes: c7cdba31ed8b ("mac80211-next: rtnetlink wifi simulation device")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/wireless/virt_wifi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/virt_wifi.c b/drivers/net/wireless/virt_wifi.c
index 64b2186..3a93e4d 100644
--- a/drivers/net/wireless/virt_wifi.c
+++ b/drivers/net/wireless/virt_wifi.c
@@ -530,8 +530,10 @@ static int virt_wifi_newlink(struct net *src_net, struct net_device *dev,
 	SET_NETDEV_DEV(dev, &priv->lowerdev->dev);
 	dev->ieee80211_ptr = kzalloc(sizeof(*dev->ieee80211_ptr), GFP_KERNEL);
 
-	if (!dev->ieee80211_ptr)
+	if (!dev->ieee80211_ptr) {
+		err = -ENOMEM;
 		goto remove_handler;
+	}
 
 	dev->ieee80211_ptr->iftype = NL80211_IFTYPE_STATION;
 	dev->ieee80211_ptr->wiphy = common_wiphy;
