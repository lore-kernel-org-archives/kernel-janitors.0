From: Maximiliano David Bustos <md.bustos90@gmail.com>
Date: Mon, 08 Nov 2010 20:35:35 +0000
Subject: [PATCH 2/2] Staging: wlan-ng: Fix lines over 80 characters in p80211netdev.c
Message-Id: <1289248535-10792-1-git-send-email-md.bustos90@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch fixes over 80 characters bugs reported by checkpatch.pl
Signed-off-by: Maximiliano David Bustos <md.bustos90@gmail.com>
---
 drivers/staging/wlan-ng/p80211netdev.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/wlan-ng/p80211netdev.c b/drivers/staging/wlan-ng/p80211netdev.c
index b7b4a73..314eff0 100644
--- a/drivers/staging/wlan-ng/p80211netdev.c
+++ b/drivers/staging/wlan-ng/p80211netdev.c
@@ -301,7 +301,8 @@ static void p80211netdev_rx_bh(unsigned long arg)
 					if (memcmp
 					    (hdr->a1, wlandev->netdev->dev_addr,
 					     ETH_ALEN) != 0) {
-						/* but reject anything else that isn't multicast */
+						/* but reject anything else that
+						 isn't multicast */
 						if (!(hdr->a1[0] & 0x01)) {
 							dev_kfree_skb(skb);
 							continue;
@@ -770,7 +771,8 @@ int wlan_setup(wlandevice_t *wlandev, struct device *physdev)
 	}
 
 	/* Allocate and initialize the struct device */
-	netdev = alloc_netdev(sizeof(struct wireless_dev), "wlan%d", ether_setup);
+	netdev = alloc_netdev(sizeof(struct wireless_dev), "wlan%d",
+			      ether_setup);
 	if (netdev = NULL) {
 		printk(KERN_ERR "Failed to alloc netdev.\n");
 		wlan_free_wiphy(wiphy);
-- 
1.7.1

