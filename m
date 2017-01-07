From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 07 Jan 2017 19:54:14 +0000
Subject: [PATCH 2/9] memstick: Use kmalloc_array() in msb_ftl_initialize()
Message-Id: <9ec869d3-00f2-494f-850a-d22f344e8abb@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <64dfa775-4e4a-bdb0-7b55-41f43ccdf11a@users.sourceforge.net>
In-Reply-To: <64dfa775-4e4a-bdb0-7b55-41f43ccdf11a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxim Levitsky <maximlevitsky@gmail.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 7 Jan 2017 09:15:27 +0100

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kmalloc_array".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data type by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/memstick/core/ms_block.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
index fd8b1697a5a2..ec17885a5956 100644
--- a/drivers/memstick/core/ms_block.c
+++ b/drivers/memstick/core/ms_block.c
@@ -1346,8 +1346,9 @@ static int msb_ftl_initialize(struct msb_data *msb)
 	if (!msb->erased_blocks_bitmap)
 		goto free_used_bitmap;
 
-	msb->lba_to_pba_table -		kmalloc(msb->logical_block_count * sizeof(u16), GFP_KERNEL);
+	msb->lba_to_pba_table = kmalloc_array(msb->logical_block_count,
+					      sizeof(*msb->lba_to_pba_table),
+					      GFP_KERNEL);
 	if (!msb->lba_to_pba_table)
 		goto free_erased_bitmap;
 
-- 
2.11.0

