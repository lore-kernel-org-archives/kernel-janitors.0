From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 26 Aug 2016 12:51:19 +0000
Subject: [PATCH 3/8] cris-cryptocop: Delete unnecessary braces
Message-Id: <94ef8821-1f0d-83dc-8a62-4082e0a2e367@users.sourceforge.net>
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
Date: Fri, 26 Aug 2016 08:15:38 +0200

Do not use curly brackets at some source code places
where a single statement should be sufficient.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/cris/arch-v32/drivers/cryptocop.c | 140 +++++++++++++--------------------
 1 file changed, 56 insertions(+), 84 deletions(-)

diff --git a/arch/cris/arch-v32/drivers/cryptocop.c b/arch/cris/arch-v32/drivers/cryptocop.c
index 8e04b92..1165639 100644
--- a/arch/cris/arch-v32/drivers/cryptocop.c
+++ b/arch/cris/arch-v32/drivers/cryptocop.c
@@ -352,11 +352,10 @@ static void setup_descr_chain(struct cryptocop_dma_desc *cd)
 {
 	DEBUG(printk("setup_descr_chain: entering\n"));
 	while (cd) {
-		if (cd->next) {
+		if (cd->next)
 			cd->dma_descr->next = (dma_descr_data*)virt_to_phys(cd->next->dma_descr);
-		} else {
+		else
 			cd->dma_descr->next = NULL;
-		}
 		cd = cd->next;
 	}
 	DEBUG(printk("setup_descr_chain: exit\n"));
@@ -996,13 +995,15 @@ static int cryptocop_setup_dma_list(struct cryptocop_operation *operation, struc
 
 			DEBUG(printk("cryptocop_setup_dma_list: parsing an operation descriptor configuration.\n"));
 			/* Get the local context for the transform and mark it as the output unit if it produces output. */
-			if (digest_ctx.tcfg && (digest_ctx.tcfg->tid = dcfg->tid)){
+			if (digest_ctx.tcfg &&
+			   (digest_ctx.tcfg->tid = dcfg->tid))
 				tc = &digest_ctx;
-			} else if (cipher_ctx.tcfg && (cipher_ctx.tcfg->tid = dcfg->tid)){
+			else if (cipher_ctx.tcfg &&
+				(cipher_ctx.tcfg->tid = dcfg->tid))
 				tc = &cipher_ctx;
-			} else if (csum_ctx.tcfg && (csum_ctx.tcfg->tid = dcfg->tid)){
+			else if (csum_ctx.tcfg &&
+				(csum_ctx.tcfg->tid = dcfg->tid))
 				tc = &csum_ctx;
-			}
 			if (!tc) {
 				DEBUG_API(printk("cryptocop_setup_dma_list: invalid transform %d specified in descriptor.\n", dcfg->tid));
 				failed = -EINVAL;
@@ -1047,13 +1048,12 @@ static int cryptocop_setup_dma_list(struct cryptocop_operation *operation, struc
 			}
 			if (tc->current_src != src_dma) {
 				/* Find the unit we are sourcing from. */
-				if (digest_ctx.unit_no = tc->current_src){
+				if (digest_ctx.unit_no = tc->current_src)
 					tc->curr_src = &digest_ctx;
-				} else if (cipher_ctx.unit_no = tc->current_src){
+				else if (cipher_ctx.unit_no = tc->current_src)
 					tc->curr_src = &cipher_ctx;
-				} else if (csum_ctx.unit_no = tc->current_src){
+				else if (csum_ctx.unit_no = tc->current_src)
 					tc->curr_src = &csum_ctx;
-				}
 				if ((tc->curr_src = tc) && (tc->unit_no != src_dma)){
 					DEBUG_API(printk("cryptocop_setup_dma_list: unit %d configured to source from itself.\n", tc->unit_no));
 					failed = -EINVAL;
@@ -1065,7 +1065,7 @@ static int cryptocop_setup_dma_list(struct cryptocop_operation *operation, struc
 
 			/* Detect source switch. */
 			DEBUG(printk("cryptocop_setup_dma_list: tc->active=%d tc->unit_no=%d tc->current_src=%d tc->previous_src=%d, tc->curr_src=0x%p, tc->prev_srv=0x%p\n", tc->active, tc->unit_no, tc->current_src, tc->previous_src, tc->curr_src, tc->prev_src));
-			if (tc->active && (tc->current_src != tc->previous_src)) {
+			if (tc->active && (tc->current_src != tc->previous_src))
 				/* Only allow source switch when both the old source unit and the new one have
 				 * no pending data to process (i.e. the consumed length must be a multiple of the
 				 * transform blocklength). */
@@ -1077,12 +1077,10 @@ static int cryptocop_setup_dma_list(struct cryptocop_operation *operation, struc
 					failed = -EINVAL;
 					goto error_cleanup;
 				}
-			}
 			/* Detect unit deactivation. */
-			if (dcfg->last) {
+			if (dcfg->last)
 				/* Length check of this is handled below. */
 				tc->done = 1;
-			}
 			dcfg = dcfg->next;
 		} /* while (dcfg) */
 		DEBUG(printk("cryptocop_setup_dma_list: parsing operation descriptor configuration complete.\n"));
@@ -1116,20 +1114,17 @@ static int cryptocop_setup_dma_list(struct cryptocop_operation *operation, struc
 
 		if (csum_ctx.active) {
 			csum_ctx.consumed += desc_len;
-			if (csum_ctx.done) {
+			if (csum_ctx.done)
 				csum_ctx.produced = 2;
-			}
 			DEBUG(printk("cryptocop_setup_dma_list: csum_ctx producing: consumed=%d, produced=%d, blocklength=%d.\n", csum_ctx.consumed, csum_ctx.produced, csum_ctx.blocklength));
 		}
 		if (digest_ctx.active) {
 			digest_ctx.consumed += desc_len;
-			if (digest_ctx.done) {
-				if (digest_ctx.unit_no = src_md5) {
+			if (digest_ctx.done)
+				if (digest_ctx.unit_no = src_md5)
 					digest_ctx.produced = MD5_STATE_LENGTH;
-				} else {
+				else
 					digest_ctx.produced = SHA1_STATE_LENGTH;
-				}
-			}
 			DEBUG(printk("cryptocop_setup_dma_list: digest_ctx producing: consumed=%d, produced=%d, blocklength=%d.\n", digest_ctx.consumed, digest_ctx.produced, digest_ctx.blocklength));
 		}
 		if (cipher_ctx.active) {
@@ -1137,9 +1132,11 @@ static int cryptocop_setup_dma_list(struct cryptocop_operation *operation, struc
 			assert(cipher_ctx.current_src = src_dma);
 			cipher_ctx.consumed += desc_len;
 			cipher_ctx.produced = cipher_ctx.blocklength * (cipher_ctx.consumed / cipher_ctx.blocklength);
-			if (cipher_ctx.cbcmode && !(cipher_ctx.tcfg->flags & CRYPTOCOP_EXPLICIT_IV) && cipher_ctx.produced){
+			if (cipher_ctx.cbcmode &&
+			    !(cipher_ctx.tcfg->flags
+			     & CRYPTOCOP_EXPLICIT_IV) &&
+			    cipher_ctx.produced)
 				cipher_ctx.produced -= cipher_ctx.blocklength; /* Compensate for CBC iv. */
-			}
 			DEBUG(printk("cryptocop_setup_dma_list: cipher_ctx producing: consumed=%d, produced=%d, blocklength=%d.\n", cipher_ctx.consumed, cipher_ctx.produced, cipher_ctx.blocklength));
 		}
 
@@ -1149,12 +1146,11 @@ static int cryptocop_setup_dma_list(struct cryptocop_operation *operation, struc
 		eop_needed_count = 0;
 		if (cipher_ctx.active) {
 			++active_count;
-			if (cipher_ctx.unit_no = src_dma){
+			if (cipher_ctx.unit_no = src_dma)
 				/* mem2mem */
 				meta_out.ciphsel = src_none;
-			} else {
+			else
 				meta_out.ciphsel = cipher_ctx.current_src;
-			}
 			meta_out.ciphconf = cipher_ctx.ciph_conf;
 			meta_out.cbcmode = cipher_ctx.cbcmode;
 			meta_out.decrypt = cipher_ctx.decrypt;
@@ -1223,12 +1219,11 @@ static int cryptocop_setup_dma_list(struct cryptocop_operation *operation, struc
 
 				assert(cipher_ctx.active && cipher_ctx.done);
 
-				if (cipher_ctx.unit_no = src_dma){
+				if (cipher_ctx.unit_no = src_dma)
 					/* mem2mem */
 					ed_mo.ciphsel = src_none;
-				} else {
+				else
 					ed_mo.ciphsel = cipher_ctx.current_src;
-				}
 				ed_mo.ciphconf = cipher_ctx.ciph_conf;
 				ed_mo.cbcmode = cipher_ctx.cbcmode;
 				ed_mo.decrypt = cipher_ctx.decrypt;
@@ -1596,13 +1591,11 @@ int cryptocop_free_session(cryptocop_session_id sid)
 		psess = sess;
 		sess = sess->next;
 	}
-	if (sess){
-		if (psess){
+	if (sess)
+		if (psess)
 			psess->next = sess->next;
-		} else {
+		else
 			cryptocop_sessions = sess->next;
-		}
-	}
 	spin_unlock_irqrestore(&cryptocop_sessions_lock, flags);
 
 	if (!sess) return -EINVAL;
@@ -1610,16 +1603,13 @@ int cryptocop_free_session(cryptocop_session_id sid)
 	/* Remove queued jobs. */
 	spin_lock_irqsave(&cryptocop_job_queue_lock, flags);
 
-	for (i = 0; i < cryptocop_prio_no_prios; i++){
-		if (!list_empty(&(cryptocop_job_queues[i].jobs))){
+	for (i = 0; i < cryptocop_prio_no_prios; i++)
+		if (!list_empty(&(cryptocop_job_queues[i].jobs)))
 			list_for_each_safe(node, tmp, &(cryptocop_job_queues[i].jobs)) {
 				pj = list_entry(node, struct cryptocop_prio_job, node);
-				if (pj->oper->sid = sid) {
+				if (pj->oper->sid = sid)
 					list_move_tail(node, &remove_list);
-				}
 			}
-		}
-	}
 	spin_unlock_irqrestore(&cryptocop_job_queue_lock, flags);
 
 	list_for_each_safe(node, tmp, &remove_list) {
@@ -1653,9 +1643,8 @@ static struct cryptocop_session *get_session(cryptocop_session_id sid)
 
 	spin_lock_irqsave(&cryptocop_sessions_lock, flags);
 	sess = cryptocop_sessions;
-	while (sess && (sess->sid != sid)){
+	while (sess && (sess->sid != sid))
 		sess = sess->next;
-	}
 	spin_unlock_irqrestore(&cryptocop_sessions_lock, flags);
 
 	return sess;
@@ -1779,9 +1768,8 @@ static void get_aes_decrypt_key(unsigned char *dec_key, const unsigned  char *ke
 
 	/* Need to do host byte order correction here since key is byte oriented and the
 	 * kx algorithm is word (u32) oriented. */
-	for (i = 0; i < nk; i+=1) {
+	for (i = 0; i < nk; ++i)
 		w_ring[i] = be32_to_cpu(*(u32*)&key[4*i]);
-	}
 
 	i = (int)nk;
 	w_last_ix = i - 1;
@@ -2055,8 +2043,8 @@ static void cryptocop_job_queue_close(void)
 	spin_lock_irqsave(&cryptocop_process_lock, process_flags);
 
 	/* Empty the job queue. */
-	for (i = 0; i < cryptocop_prio_no_prios; i++){
-		if (!list_empty(&(cryptocop_job_queues[i].jobs))){
+	for (i = 0; i < cryptocop_prio_no_prios; i++)
+		if (!list_empty(&(cryptocop_job_queues[i].jobs)))
 			list_for_each_safe(node, tmp, &(cryptocop_job_queues[i].jobs)) {
 				pj = list_entry(node, struct cryptocop_prio_job, node);
 				list_del(node);
@@ -2069,8 +2057,6 @@ static void cryptocop_job_queue_close(void)
 				delete_internal_operation(pj->iop);
 				kfree(pj);
 			}
-		}
-	}
 	spin_unlock_irqrestore(&cryptocop_process_lock, process_flags);
 
 	/* Remove the running job, if any. */
@@ -2321,9 +2307,8 @@ static int cryptocop_release(struct inode *inode, struct file *filp)
 
 	while (dev){
 		dev_next = dev->next;
-		if (dev->sid != CRYPTOCOP_SESSION_ID_NONE) {
+		if (dev->sid != CRYPTOCOP_SESSION_ID_NONE)
 			(void)cryptocop_free_session(dev->sid);
-		}
 		kfree(dev);
 		dev = dev_next;
 	}
@@ -2353,11 +2338,10 @@ static int cryptocop_ioctl_close_session(struct inode *inode, struct file *filp,
 		dev = dev->next;
 	}
 	if (dev){
-		if (prev_dev){
+		if (prev_dev)
 			prev_dev->next = dev->next;
-		} else {
+		else
 			filp->private_data = dev->next;
-		}
 		err = cryptocop_free_session(dev->sid);
 		if (err) return -EFAULT;
 	} else {
@@ -2401,27 +2385,24 @@ static size_t next_cfg_change_ix(struct strcop_crypto_op *crp_op, size_t ix)
 	size_t ch_ix = INT_MAX;
 	size_t tmp_ix = 0;
 
-	if (crp_op->do_cipher && ((crp_op->cipher_start + crp_op->cipher_len) > ix)){
-		if (crp_op->cipher_start > ix) {
+	if (crp_op->do_cipher &&
+	   ((crp_op->cipher_start + crp_op->cipher_len) > ix))
+		if (crp_op->cipher_start > ix)
 			ch_ix = crp_op->cipher_start;
-		} else {
+		else
 			ch_ix = crp_op->cipher_start + crp_op->cipher_len;
-		}
-	}
 	if (crp_op->do_digest && ((crp_op->digest_start + crp_op->digest_len) > ix)){
-		if (crp_op->digest_start > ix) {
+		if (crp_op->digest_start > ix)
 			tmp_ix = crp_op->digest_start;
-		} else {
+		else
 			tmp_ix = crp_op->digest_start + crp_op->digest_len;
-		}
 		if (tmp_ix < ch_ix) ch_ix = tmp_ix;
 	}
 	if (crp_op->do_csum && ((crp_op->csum_start + crp_op->csum_len) > ix)){
-		if (crp_op->csum_start > ix) {
+		if (crp_op->csum_start > ix)
 			tmp_ix = crp_op->csum_start;
-		} else {
+		else
 			tmp_ix = crp_op->csum_start + crp_op->csum_len;
-		}
 		if (tmp_ix < ch_ix) ch_ix = tmp_ix;
 	}
 	if (ch_ix = INT_MAX) ch_ix = ix;
@@ -2635,11 +2616,10 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
 			return -EINVAL;
 		}
 
-		if (oper.decrypt){
+		if (oper.decrypt)
 			ciph_tcfg.flags |= CRYPTOCOP_DECRYPT;
-		} else {
+		else
 			ciph_tcfg.flags |= CRYPTOCOP_ENCRYPT;
-		}
 		ciph_tcfg.next = cop->tfrm_op.tfrm_cfg;
 		cop->tfrm_op.tfrm_cfg = &ciph_tcfg;
 	}
@@ -2861,11 +2841,10 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
 		prev_ix = next_ix;
 		next_ix = next_cfg_change_ix(&oper, prev_ix);
 	}
-	if (desc_ix > 0){
+	if (desc_ix > 0)
 		descs[desc_ix-1].next = NULL;
-	} else {
+	else
 		descs[0].next = NULL;
-	}
 	if (oper.do_digest) {
 		DEBUG(printk("cryptocop_ioctl_process: mapping %d byte digest output to iovec %d\n", digest_length, iovix));
 		/* Add outdata iovec, length = <length of type of digest> */
@@ -2881,13 +2860,12 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
 		cop->tfrm_op.outdata[iovix].iov_len = 2;
 		++iovix;
 	}
-	if (oper.do_cipher) {
+	if (oper.do_cipher)
 		if (!map_pages_to_iovec(cop->tfrm_op.outdata, iovlen, &iovix, outpages, nooutpages, &pageix, &pageoffset, oper.cipher_outlen)){
 			DEBUG_API(printk("cryptocop_ioctl_process: failed to map pages to iovec.\n"));
 			err = -ENOSYS; /* This should be impossible barring bugs. */
 			goto error_cleanup;
 		}
-	}
 	DEBUG(printk("cryptocop_ioctl_process: setting cop->tfrm_op.outcount %d\n", iovix));
 	cop->tfrm_op.outcount = iovix;
 	assert(iovix <= (nooutpages + 6));
@@ -2942,19 +2920,16 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
 
  error_cleanup:
 	/* Release page caches. */
-	for (i = 0; i < noinpages; i++){
+	for (i = 0; i < noinpages; i++)
 		put_page(inpages[i]);
-	}
 	for (i = 0; i < nooutpages; i++){
 		int spdl_err;
 		/* Mark output pages dirty. */
 		spdl_err = set_page_dirty_lock(outpages[i]);
 		DEBUG(if (spdl_err < 0)printk("cryptocop_ioctl_process: set_page_dirty_lock returned %d\n", spdl_err));
 	}
-	for (i = 0; i < nooutpages; i++){
+	for (i = 0; i < nooutpages; i++)
 		put_page(outpages[i]);
-	}
-
 	kfree(digest_result);
 	kfree(inpages);
 	kfree(outpages);
@@ -2987,9 +2962,8 @@ static int cryptocop_ioctl_create_session(struct inode *inode, struct file *filp
 		return -EFAULT;
 	err = copy_from_user(&sop, sess_op, sizeof(struct strcop_session_op));
 	if (err) return -EFAULT;
-	if (sop.cipher != cryptocop_cipher_none) {
+	if (sop.cipher != cryptocop_cipher_none)
 		if (!access_ok(VERIFY_READ, sop.key, sop.keylen)) return -EFAULT;
-	}
 	DEBUG(printk("cryptocop_ioctl_create_session, sess_op:\n"));
 
 	DEBUG(printk("\tcipher:%d\n"
@@ -3362,23 +3336,21 @@ static void print_cryptocop_operation(struct cryptocop_operation *cop)
 			d = d->next;
 		}
 		printk("\n==iniov\n");
-		for (i = 0; i < cop->tfrm_op.incount; i++){
+		for (i = 0; i < cop->tfrm_op.incount; i++)
 			printk("indata[%d]\n"
 			       "base=0x%p\n"
 			       "len=%d\n",
 			       i,
 			       cop->tfrm_op.indata[i].iov_base,
 			       cop->tfrm_op.indata[i].iov_len);
-		}
 		printk("\n==outiov\n");
-		for (i = 0; i < cop->tfrm_op.outcount; i++){
+		for (i = 0; i < cop->tfrm_op.outcount; i++)
 			printk("outdata[%d]\n"
 			       "base=0x%p\n"
 			       "len=%d\n",
 			       i,
 			       cop->tfrm_op.outdata[i].iov_base,
 			       cop->tfrm_op.outdata[i].iov_len);
-		}
 	}
 	printk("------------end print_cryptocop_operation\n");
 }
-- 
2.9.3

