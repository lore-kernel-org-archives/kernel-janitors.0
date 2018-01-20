From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 20 Jan 2018 21:28:16 +0000
Subject: [PATCH 1/2] Input: sur40: Delete an error message for a failed memory allocation in sur40_probe()
Message-Id: <122986b6-b7f2-9b34-b11d-4d63557a2b97@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a7e25da3-587a-f0e8-d574-8066b340d9a6@users.sourceforge.net>
In-Reply-To: <a7e25da3-587a-f0e8-d574-8066b340d9a6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Florian Echtler <floe@butterbrot.org>, Johan Hovold <johan@kernel.org>, Martin Kaltenbrunner <modin@yuri.at>, Martin Kepplinger <martink@posteo.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 20 Jan 2018 22:11:24 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/input/touchscreen/sur40.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/touchscreen/sur40.c b/drivers/input/touchscreen/sur40.c
index f16f8358c70a..c7a0a92b2044 100644
--- a/drivers/input/touchscreen/sur40.c
+++ b/drivers/input/touchscreen/sur40.c
@@ -591,7 +591,6 @@ static int sur40_probe(struct usb_interface *interface,
 	sur40->bulk_in_epaddr = endpoint->bEndpointAddress;
 	sur40->bulk_in_buffer = kmalloc(sur40->bulk_in_size, GFP_KERNEL);
 	if (!sur40->bulk_in_buffer) {
-		dev_err(&interface->dev, "Unable to allocate input buffer.");
 		error = -ENOMEM;
 		goto err_free_polldev;
 	}
-- 
2.15.1

