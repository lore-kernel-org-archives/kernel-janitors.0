From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 08 Jan 2017 16:37:08 +0000
Subject: [PATCH] VMCI: Use kmalloc_array() in qp_alloc_ppn_set()
Message-Id: <9a04914a-138b-3f5d-b82a-8043b2602bd9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, George Zhang <georgezhang@vmware.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Hocko <mhocko@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 8 Jan 2017 14:04:10 +0100

Multiplications for the size determination of memory allocations
indicated that array data structures should be processed.
Thus use the corresponding function "kmalloc_array".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/vmw_vmci/vmci_queue_pair.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/vmw_vmci/vmci_queue_pair.c b/drivers/misc/vmw_vmci/vmci_queue_pair.c
index 498c0854305f..7b5c8a89cc54 100644
--- a/drivers/misc/vmw_vmci/vmci_queue_pair.c
+++ b/drivers/misc/vmw_vmci/vmci_queue_pair.c
@@ -486,13 +486,15 @@ static int qp_alloc_ppn_set(void *prod_q,
 	if (ppn_set->initialized)
 		return VMCI_ERROR_ALREADY_EXISTS;
 
-	produce_ppns -	    kmalloc(num_produce_pages * sizeof(*produce_ppns), GFP_KERNEL);
+	produce_ppns = kmalloc_array(num_produce_pages,
+				     sizeof(*produce_ppns),
+				     GFP_KERNEL);
 	if (!produce_ppns)
 		return VMCI_ERROR_NO_MEM;
 
-	consume_ppns -	    kmalloc(num_consume_pages * sizeof(*consume_ppns), GFP_KERNEL);
+	consume_ppns = kmalloc_array(num_consume_pages,
+				     sizeof(*consume_ppns),
+				     GFP_KERNEL);
 	if (!consume_ppns) {
 		kfree(produce_ppns);
 		return VMCI_ERROR_NO_MEM;
-- 
2.11.0

