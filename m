From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 13 Oct 2016 16:47:05 +0000
Subject: [PATCH 17/18] [media] RedRat3: Adjust two checks for null pointers in redrat3_dev_probe()
Message-Id: <810dec6f-8c5e-6784-bdc0-a9bed477b8c4@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <81cef537-4ad0-3a74-8bde-94707dcd03f4@users.sourceforge.net>
In-Reply-To: <81cef537-4ad0-3a74-8bde-94707dcd03f4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>, Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 13 Oct 2016 17:40:34 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

The script "checkpatch.pl" pointed information out like the following.

Comparison to NULL could be written !=E2=80=A6

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/rc/redrat3.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/rc/redrat3.c b/drivers/media/rc/redrat3.c
index 06c9eea..a09d5cb 100644
--- a/drivers/media/rc/redrat3.c
+++ b/drivers/media/rc/redrat3.c
@@ -923,8 +923,7 @@ static int redrat3_dev_probe(struct usb_interface *intf,
 		ep =3D &uhi->endpoint[i].desc;
 		addr =3D ep->bEndpointAddress;
 		attrs =3D ep->bmAttributes;
-
-		if ((ep_in =3D NULL) &&
+		if (!ep_in &&
 		    ((addr & USB_ENDPOINT_DIR_MASK) =3D USB_DIR_IN) &&
 		    ((attrs & USB_ENDPOINT_XFERTYPE_MASK) =3D
 		     USB_ENDPOINT_XFER_BULK)) {
@@ -935,7 +934,7 @@ static int redrat3_dev_probe(struct usb_interface *intf,
 				ep_in =3D ep;
 		}
=20
-		if ((ep_out =3D NULL) &&
+		if (!ep_out &&
 		    ((addr & USB_ENDPOINT_DIR_MASK) =3D USB_DIR_OUT) &&
 		    ((attrs & USB_ENDPOINT_XFERTYPE_MASK) =3D
 		     USB_ENDPOINT_XFER_BULK)) {
--=20
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
