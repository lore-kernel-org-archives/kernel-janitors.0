From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 24 Jan 2018 20:30:09 +0000
Subject: [PATCH 1/3] Input: bcm5974: Delete an error message for a failed memory allocation in bcm5974_wellsp
Message-Id: <9371a1f7-beee-212d-05d7-ba081a6990c1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0505482c-287f-8809-76e3-960cf45b3c0a@users.sourceforge.net>
In-Reply-To: <0505482c-287f-8809-76e3-960cf45b3c0a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Henrik Rydberg <rydberg@bitmath.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 24 Jan 2018 21:09:28 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/input/mouse/bcm5974.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/mouse/bcm5974.c b/drivers/input/mouse/bcm5974.c
index d0122134f320..994805513df9 100644
--- a/drivers/input/mouse/bcm5974.c
+++ b/drivers/input/mouse/bcm5974.c
@@ -670,7 +670,6 @@ static int bcm5974_wellspring_mode(struct bcm5974 *dev, bool on)
 
 	data = kmalloc(c->um_size, GFP_KERNEL);
 	if (!data) {
-		dev_err(&dev->intf->dev, "out of memory\n");
 		retval = -ENOMEM;
 		goto out;
 	}
-- 
2.16.1

