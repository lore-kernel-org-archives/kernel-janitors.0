From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 20 May 2017 20:00:30 +0000
Subject: [PATCH] vlynq: Delete an error message for a failed memory allocation in vlynq_probe()
Message-Id: <412dece0-b79a-0587-9ee7-8cfd72c19a40@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Fainelli <f.fainelli@gmail.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 20 May 2017 21:53:55 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/vlynq/vlynq.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/vlynq/vlynq.c b/drivers/vlynq/vlynq.c
index c0227f9418eb..08173463e7eb 100644
--- a/drivers/vlynq/vlynq.c
+++ b/drivers/vlynq/vlynq.c
@@ -684,11 +684,8 @@ static int vlynq_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
-	if (!dev) {
-		printk(KERN_ERR
-		       "vlynq: failed to allocate device structure\n");
+	if (!dev)
 		return -ENOMEM;
-	}
 
 	dev->id = pdev->id;
 	dev->dev.bus = &vlynq_bus_type;
-- 
2.13.0

