From: Miguel Oliveira <cmroliv@gmail.com>
Date: Thu, 29 May 2014 21:53:56 +0000
Subject: [PATCH] Fixed coding style problem
Message-Id: <1401400436-4396-1-git-send-email-cmroliv@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Miguel Oliveira <cmroliv@gmail.com>
---
 drivers/staging/wlan-ng/p80211req.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/wlan-ng/p80211req.c b/drivers/staging/wlan-ng/p80211req.c
index cdfd808..3b3fccc 100644
--- a/drivers/staging/wlan-ng/p80211req.c
+++ b/drivers/staging/wlan-ng/p80211req.c
@@ -109,7 +109,7 @@ int p80211req_dorequest(wlandevice_t *wlandev, u8 *msgbuf)
 	/* Check Permissions */
 	if (!capable(CAP_NET_ADMIN) &&
 	(msg->msgcode != DIDmsg_dot11req_mibget)) {
-		printk(KERN_ERR
+		netdev_err(netdev,
 		       "%s: only dot11req_mibget allowed for non-root.\n",
 		       wlandev->name);
 		return -EPERM;
--
1.7.10.4

