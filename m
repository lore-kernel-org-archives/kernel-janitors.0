From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 13 Oct 2016 16:30:48 +0000
Subject: [PATCH 09/18] [media] RedRat3: Move a variable assignment in redrat3_dev_probe()
Message-Id: <da74cc6f-55e8-0c7e-1ab8-8ad6739364af@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <81cef537-4ad0-3a74-8bde-94707dcd03f4@users.sourceforge.net>
In-Reply-To: <81cef537-4ad0-3a74-8bde-94707dcd03f4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>, Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 13 Oct 2016 14:07:03 +0200

* One local variable was set to an error code before a concrete
  error situation was detected. Thus move the corresponding assignment
  into three if branches to indicate a memory allocation failure there.

* Adjust a jump label according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/rc/redrat3.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/media/rc/redrat3.c b/drivers/media/rc/redrat3.c
index f6c21a1..f85117b 100644
--- a/drivers/media/rc/redrat3.c
+++ b/drivers/media/rc/redrat3.c
@@ -912,7 +912,7 @@ static int redrat3_dev_probe(struct usb_interface *intf,
 	struct usb_endpoint_descriptor *ep_out =3D NULL;
 	u8 addr, attrs;
 	int pipe, i;
-	int retval =3D -ENOMEM;
+	int retval;
=20
 	uhi =3D intf->cur_altsetting;
=20
@@ -951,21 +951,27 @@ static int redrat3_dev_probe(struct usb_interface *in=
tf,
=20
 	/* allocate memory for our device state and initialize it */
 	rr3 =3D kzalloc(sizeof(*rr3), GFP_KERNEL);
-	if (!rr3)
+	if (!rr3) {
+		retval =3D -ENOMEM;
 		goto no_endpoints;
+	}
=20
 	rr3->dev =3D &intf->dev;
=20
 	/* set up bulk-in endpoint */
 	rr3->read_urb =3D usb_alloc_urb(0, GFP_KERNEL);
-	if (!rr3->read_urb)
-		goto error;
+	if (!rr3->read_urb) {
+		retval =3D -ENOMEM;
+		goto delete_rr;
+	}
=20
 	rr3->ep_in =3D ep_in;
 	rr3->bulk_in_buf =3D usb_alloc_coherent(udev,
 		le16_to_cpu(ep_in->wMaxPacketSize), GFP_KERNEL, &rr3->dma_in);
-	if (!rr3->bulk_in_buf)
-		goto error;
+	if (!rr3->bulk_in_buf) {
+		retval =3D -ENOMEM;
+		goto delete_rr;
+	}
=20
 	pipe =3D usb_rcvbulkpipe(udev, ep_in->bEndpointAddress);
 	usb_fill_bulk_urb(rr3->read_urb, udev, pipe, rr3->bulk_in_buf,
@@ -982,7 +988,7 @@ static int redrat3_dev_probe(struct usb_interface *intf,
 	/* might be all we need to do? */
 	retval =3D redrat3_enable_detector(rr3);
 	if (retval < 0)
-		goto error;
+		goto delete_rr;
=20
 	/* store current hardware timeout, in =C2=B5s */
 	rr3->hw_timeout =3D redrat3_get_timeout(rr3);
@@ -996,7 +1002,7 @@ static int redrat3_dev_probe(struct usb_interface *int=
f,
 	rr3->led.brightness_set =3D redrat3_brightness_set;
 	retval =3D led_classdev_register(&intf->dev, &rr3->led);
 	if (retval)
-		goto error;
+		goto delete_rr;
=20
 	atomic_set(&rr3->flash, 0);
 	rr3->flash_urb =3D usb_alloc_urb(0, GFP_KERNEL);
@@ -1028,7 +1034,7 @@ static int redrat3_dev_probe(struct usb_interface *in=
tf,
=20
 led_free_error:
 	led_classdev_unregister(&rr3->led);
-error:
+delete_rr:
 	redrat3_delete(rr3, rr3->udev);
=20
 no_endpoints:
--=20
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
