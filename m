From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 07 Jan 2017 19:53:02 +0000
Subject: [PATCH 1/9] memstick: Split a condition check in msb_ftl_initialize()
Message-Id: <b30a04c0-fea7-c5d6-a050-299f01212437@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <64dfa775-4e4a-bdb0-7b55-41f43ccdf11a@users.sourceforge.net>
In-Reply-To: <64dfa775-4e4a-bdb0-7b55-41f43ccdf11a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxim Levitsky <maximlevitsky@gmail.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 7 Jan 2017 08:43:50 +0100

The functions "kmalloc" and "kzalloc" were called in two cases by the
function "msb_ftl_initialize" without checking immediately
if they succeded.
This issue was detected by using the Coccinelle software.

Split a condition check for memory allocation failures so that
the corresponding exception handling will be improved a bit.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/memstick/core/ms_block.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
index f3512404bc52..fd8b1697a5a2 100644
--- a/drivers/memstick/core/ms_block.c
+++ b/drivers/memstick/core/ms_block.c
@@ -1339,17 +1339,17 @@ static int msb_ftl_initialize(struct msb_data *msb)
 	msb->logical_block_count = msb->zone_count * 496 - 2;
 
 	msb->used_blocks_bitmap = kzalloc(msb->block_count / 8, GFP_KERNEL);
+	if (!msb->used_blocks_bitmap)
+		return -ENOMEM;
+
 	msb->erased_blocks_bitmap = kzalloc(msb->block_count / 8, GFP_KERNEL);
+	if (!msb->erased_blocks_bitmap)
+		goto free_used_bitmap;
+
 	msb->lba_to_pba_table  		kmalloc(msb->logical_block_count * sizeof(u16), GFP_KERNEL);
-
-	if (!msb->used_blocks_bitmap || !msb->lba_to_pba_table ||
-						!msb->erased_blocks_bitmap) {
-		kfree(msb->used_blocks_bitmap);
-		kfree(msb->lba_to_pba_table);
-		kfree(msb->erased_blocks_bitmap);
-		return -ENOMEM;
-	}
+	if (!msb->lba_to_pba_table)
+		goto free_erased_bitmap;
 
 	for (i = 0; i < msb->zone_count; i++)
 		msb->free_block_count[i] = MS_BLOCKS_IN_ZONE;
@@ -1362,6 +1362,11 @@ static int msb_ftl_initialize(struct msb_data *msb)
 
 	msb->ftl_initialized = true;
 	return 0;
+free_erased_bitmap:
+	kfree(msb->erased_blocks_bitmap);
+free_used_bitmap:
+	kfree(msb->used_blocks_bitmap);
+	return -ENOMEM;
 }
 
 static int msb_ftl_scan(struct msb_data *msb)
-- 
2.11.0

