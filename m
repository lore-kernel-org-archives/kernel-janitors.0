From: Kulikov Vasiliy <segooon@gmail.com>
Date: Mon, 26 Jul 2010 08:25:42 +0000
Subject: [PATCH] usbnet: use jiffies in schedule_timeout(), not msecs
Message-Id: <1280132742-8126-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: David Brownell <dbrownell@users.sourceforge.net>, Greg Kroah-Hartman <gregkh@suse.de>, "David S. Miller" <davem@davemloft.net>, Ben Hutchings <ben@decadent.org.uk>, Joe Perches <joe@perches.com>, Stephen Hemminger <shemminger@vyatta.com>, Jussi Kivilinna <jussi.kivilinna@mbnet.fi>, netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

usbnet_terminate_urbs() uses schedule_timeout() with argument 3 msecs.
schedule_timeout() uses jiffies as argument, so convert msecs to jiffies
with msecs_to_jiffies().

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/net/usb/usbnet.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index 7eab407..b243386 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -624,7 +624,7 @@ static void usbnet_terminate_urbs(struct usbnet *dev)
 	while (!skb_queue_empty(&dev->rxq)
 		&& !skb_queue_empty(&dev->txq)
 		&& !skb_queue_empty(&dev->done)) {
-			schedule_timeout(UNLINK_TIMEOUT_MS);
+			schedule_timeout(msecs_to_jiffies(UNLINK_TIMEOUT_MS));
 			set_current_state(TASK_UNINTERRUPTIBLE);
 			netif_dbg(dev, ifdown, dev->net,
 				  "waited for %d urb completions\n", temp);
-- 
1.7.0.4

