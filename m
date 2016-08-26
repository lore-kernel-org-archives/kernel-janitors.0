From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 26 Aug 2016 12:54:08 +0000
Subject: [PATCH 4/8] cris-cryptocop: Less function calls in cryptocop_ioctl_process() after error detection
Message-Id: <645bec82-5d53-96f7-9571-e58c96a167fc@users.sourceforge.net>
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
Date: Fri, 26 Aug 2016 13:31:40 +0200

1. The kfree() function was called in some cases by the
   cryptocop_ioctl_process() function during error handling
   even if the passed variable contained a null pointer.

2. Split a condition check for memory allocation failures.

3. Adjust jump targets according to the Linux coding style convention.

4. Omit an unneeded check for the local variable "cop" then at the end.

5. Delete assignments which became unnecessary with this refactoring
   for two local variables.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/cris/arch-v32/drivers/cryptocop.c | 80 ++++++++++++++++++----------------
 1 file changed, 42 insertions(+), 38 deletions(-)

diff --git a/arch/cris/arch-v32/drivers/cryptocop.c b/arch/cris/arch-v32/drivers/cryptocop.c
index 1165639..26347a2 100644
--- a/arch/cris/arch-v32/drivers/cryptocop.c
+++ b/arch/cris/arch-v32/drivers/cryptocop.c
@@ -2542,7 +2542,7 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
 	if (!jc) {
 		DEBUG_API(printk("cryptocop_ioctl_process: kmalloc\n"));
 		err = -ENOMEM;
-		goto error_cleanup;
+		goto free_cop;
 	}
 	jc->processed = 0;
 
@@ -2575,7 +2575,7 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
 		if (!tc) {
 			DEBUG_API(printk("cryptocop_ioctl_process: no cipher transform in session.\n"));
 			err = -EINVAL;
-			goto error_cleanup;
+			goto free_jc;
 		}
 		ciph_tcfg.tid = CRYPTOCOP_IOCTL_CIPHER_TID;
 		ciph_tcfg.inject_ix = 0;
@@ -2628,14 +2628,14 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
 		if (!tc) {
 			DEBUG_API(printk("cryptocop_ioctl_process: no digest transform in session.\n"));
 			err = -EINVAL;
-			goto error_cleanup;
+			goto free_jc;
 		}
 		digest_length = tc->init.alg = cryptocop_alg_md5 ? 16 : 20;
 		digest_result = kmalloc(digest_length, GFP_KERNEL);
 		if (!digest_result) {
 			DEBUG_API(printk("cryptocop_ioctl_process: kmalloc digest_result\n"));
 			err = -EINVAL;
-			goto error_cleanup;
+			goto free_jc;
 		}
 		DEBUG(memset(digest_result, 0xff, digest_length));
 
@@ -2645,7 +2645,7 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
 		if ((oper.digest_start < 0) || (oper.digest_len <= 0) || (oper.digest_start > oper.inlen) || ((oper.digest_start + oper.digest_len) > oper.inlen)){
 			DEBUG_API(printk("cryptocop_ioctl_process: bad digest length\n"));
 			err = -EINVAL;
-			goto error_cleanup;
+			goto free_digest;
 		}
 
 		digest_tcfg.next = cop->tfrm_op.tfrm_cfg;
@@ -2670,9 +2670,8 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
 	prev_ix = first_cfg_change_ix(&oper);
 	if (prev_ix > oper.inlen) {
 		DEBUG_API(printk("cryptocop_ioctl_process: length mismatch\n"));
-		nooutpages = noinpages = 0;
 		err = -EINVAL;
-		goto error_cleanup;
+		goto free_digest;
 	}
 	DEBUG(printk("cryptocop_ioctl_process: inlen=%d, cipher_outlen=%d\n", oper.inlen, oper.cipher_outlen));
 
@@ -2682,9 +2681,8 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
 	inpages = kmalloc_array(noinpages, sizeof(*inpages), GFP_KERNEL);
 	if (!inpages){
 		DEBUG_API(printk("cryptocop_ioctl_process: kmalloc inpages\n"));
-		nooutpages = noinpages = 0;
 		err = -ENOMEM;
-		goto error_cleanup;
+		goto free_digest;
 	}
 	if (oper.do_cipher){
 		nooutpages = (((unsigned long int)oper.cipher_outdata & ~PAGE_MASK) + oper.cipher_outlen - 1 + ~PAGE_MASK) >> PAGE_SHIFT;
@@ -2694,9 +2692,8 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
 					 GFP_KERNEL);
 		if (!outpages){
 			DEBUG_API(printk("cryptocop_ioctl_process: kmalloc outpages\n"));
-			nooutpages = noinpages = 0;
 			err = -ENOMEM;
-			goto error_cleanup;
+			goto free_inpages;
 		}
 	}
 
