From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 16 Jan 2018 16:42:26 +0000
Subject: [PATCH] mfd/viperboard: Delete an error message for a failed memory allocation in vprbrd_probe()
Message-Id: <9c50fe6a-21cc-e49d-1b10-5d2457ed4e2a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Lars_P=c3=b6schel?= <poeschel@lemonage.de>, Samuel Ortiz <sameo@linux.intel.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 16 Jan 2018 17:30:23 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mfd/viperboard.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mfd/viperboard.c b/drivers/mfd/viperboard.c
index e6b3c70aeb22..e9f61262d583 100644
--- a/drivers/mfd/viperboard.c
+++ b/drivers/mfd/viperboard.c
@@ -59,10 +59,8 @@ static int vprbrd_probe(struct usb_interface *interface,
 
 	/* allocate memory for our device state and initialize it */
 	vb = kzalloc(sizeof(*vb), GFP_KERNEL);
-	if (vb = NULL) {
-		dev_err(&interface->dev, "Out of memory\n");
+	if (!vb)
 		return -ENOMEM;
-	}
 
 	mutex_init(&vb->lock);
 
-- 
2.15.1

