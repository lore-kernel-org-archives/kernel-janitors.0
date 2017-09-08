From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 08 Sep 2017 12:31:05 +0000
Subject: [PATCH 1/3] [media] DaVinci-VPBE-Display: Delete an error message for a failed memory allocation in 
Message-Id: <9be97d7f-57bc-1c7e-fd86-187a38e0f994@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e980c48c-9525-4942-a58e-20af8a96e531@users.sourceforge.net>
In-Reply-To: <e980c48c-9525-4942-a58e-20af8a96e531@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Prabhakar Lad <prabhakar.csengg@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 7 Sep 2017 22:37:16 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/platform/davinci/vpbe_display.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/davinci/vpbe_display.c b/drivers/media/platform/davinci/vpbe_display.c
index 13d027031ff0..5b6fc550736b 100644
--- a/drivers/media/platform/davinci/vpbe_display.c
+++ b/drivers/media/platform/davinci/vpbe_display.c
@@ -1313,7 +1313,6 @@ static int init_vpbe_layer(int i, struct vpbe_display *disp_dev,
-	if (!disp_dev->dev[i]) {
-		printk(KERN_ERR "ran out of memory\n");
+	if (!disp_dev->dev[i])
 		return  -ENOMEM;
-	}
+
 	spin_lock_init(&disp_dev->dev[i]->irqlock);
 	mutex_init(&disp_dev->dev[i]->opslock);
 
-- 
2.14.1

