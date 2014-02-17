From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 17 Feb 2014 20:04:19 +0000
Subject: [patch] [media] em28xx-cards: don't print a misleading message
Message-Id: <20140217200419.GB9845@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <m.chehab@samsung.com>
Cc: linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

There were some missing curly braces so it always says that the transfer
mode changed even if it didn't.  Also the indenting uses spaces instead
of tabs.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index 4d97a76cc3b0..e8eedd35eea5 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -3329,10 +3329,11 @@ static int em28xx_usb_probe(struct usb_interface *interface,
 
 	/* Select USB transfer types to use */
 	if (has_video) {
-	    if (!dev->analog_ep_isoc || (try_bulk && dev->analog_ep_bulk))
-		dev->analog_xfer_bulk = 1;
-		em28xx_info("analog set to %s mode.\n",
-			    dev->analog_xfer_bulk ? "bulk" : "isoc");
+		if (!dev->analog_ep_isoc || (try_bulk && dev->analog_ep_bulk)) {
+			dev->analog_xfer_bulk = 1;
+			em28xx_info("analog set to %s mode.\n",
+				    dev->analog_xfer_bulk ? "bulk" : "isoc");
+		}
 	}
 	if (has_dvb) {
 	    if (!dev->dvb_ep_isoc || (try_bulk && dev->dvb_ep_bulk))
