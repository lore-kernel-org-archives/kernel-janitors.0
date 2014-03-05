From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 05 Mar 2014 11:09:37 +0000
Subject: [patch v2] [patch] [media] em28xx-cards: remove a wrong indent level
Message-Id: <20140305110937.GC16926@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <530B8995.8030807@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <m.chehab@samsung.com>
Cc: linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

This code is correct but the indenting is wrong and triggers a static
checker warning "add curly braces?".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: in v1 I added curly braces.

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index 4d97a76cc3b0..33f06ffec4b2 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -3331,8 +3331,8 @@ static int em28xx_usb_probe(struct usb_interface *interface,
 	if (has_video) {
 	    if (!dev->analog_ep_isoc || (try_bulk && dev->analog_ep_bulk))
 		dev->analog_xfer_bulk = 1;
-		em28xx_info("analog set to %s mode.\n",
-			    dev->analog_xfer_bulk ? "bulk" : "isoc");
+	    em28xx_info("analog set to %s mode.\n",
+			dev->analog_xfer_bulk ? "bulk" : "isoc");
 	}
 	if (has_dvb) {
 	    if (!dev->dvb_ep_isoc || (try_bulk && dev->dvb_ep_bulk))
