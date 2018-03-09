From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 09 Mar 2018 16:50:49 +0000
Subject: [PATCH v2 17/17] mfd: viperboard: Delete an error message for a failed memory allocation in vprbrd_p
Message-Id: <1ebf63da-0b54-73a2-2256-9b932ed2ab0a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c5d9751e-3ae8-0b66-821a-0e7f45bb8e1c@users.sourceforge.net>
In-Reply-To: <c5d9751e-3ae8-0b66-821a-0e7f45bb8e1c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Lars_P=c3=b6schel?= <poeschel@lemonage.de>, Samuel Ortiz <sameo@linux.intel.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 9 Mar 2018 09:56:31 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---

v2:
Lee Jones requested a resend for this patch. The change was rebased
on source files from Linux next-20180308.

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
2.16.2

