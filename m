From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 26 Aug 2016 12:50:05 +0000
Subject: [PATCH 2/8] cris-cryptocop: Improve determination of sizes in five functions
Message-Id: <c0ef1402-6e7a-f9f9-00ed-94ba80c61ca9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <bfc23090-e05d-f491-2a28-1803ceb31a31@users.sourceforge.net>
In-Reply-To: <bfc23090-e05d-f491-2a28-1803ceb31a31@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-cris-kernel@axis.com, Adam Buchbinder <adam.buchbinder@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, Jiri Kosina <jkosina@suse.cz>, Mikael Starvik <starvik@axis.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 25 Aug 2016 22:32:27 +0200

Replace the specification of data structures by references for variables
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/cris/arch-v32/drivers/cryptocop.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/cris/arch-v32/drivers/cryptocop.c b/arch/cris/arch-v32/drivers/cryptocop.c
index 1632abc..8e04b92 100644
--- a/arch/cris/arch-v32/drivers/cryptocop.c
+++ b/arch/cris/arch-v32/drivers/cryptocop.c
@@ -323,7 +323,7 @@ static struct cryptocop_dma_desc *alloc_cdesc(int alloc_flag)
 		spin_unlock_irqrestore(&descr_pool_lock, flags);
 		cdesc->from_pool = 1;
 	} else {
-		cdesc = kmalloc(sizeof(struct cryptocop_dma_desc), alloc_flag);
+		cdesc = kmalloc(sizeof(*cdesc), alloc_flag);
 		if (!cdesc) {
 			DEBUG_API(printk("alloc_cdesc: kmalloc\n"));
 			return NULL;
@@ -1526,7 +1526,7 @@ int cryptocop_new_session(cryptocop_session_id *sid, struct cryptocop_transform_
 		return -EINVAL;
 	}
 
-	sess = kmalloc(sizeof(struct cryptocop_session), alloc_flag);
+	sess = kmalloc(sizeof(*sess), alloc_flag);
 	if (!sess){
 		DEBUG_API(printk("cryptocop_new_session, kmalloc cryptocop_session\n"));
 		return -ENOMEM;
@@ -2247,7 +2247,7 @@ static int cryptocop_job_setup(struct cryptocop_prio_job **pj, struct cryptocop_
 	int  alloc_flag = operation->in_interrupt ? GFP_ATOMIC : GFP_KERNEL;
 	void *iop_alloc_ptr = NULL;
 
-	*pj = kmalloc(sizeof (struct cryptocop_prio_job), alloc_flag);
+	*pj = kmalloc(sizeof(**pj), alloc_flag);
 	if (!*pj) return -ENOMEM;
 
 	DEBUG(printk("cryptocop_job_setup: operation=0x%p\n", operation));
@@ -2552,12 +2552,12 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
 		return -EFAULT;
 	}
 
-	cop = kmalloc(sizeof(struct cryptocop_operation), GFP_KERNEL);
+	cop = kmalloc(sizeof(*cop), GFP_KERNEL);
 	if (!cop) {
 		DEBUG_API(printk("cryptocop_ioctl_process: kmalloc\n"));
 		return -ENOMEM;
 	}
-	jc = kmalloc(sizeof(struct ioctl_job_cb_ctx), GFP_KERNEL);
+	jc = kmalloc(sizeof(*jc), GFP_KERNEL);
 	if (!jc) {
 		DEBUG_API(printk("cryptocop_ioctl_process: kmalloc\n"));
 		err = -ENOMEM;
@@ -3082,7 +3082,7 @@ static int cryptocop_ioctl_create_session(struct inode *inode, struct file *filp
 		ti_csum.next = tis;
 		tis = &ti_csum;
 	} /* (sop.csum != cryptocop_csum_none) */
-	dev = kmalloc(sizeof(struct cryptocop_private), GFP_KERNEL);
+	dev = kmalloc(sizeof(*dev), GFP_KERNEL);
 	if (!dev){
 		DEBUG_API(printk("create session, alloc dev\n"));
 		return -ENOMEM;
-- 
2.9.3

