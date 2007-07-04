From: "Suresh Jayaraman" <sjayaraman@novell.com>
Date: Wed, 04 Jul 2007 10:43:29 +0000
Subject: Re: [KJ] [PATCH] cris/arch-v32: Remove unnecessary cast of
Message-Id: <468BC729020000F40000AC47@lucius.provo.novell.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <46857CC8020000F40000AA4A@lucius.provo.novell.com>
In-Reply-To: <46857CC8020000F40000AA4A@lucius.provo.novell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 2007-07-04 at 09:07 +0000, walter harms wrote:

> you are right, normaly it would better to have two patches. IMHO for this special case
> (since removing a case is small change) you add the check.

Sure. Please find the updated patch below.

> The important point is to look not only for "the task" - like removing the cast - but also
> for other errors. i may take some time before the next will check that file again.

You're right. I initially thought that grouping changes logically makes
maintainer's job easy. But, in this case the change was too small.
---

Remove unnecessary cast of return value of kmalloc() and add kmalloc
checks in cris/arch-v32/mm/intmem.c

Signed-off-by: Suresh Jayaraman <sjayaraman@novell.com>
---

diff --git a/arch/cris/arch-v32/mm/intmem.c b/arch/cris/arch-v32/mm/intmem.c
index 41ee7f7..0f0b484 100644
--- a/arch/cris/arch-v32/mm/intmem.c
+++ b/arch/cris/arch-v32/mm/intmem.c
@@ -27,8 +27,12 @@ static void crisv32_intmem_init(void)
 {
 	static int initiated = 0;
 	if (!initiated) {
-		struct intmem_allocation* alloc -		  (struct intmem_allocation*)kmalloc(sizeof *alloc, GFP_KERNEL);
+		struct intmem_allocation *alloc = kmalloc(sizeof *alloc,
+							  GFP_KERNEL);
+		if (!alloc) {
+			printk(KERN_ERR "crisv32: not enough memory\n");
+			return;
+		}
 		INIT_LIST_HEAD(&intmem_allocations);
 		intmem_virtual = ioremap(MEM_INTMEM_START, MEM_INTMEM_SIZE);
 		initiated = 1;
@@ -55,9 +59,13 @@ void* crisv32_intmem_alloc(unsigned size, unsigned align)
 		if (allocation->status = STATUS_FREE &&
 		    allocation->size >= size + alignment) {
 			if (allocation->size > size + alignment) {
-				struct intmem_allocation* alloc -					(struct intmem_allocation*)
+				struct intmem_allocation *alloc  					kmalloc(sizeof *alloc, GFP_ATOMIC);
+				if (!alloc) {
+					printk(KERN_ERR "crisv32: not enough
+					       memory\n");
+					return;
+				}
 				alloc->status = STATUS_FREE;
 				alloc->size = allocation->size - size - alignment;
 				alloc->offset = allocation->offset + size;
@@ -65,8 +73,12 @@ void* crisv32_intmem_alloc(unsigned size, unsigned align)
 
 				if (alignment) {
 					struct intmem_allocation* tmp;
-					tmp = (struct intmem_allocation*)
-						kmalloc(sizeof *tmp, GFP_ATOMIC);
+					tmp = kmalloc(sizeof *tmp, GFP_ATOMIC);
+					if (!tmp) {
+						printk(KERN_ERR "crisv32: not
+						       enough memory\n");
+						return;
+					}
 					tmp->offset = allocation->offset;
 					tmp->size = alignment;
 					tmp->status = STATUS_FREE;

-- 
Suresh Jayaraman


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