@@ -2712,9 +2709,8 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
 
 	if (err < 0) {
 		up_read(&current->mm->mmap_sem);
-		nooutpages = noinpages = 0;
 		DEBUG_API(printk("cryptocop_ioctl_process: get_user_pages indata\n"));
-		goto error_cleanup;
+		goto free_outpages;
 	}
 	noinpages = err;
 	if (oper.do_cipher){
@@ -2726,9 +2722,8 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
 				     NULL);
 		up_read(&current->mm->mmap_sem);
 		if (err < 0) {
-			nooutpages = 0;
 			DEBUG_API(printk("cryptocop_ioctl_process: get_user_pages outdata\n"));
-			goto error_cleanup;
+			goto put_inpages;
 		}
 		nooutpages = err;
 	} else {
@@ -2740,13 +2735,18 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
 	cop->tfrm_op.indata = kmalloc_array(noinpages,
 					    sizeof(*cop->tfrm_op.indata),
 					    GFP_KERNEL);
+	if (!cop->tfrm_op.indata) {
+		DEBUG_API(printk("cryptocop_ioctl_process: kmalloc indata\n"));
+		err = -ENOMEM;
+		goto put_outpages;
+	}
 	cop->tfrm_op.outdata = kmalloc_array(6 + nooutpages,
 					     sizeof(*cop->tfrm_op.outdata),
 					     GFP_KERNEL);
-	if (!cop->tfrm_op.indata || !cop->tfrm_op.outdata) {
-		DEBUG_API(printk("cryptocop_ioctl_process: kmalloc iovecs\n"));
+	if (!cop->tfrm_op.outdata) {
+		DEBUG_API(printk("cryptocop_ioctl_process: kmalloc outdata\n"));
 		err = -ENOMEM;
-		goto error_cleanup;
+		goto free_indata;
 	}
 
 	cop->tfrm_op.inlen = oper.inlen - prev_ix;
@@ -2780,7 +2780,7 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
 	if (prev_ix = next_ix){
 		DEBUG_API(printk("cryptocop_ioctl_process: length configuration broken.\n"));
 		err = -EINVAL;  /* This should be impossible barring bugs. */
-		goto error_cleanup;
+		goto free_outdata;
 	}
 	while (prev_ix != next_ix){
 		end_digest = end_csum = cipher_active = digest_active = csum_active = 0;
@@ -2834,7 +2834,7 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
 		if (!descs[desc_ix].cfg){
 			DEBUG_API(printk("cryptocop_ioctl_process: data segment %d (%d to %d) had no active transforms\n", desc_ix, prev_ix, next_ix));
 			err = -EINVAL;
-			goto error_cleanup;
+			goto mark_outpages_dirty;
 		}
 		descs[desc_ix].next = &(descs[desc_ix]) + 1;
 		++desc_ix;
@@ -2864,7 +2864,7 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
 		if (!map_pages_to_iovec(cop->tfrm_op.outdata, iovlen, &iovix, outpages, nooutpages, &pageix, &pageoffset, oper.cipher_outlen)){
 			DEBUG_API(printk("cryptocop_ioctl_process: failed to map pages to iovec.\n"));
 			err = -ENOSYS; /* This should be impossible barring bugs. */
-			goto error_cleanup;
+			goto mark_outpages_dirty;
 		}
 	DEBUG(printk("cryptocop_ioctl_process: setting cop->tfrm_op.outcount %d\n", iovix));
 	cop->tfrm_op.outcount = iovix;
@@ -2878,7 +2878,7 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
 	if ((err = cryptocop_job_queue_insert_user_job(cop)) != 0) {
 		DEBUG_API(printk("cryptocop_ioctl_process: insert job %d\n", err));
 		err = -EINVAL;
-		goto error_cleanup;
+		goto mark_outpages_dirty;
 	}
 
 	DEBUG(printk("cryptocop_ioctl_process: begin wait for result\n"));
@@ -2888,7 +2888,7 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
         if (!jc->processed){
 		printk(KERN_WARNING "cryptocop_ioctl_process: job not processed at completion\n");
 		err = -EIO;
-		goto error_cleanup;
+		goto mark_outpages_dirty;
 	}
 
 	/* Job process done.  Cipher output should already be correct in job so no post processing of outdata. */
@@ -2900,7 +2900,7 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
 			if (0 != err){
 				DEBUG_API(printk("cryptocop_ioctl_process: copy_to_user, digest length %d, err %d\n", digest_length, err));
 				err = -EFAULT;
-				goto error_cleanup;
+				goto mark_outpages_dirty;
 			}
 		}
 		if (oper.do_csum){
@@ -2909,7 +2909,7 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
 			if (0 != err){
 				DEBUG_API(printk("cryptocop_ioctl_process: copy_to_user, csum, err %d\n", err));
 				err = -EFAULT;
-				goto error_cleanup;
+				goto mark_outpages_dirty;
 			}
 		}
 		err = 0;
@@ -2917,29 +2917,33 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
 		DEBUG(printk("cryptocop_ioctl_process: returning err = operation_status = %d\n", cop->operation_status));
 		err = cop->operation_status;
 	}
-
- error_cleanup:
-	/* Release page caches. */
-	for (i = 0; i < noinpages; i++)
-		put_page(inpages[i]);
+ mark_outpages_dirty:
 	for (i = 0; i < nooutpages; i++){
 		int spdl_err;
 		/* Mark output pages dirty. */
 		spdl_err = set_page_dirty_lock(outpages[i]);
 		DEBUG(if (spdl_err < 0)printk("cryptocop_ioctl_process: set_page_dirty_lock returned %d\n", spdl_err));
 	}
+ free_outdata:
+	kfree(cop->tfrm_op.outdata);
+ free_indata:
+	kfree(cop->tfrm_op.indata);
+ put_outpages:
 	for (i = 0; i < nooutpages; i++)
 		put_page(outpages[i]);
-	kfree(digest_result);
-	kfree(inpages);
+ put_inpages:
+	for (i = 0; i < noinpages; i++)
+		put_page(inpages[i]);
+ free_outpages:
 	kfree(outpages);
-	if (cop){
-		kfree(cop->tfrm_op.indata);
-		kfree(cop->tfrm_op.outdata);
-		kfree(cop);
-	}
+ free_inpages:
+	kfree(inpages);
+ free_digest:
+	kfree(digest_result);
+ free_jc:
 	kfree(jc);
-
+ free_cop:
+	kfree(cop);
 	DEBUG(print_lock_status());
 
 	return err;
-- 
2.9.3

