From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 14 Sep 2017 10:31:43 +0000
Subject: [PATCH 1/8] [media] ttusb_dec: Use common error handling code in ttusb_dec_init_dvb()
Message-Id: <996e39c1-b041-1bfa-b2e2-ab94ca2450ed@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <66b087d3-6dd3-1e1c-d33d-e34c9e2ffe25@users.sourceforge.net>
In-Reply-To: <66b087d3-6dd3-1e1c-d33d-e34c9e2ffe25@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Arvind Yadav <arvind.yadav.cs@gmail.com>, Hans Verkuil <hans.verkuil@cisco.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 13 Sep 2017 18:08:19 +0200

Add jump targets so that a bit of exception handling can be better reused
at the end of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/usb/ttusb-dec/ttusb_dec.c | 43 ++++++++++++---------------------
 1 file changed, 15 insertions(+), 28 deletions(-)

diff --git a/drivers/media/usb/ttusb-dec/ttusb_dec.c b/drivers/media/usb/ttusb-dec/ttusb_dec.c
index cdefb5dfbbdc..0bc80daf6e2e 100644
--- a/drivers/media/usb/ttusb-dec/ttusb_dec.c
+++ b/drivers/media/usb/ttusb-dec/ttusb_dec.c
@@ -1508,10 +1508,7 @@ static int ttusb_dec_init_dvb(struct ttusb_dec *dec)
 	if ((result = dvb_dmx_init(&dec->demux)) < 0) {
 		printk("%s: dvb_dmx_init failed: error %d\n", __func__,
 		       result);
-
-		dvb_unregister_adapter(&dec->adapter);
-
-		return result;
+		goto unregister_adapter;
 	}
 
 	dec->dmxdev.filternum = 32;
@@ -1521,43 +1518,33 @@ static int ttusb_dec_init_dvb(struct ttusb_dec *dec)
 	if ((result = dvb_dmxdev_init(&dec->dmxdev, &dec->adapter)) < 0) {
 		printk("%s: dvb_dmxdev_init failed: error %d\n",
 		       __func__, result);
-
-		dvb_dmx_release(&dec->demux);
-		dvb_unregister_adapter(&dec->adapter);
-
-		return result;
+		goto release_demux;
 	}
 
 	dec->frontend.source = DMX_FRONTEND_0;
 
-	if ((result = dec->demux.dmx.add_frontend(&dec->demux.dmx,
-						  &dec->frontend)) < 0) {
-		printk("%s: dvb_dmx_init failed: error %d\n", __func__,
-		       result);
-
-		dvb_dmxdev_release(&dec->dmxdev);
-		dvb_dmx_release(&dec->demux);
-		dvb_unregister_adapter(&dec->adapter);
-
-		return result;
-	}
+	result = dec->demux.dmx.add_frontend(&dec->demux.dmx, &dec->frontend);
+	if (result < 0)
+		goto report_failure;
 
 	if ((result = dec->demux.dmx.connect_frontend(&dec->demux.dmx,
 						      &dec->frontend)) < 0) {
-		printk("%s: dvb_dmx_init failed: error %d\n", __func__,
-		       result);
-
 		dec->demux.dmx.remove_frontend(&dec->demux.dmx, &dec->frontend);
-		dvb_dmxdev_release(&dec->dmxdev);
-		dvb_dmx_release(&dec->demux);
-		dvb_unregister_adapter(&dec->adapter);
-
-		return result;
+		goto report_failure;
 	}
 
 	dvb_net_init(&dec->adapter, &dec->dvb_net, &dec->demux.dmx);
 
 	return 0;
+
+report_failure:
+	printk("%s: dvb_dmx_init failed: error %d\n", __func__, result);
+	dvb_dmxdev_release(&dec->dmxdev);
+release_demux:
+	dvb_dmx_release(&dec->demux);
+unregister_adapter:
+	dvb_unregister_adapter(&dec->adapter);
+	return result;
 }
 
 static void ttusb_dec_exit_dvb(struct ttusb_dec *dec)
-- 
2.14.1

