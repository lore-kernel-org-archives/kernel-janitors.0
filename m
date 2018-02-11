From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 11 Feb 2018 21:26:16 +0000
Subject: [PATCH] firmware-gsmi: Delete an error message for a failed memory allocation in gsmi_buf_alloc()
Message-Id: <9cea2b6a-f260-a578-b3ed-6c118795907f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 11 Feb 2018 22:22:02 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/firmware/google/gsmi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/firmware/google/gsmi.c b/drivers/firmware/google/gsmi.c
index c8f169bf2e27..fbf661e0b784 100644
--- a/drivers/firmware/google/gsmi.c
+++ b/drivers/firmware/google/gsmi.c
@@ -138,10 +138,8 @@ static struct gsmi_buf *gsmi_buf_alloc(void)
 	struct gsmi_buf *smibuf;
 
 	smibuf = kzalloc(sizeof(*smibuf), GFP_KERNEL);
-	if (!smibuf) {
-		printk(KERN_ERR "gsmi: out of memory\n");
+	if (!smibuf)
 		return NULL;
-	}
 
 	/* allocate buffer in 32bit address space */
 	smibuf->start = dma_pool_alloc(gsmi_dev.dma_pool, GFP_KERNEL,
-- 
2.16.1

