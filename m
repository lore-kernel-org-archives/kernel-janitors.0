From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 18 Sep 2017 08:13:38 +0000
Subject: [PATCH 1/2] [media] dvb_usb_core: Delete two error messages for a failed memory allocation in dvb_us
Message-Id: <df160cc4-5dbf-b3f0-7ae1-7f323a45eb3f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <38627457-f64f-7356-bf5e-fc41296a26e4@users.sourceforge.net>
In-Reply-To: <38627457-f64f-7356-bf5e-fc41296a26e4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Antti Palosaari <crope@iki.fi>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 18 Sep 2017 09:25:19 +0200

Omit extra messages for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
index 096bb75a24e5..d0fbf0b0b1cb 100644
--- a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
+++ b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
@@ -923,5 +923,4 @@ int dvb_usbv2_probe(struct usb_interface *intf,
 	if (!d) {
-		dev_err(&udev->dev, "%s: kzalloc() failed\n", KBUILD_MODNAME);
 		ret = -ENOMEM;
 		goto err;
 	}
@@ -946,6 +945,4 @@ int dvb_usbv2_probe(struct usb_interface *intf,
 		if (!d->priv) {
-			dev_err(&d->udev->dev, "%s: kzalloc() failed\n",
-					KBUILD_MODNAME);
 			ret = -ENOMEM;
 			goto err_free_all;
 		}
-- 
2.14.1

