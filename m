From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 24 Jan 2018 20:32:08 +0000
Subject: [PATCH 3/3] Input: bcm5974: Improve a size determination in bcm5974_probe()
Message-Id: <02af8e7d-b6f9-10f9-4f56-de657477bfd5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0505482c-287f-8809-76e3-960cf45b3c0a@users.sourceforge.net>
In-Reply-To: <0505482c-287f-8809-76e3-960cf45b3c0a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Henrik Rydberg <rydberg@bitmath.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 24 Jan 2018 21:21:11 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/input/mouse/bcm5974.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/mouse/bcm5974.c b/drivers/input/mouse/bcm5974.c
index 685f56c08931..c827b31c8530 100644
--- a/drivers/input/mouse/bcm5974.c
+++ b/drivers/input/mouse/bcm5974.c
@@ -915,7 +915,7 @@ static int bcm5974_probe(struct usb_interface *iface,
 	cfg = bcm5974_get_config(udev);
 
 	/* allocate memory for our device state and initialize it */
-	dev = kzalloc(sizeof(struct bcm5974), GFP_KERNEL);
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!dev || !input_dev) {
 		dev_err(&iface->dev, "out of memory\n");
-- 
2.16.1

