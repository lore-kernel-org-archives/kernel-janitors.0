From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 26 Aug 2016 12:48:06 +0000
Subject: [PATCH 1/8] cris-cryptocop: Use kmalloc_array() in two functions
Message-Id: <c62bbd46-8b0d-0d7b-de47-b00e4c57207b@users.sourceforge.net>
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
Date: Thu, 25 Aug 2016 22:11:44 +0200

* Multiplications for the size determination of memory allocations
  indicated that array data structures should be processed.
  Thus use the corresponding function "kmalloc_array".

  This issue was detected by using the Coccinelle software.

* Replace the specifications of data structures by pointer dereferences
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/cris/arch-v32/drivers/cryptocop.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/cris/arch-v32/drivers/cryptocop.c b/arch/cris/arch-v32/drivers/cryptocop.c
index 2081d8b..1632abc 100644
--- a/arch/cris/arch-v32/drivers/cryptocop.c
+++ b/arch/cris/arch-v32/drivers/cryptocop.c
@@ -1532,7 +1532,9 @@ int cryptocop_new_session(cryptocop_session_id *sid, struct cryptocop_transform_
 		return -ENOMEM;
 	}
 
-	sess->tfrm_ctx = kmalloc(no_tfrms * sizeof(struct cryptocop_transform_ctx), alloc_flag);
+	sess->tfrm_ctx = kmalloc_array(no_tfrms,
+				       sizeof(*sess->tfrm_ctx),
+				       alloc_flag);
 	if (!sess->tfrm_ctx) {
 		DEBUG_API(printk("cryptocop_new_session, kmalloc cryptocop_transform_ctx\n"));
 		kfree(sess);
@@ -2697,7 +2699,7 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
 	/* Map user pages for in and out data of the operation. */
 	noinpages = (((unsigned long int)(oper.indata + prev_ix) & ~PAGE_MASK) + oper.inlen - 1 - prev_ix + ~PAGE_MASK) >> PAGE_SHIFT;
 	DEBUG(printk("cryptocop_ioctl_process: noinpages=%d\n", noinpages));
-	inpages = kmalloc(noinpages * sizeof(struct page*), GFP_KERNEL);
+	inpages = kmalloc_array(noinpages, sizeof(*inpages), GFP_KERNEL);
 	if (!inpages){
 		DEBUG_API(printk("cryptocop_ioctl_process: kmalloc inpages\n"));
 		nooutpages = noinpages = 0;
@@ -2707,7 +2709,9 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
 	if (oper.do_cipher){
 		nooutpages = (((unsigned long int)oper.cipher_outdata & ~PAGE_MASK) + oper.cipher_outlen - 1 + ~PAGE_MASK) >> PAGE_SHIFT;
 		DEBUG(printk("cryptocop_ioctl_process: nooutpages=%d\n", nooutpages));
-		outpages = kmalloc(nooutpages * sizeof(struct page*), GFP_KERNEL);
+		outpages = kmalloc_array(nooutpages,
+					 sizeof(*outpages),
+					 GFP_KERNEL);
 		if (!outpages){
 			DEBUG_API(printk("cryptocop_ioctl_process: kmalloc outpages\n"));
 			nooutpages = noinpages = 0;
@@ -2753,8 +2757,12 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
 
 	/* Add 6 to nooutpages to make room for possibly inserted buffers for storing digest and
 	 * csum output and splits when units are (dis-)connected. */
-	cop->tfrm_op.indata = kmalloc((noinpages) * sizeof(struct iovec), GFP_KERNEL);
-	cop->tfrm_op.outdata = kmalloc((6 + nooutpages) * sizeof(struct iovec), GFP_KERNEL);
+	cop->tfrm_op.indata = kmalloc_array(noinpages,
+					    sizeof(*cop->tfrm_op.indata),
+					    GFP_KERNEL);
+	cop->tfrm_op.outdata = kmalloc_array(6 + nooutpages,
+					     sizeof(*cop->tfrm_op.outdata),
+					     GFP_KERNEL);
 	if (!cop->tfrm_op.indata || !cop->tfrm_op.outdata) {
 		DEBUG_API(printk("cryptocop_ioctl_process: kmalloc iovecs\n"));
 		err = -ENOMEM;
-- 
2.9.3

