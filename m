From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 13 Oct 2016 16:39:23 +0000
Subject: [PATCH 12/18] [media] RedRat3: Move a variable assignment in redrat3_init_rc_dev()
Message-Id: <b51ed26a-4a89-4e58-9fcc-3f4b4fa0987f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <81cef537-4ad0-3a74-8bde-94707dcd03f4@users.sourceforge.net>
In-Reply-To: <81cef537-4ad0-3a74-8bde-94707dcd03f4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>, Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 13 Oct 2016 14:50:05 +0200

Move the assignment for the local variable "prod" behind the source code
for a memory allocation by this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/rc/redrat3.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/rc/redrat3.c b/drivers/media/rc/redrat3.c
index b23a8bb..002030f 100644
--- a/drivers/media/rc/redrat3.c
+++ b/drivers/media/rc/redrat3.c
@@ -856,12 +856,13 @@ static struct rc_dev *redrat3_init_rc_dev(struct redrat3_dev *rr3)
 {
 	struct rc_dev *rc;
 	int ret;
-	u16 prod = le16_to_cpu(rr3->udev->descriptor.idProduct);
+	u16 prod;
 
 	rc = rc_allocate_device();
 	if (!rc)
 		goto out;
 
+	prod = le16_to_cpu(rr3->udev->descriptor.idProduct);
 	snprintf(rr3->name, sizeof(rr3->name), "RedRat3%s "
 		 "Infrared Remote Transceiver (%04x:%04x)",
 		 prod = USB_RR3IIUSB_PRODUCT_ID ? "-II" : "",
-- 
2.10.1

