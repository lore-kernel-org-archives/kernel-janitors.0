From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Fri, 10 Feb 2006 13:49:29 +0000
Subject: Re: [KJ] Fwd: libata janitor project
Message-Id: <1139579369.11506.2.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============25419057807331491=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060210132138.GA11586@mipter.zuzino.mipt.ru>
In-Reply-To: <20060210132138.GA11586@mipter.zuzino.mipt.ru>
To: kernel-janitors@vger.kernel.org

--===============25419057807331491==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

> Long term, we should work to replace the assert() in libata with 
> standard kernel WARN_ON().
> 
> If someone wanted to handle that conversion, that would be useful.  Make 
> sure to pay attention, the sense of each test must be reversed.

Guess after doing all this BUG() stuff its my fate to tackle this :)
This patchs cleans all users of assert() which include libata.h. I hope i
got the negation right every time.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc2-git8/drivers/scsi/ahci.c.orig	2006-02-10 14:32:39.000000000 +0100
+++ linux-2.6.16-rc2-git8/drivers/scsi/ahci.c	2006-02-10 14:33:00.000000000 +0100
@@ -678,7 +678,7 @@ static inline int ahci_host_intr(struct 
 	ci = readl(port_mmio + PORT_CMD_ISSUE);
 	if (likely((ci & 0x1) == 0)) {
 		if (qc) {
-			assert(qc->err_mask == 0);
+			WARN_ON(qc->err_mask != 0);
 			ata_qc_complete(qc);
 			qc = NULL;
 		}
--- linux-2.6.16-rc2-git8/drivers/scsi/libata-core.c.orig	2006-02-10 14:33:12.000000000 +0100
+++ linux-2.6.16-rc2-git8/drivers/scsi/libata-core.c	2006-02-10 14:41:04.000000000 +0100
@@ -1251,8 +1251,8 @@ static void ata_dev_identify(struct ata_
 
 	DPRINTK("ENTER, host %u, dev %u\n", ap->id, device);
 
-	assert (dev->class == ATA_DEV_ATA || dev->class == ATA_DEV_ATAPI ||
-		dev->class == ATA_DEV_NONE);
+	WARN_ON(dev->class != ATA_DEV_ATA && dev->class != ATA_DEV_ATAPI &&
+		dev->class != ATA_DEV_NONE);
 
 	ata_dev_select(ap, device, 1, 1); /* select device 0/1 */
 
@@ -2264,7 +2264,7 @@ static unsigned int ata_get_mode_mask(co
 	master = &ap->device[0];
 	slave = &ap->device[1];
 
-	assert (ata_dev_present(master) || ata_dev_present(slave));
+	WARN_ON(!ata_dev_present(master) && !ata_dev_present(slave));
 
 	if (shift == ATA_SHIFT_UDMA) {
 		mask = ap->udma_mask;
@@ -2510,11 +2510,11 @@ static void ata_sg_clean(struct ata_queu
 	int dir = qc->dma_dir;
 	void *pad_buf = NULL;
 
-	assert(qc->flags & ATA_QCFLAG_DMAMAP);
-	assert(sg != NULL);
+	WARN_ON(!(qc->flags & ATA_QCFLAG_DMAMAP));
+	WARN_ON(sg == NULL);
 
 	if (qc->flags & ATA_QCFLAG_SINGLE)
-		assert(qc->n_elem == 1);
+		WARN_ON(qc->n_elem != 1);
 
 	VPRINTK("unmapping %u sg elements\n", qc->n_elem);
 
@@ -2569,8 +2569,8 @@ static void ata_fill_sg(struct ata_queue
 	struct scatterlist *sg;
 	unsigned int idx;
 
-	assert(qc->__sg != NULL);
-	assert(qc->n_elem > 0);
+	WARN_ON(qc->__sg == NULL);
+	WARN_ON(qc->n_elem <= 0);
 
 	idx = 0;
 	ata_for_each_sg(sg, qc) {
@@ -2722,7 +2722,7 @@ static int ata_sg_setup_one(struct ata_q
 		void *pad_buf = ap->pad + (qc->tag * ATA_DMA_PAD_SZ);
 		struct scatterlist *psg = &qc->pad_sgent;
 
-		assert(qc->dev->class == ATA_DEV_ATAPI);
+		WARN_ON(qc->dev->class != ATA_DEV_ATAPI);
 
 		memset(pad_buf, 0, ATA_DMA_PAD_SZ);
 
@@ -2784,7 +2784,7 @@ static int ata_sg_setup(struct ata_queue
 	int n_elem, pre_n_elem, dir, trim_sg = 0;
 
 	VPRINTK("ENTER, ata%u\n", ap->id);
-	assert(qc->flags & ATA_QCFLAG_SG);
+	WARN_ON(!(qc->flags & ATA_QCFLAG_SG));
 
 	/* we must lengthen transfers to end on a 32-bit boundary */
 	qc->pad_len = lsg->length & 3;
@@ -2793,7 +2793,7 @@ static int ata_sg_setup(struct ata_queue
 		struct scatterlist *psg = &qc->pad_sgent;
 		unsigned int offset;
 
-		assert(qc->dev->class == ATA_DEV_ATAPI);
+		WARN_ON(qc->dev->class != ATA_DEV_ATAPI);
 
 		memset(pad_buf, 0, ATA_DMA_PAD_SZ);
 
@@ -2887,7 +2887,7 @@ static unsigned long ata_pio_poll(struct
 	unsigned int reg_state = HSM_ST_UNKNOWN;
 
 	qc = ata_qc_from_tag(ap, ap->active_tag);
-	assert(qc != NULL);
+	WARN_ON(qc == NULL);
 
 	switch (ap->hsm_task_state) {
 	case HSM_ST:
@@ -2955,7 +2955,7 @@ static int ata_pio_complete (struct ata_
 	}
 
 	qc = ata_qc_from_tag(ap, ap->active_tag);
-	assert(qc != NULL);
+	WARN_ON(qc == NULL);
 
 	drv_stat = ata_wait_idle(ap);
 	if (!ata_ok(drv_stat)) {
@@ -2966,7 +2966,7 @@ static int ata_pio_complete (struct ata_
 
 	ap->hsm_task_state = HSM_ST_IDLE;
 
-	assert(qc->err_mask == 0);
+	WARN_ON(qc->err_mask != 0);
 	ata_poll_qc_complete(qc);
 
 	/* another command may start at this point */
@@ -3323,7 +3323,7 @@ static void ata_pio_block(struct ata_por
 	}
 
 	qc = ata_qc_from_tag(ap, ap->active_tag);
-	assert(qc != NULL);
+	WARN_ON(qc == NULL);
 
 	/* check error */
 	if (status & (ATA_ERR | ATA_DF)) {
@@ -3360,12 +3360,12 @@ static void ata_pio_error(struct ata_por
 	printk(KERN_WARNING "ata%u: PIO error\n", ap->id);
 
 	qc = ata_qc_from_tag(ap, ap->active_tag);
-	assert(qc != NULL);
+	WARN_ON(qc == NULL);
 
 	/* make sure qc->err_mask is available to 
 	 * know what's wrong and recover
 	 */
-	assert(qc->err_mask);
+	WARN_ON(!qc->err_mask);
 
 	ap->hsm_task_state = HSM_ST_IDLE;
 
@@ -3598,7 +3598,7 @@ static void __ata_qc_complete(struct ata
  */
 void ata_qc_free(struct ata_queued_cmd *qc)
 {
-	assert(qc != NULL);	/* ata_qc_from_tag _might_ return NULL */
+	WARN_ON(qc == NULL);	/* ata_qc_from_tag _might_ return NULL */
 
 	__ata_qc_complete(qc);
 }
@@ -3619,8 +3619,8 @@ void ata_qc_complete(struct ata_queued_c
 {
 	int rc;
 
-	assert(qc != NULL);	/* ata_qc_from_tag _might_ return NULL */
-	assert(qc->flags & ATA_QCFLAG_ACTIVE);
+	WARN_ON(qc == NULL);	/* ata_qc_from_tag _might_ return NULL */
+	WARN_ON(!(qc->flags & ATA_QCFLAG_ACTIVE));
 
 	if (likely(qc->flags & ATA_QCFLAG_DMAMAP))
 		ata_sg_clean(qc);
@@ -4160,8 +4160,8 @@ static void atapi_packet_task(void *_dat
 	u8 status;
 
 	qc = ata_qc_from_tag(ap, ap->active_tag);
-	assert(qc != NULL);
-	assert(qc->flags & ATA_QCFLAG_ACTIVE);
+	WARN_ON(qc == NULL);
+	WARN_ON(!(qc->flags & ATA_QCFLAG_ACTIVE));
 
 	/* sleep-wait for BSY to clear */
 	DPRINTK("busy wait\n");
@@ -4179,7 +4179,7 @@ static void atapi_packet_task(void *_dat
 
 	/* send SCSI cdb */
 	DPRINTK("send cdb\n");
-	assert(ap->cdb_len >= 12);
+	WARN_ON(ap->cdb_len < 12);
 
 	if (qc->tf.protocol == ATA_PROT_ATAPI_DMA ||
 	    qc->tf.protocol == ATA_PROT_ATAPI_NODATA) {
--- linux-2.6.16-rc2-git8/drivers/scsi/libata-scsi.c.orig	2006-02-10 14:41:13.000000000 +0100
+++ linux-2.6.16-rc2-git8/drivers/scsi/libata-scsi.c	2006-02-10 14:41:31.000000000 +0100
@@ -553,7 +553,7 @@ void ata_gen_ata_desc_sense(struct ata_q
 	/*
 	 * Read the controller registers.
 	 */
-	assert(NULL != qc->ap->ops->tf_read);
+	WARN_ON(NULL == qc->ap->ops->tf_read);
 	qc->ap->ops->tf_read(qc->ap, tf);
 
 	/*
@@ -628,7 +628,7 @@ void ata_gen_fixed_sense(struct ata_queu
 	/*
 	 * Read the controller registers.
 	 */
-	assert(NULL != qc->ap->ops->tf_read);
+	WARN_ON(NULL == qc->ap->ops->tf_read);
 	qc->ap->ops->tf_read(qc->ap, tf);
 
 	/*
--- linux-2.6.16-rc2-git8/drivers/scsi/sata_mv.c.orig	2006-02-10 14:42:03.000000000 +0100
+++ linux-2.6.16-rc2-git8/drivers/scsi/sata_mv.c	2006-02-10 14:44:01.000000000 +0100
@@ -584,7 +584,7 @@ static void mv_start_dma(void __iomem *b
 		writelfl(EDMA_EN, base + EDMA_CMD_OFS);
 		pp->pp_flags |= MV_PP_FLAG_EDMA_EN;
 	}
-	assert(EDMA_EN & readl(base + EDMA_CMD_OFS));
+	WARN_ON(!(EDMA_EN & readl(base + EDMA_CMD_OFS)));
 }
 
 /**
@@ -610,7 +610,7 @@ static void mv_stop_dma(struct ata_port 
 		writelfl(EDMA_DS, port_mmio + EDMA_CMD_OFS);
 		pp->pp_flags &= ~MV_PP_FLAG_EDMA_EN;
 	} else {
-		assert(!(EDMA_EN & readl(port_mmio + EDMA_CMD_OFS)));
+		WARN_ON(EDMA_EN & readl(port_mmio + EDMA_CMD_OFS));
   	}
 
 	/* now properly wait for the eDMA to stop */
@@ -965,16 +965,16 @@ static void mv_qc_prep(struct ata_queued
 	}
 
 	/* the req producer index should be the same as we remember it */
-	assert(((readl(mv_ap_base(qc->ap) + EDMA_REQ_Q_IN_PTR_OFS) >>
+	WARN_ON(!(((readl(mv_ap_base(qc->ap) + EDMA_REQ_Q_IN_PTR_OFS) >>
 		 EDMA_REQ_Q_PTR_SHIFT) & MV_MAX_Q_DEPTH_MASK) ==
-	       pp->req_producer);
+	       pp->req_producer));
 
 	/* Fill in command request block
 	 */
 	if (!(qc->tf.flags & ATA_TFLAG_WRITE)) {
 		flags |= CRQB_FLAG_READ;
 	}
-	assert(MV_MAX_Q_DEPTH > qc->tag);
+	WARN_ON(MV_MAX_Q_DEPTH <= qc->tag);
 	flags |= qc->tag << CRQB_TAG_SHIFT;
 
 	pp->crqb[pp->req_producer].sg_addr =
@@ -1064,10 +1064,10 @@ static int mv_qc_issue(struct ata_queued
 	in_ptr = readl(port_mmio + EDMA_REQ_Q_IN_PTR_OFS);
 
 	/* the req producer index should be the same as we remember it */
-	assert(((in_ptr >> EDMA_REQ_Q_PTR_SHIFT) & MV_MAX_Q_DEPTH_MASK) ==
+	WARN_ON(((in_ptr >> EDMA_REQ_Q_PTR_SHIFT) & MV_MAX_Q_DEPTH_MASK) !=
 	       pp->req_producer);
 	/* until we do queuing, the queue should be empty at this point */
-	assert(((in_ptr >> EDMA_REQ_Q_PTR_SHIFT) & MV_MAX_Q_DEPTH_MASK) ==
+	WARN_ON(((in_ptr >> EDMA_REQ_Q_PTR_SHIFT) & MV_MAX_Q_DEPTH_MASK) !=
 	       ((readl(port_mmio + EDMA_REQ_Q_OUT_PTR_OFS) >>
 		 EDMA_REQ_Q_PTR_SHIFT) & MV_MAX_Q_DEPTH_MASK));
 
@@ -1105,15 +1105,15 @@ static u8 mv_get_crpb_status(struct ata_
 	out_ptr = readl(port_mmio + EDMA_RSP_Q_OUT_PTR_OFS);
 
 	/* the response consumer index should be the same as we remember it */
-	assert(((out_ptr >> EDMA_RSP_Q_PTR_SHIFT) & MV_MAX_Q_DEPTH_MASK) ==
+	WARN_ON(((out_ptr >> EDMA_RSP_Q_PTR_SHIFT) & MV_MAX_Q_DEPTH_MASK) !=
 	       pp->rsp_consumer);
 
 	/* increment our consumer index... */
 	pp->rsp_consumer = mv_inc_q_index(&pp->rsp_consumer);
 
 	/* and, until we do NCQ, there should only be 1 CRPB waiting */
-	assert(((readl(port_mmio + EDMA_RSP_Q_IN_PTR_OFS) >>
-		 EDMA_RSP_Q_PTR_SHIFT) & MV_MAX_Q_DEPTH_MASK) ==
+	WARN_ON(((readl(port_mmio + EDMA_RSP_Q_IN_PTR_OFS) >>
+		 EDMA_RSP_Q_PTR_SHIFT) & MV_MAX_Q_DEPTH_MASK) !=
 	       pp->rsp_consumer);
 
 	/* write out our inc'd consumer index so EDMA knows we're caught up */
--- linux-2.6.16-rc2-git8/drivers/scsi/sata_qstor.c.orig	2006-02-10 14:44:14.000000000 +0100
+++ linux-2.6.16-rc2-git8/drivers/scsi/sata_qstor.c	2006-02-10 14:44:30.000000000 +0100
@@ -276,8 +276,8 @@ static unsigned int qs_fill_sg(struct at
 	unsigned int nelem;
 	u8 *prd = pp->pkt + QS_CPB_BYTES;
 
-	assert(qc->__sg != NULL);
-	assert(qc->n_elem > 0);
+	WARN_ON(qc->__sg == NULL);
+	WARN_ON(qc->n_elem <= 0);
 
 	nelem = 0;
 	ata_for_each_sg(sg, qc) {
--- linux-2.6.16-rc2-git8/drivers/scsi/sata_sx4.c.orig	2006-02-10 14:44:40.000000000 +0100
+++ linux-2.6.16-rc2-git8/drivers/scsi/sata_sx4.c	2006-02-10 14:44:50.000000000 +0100
@@ -460,7 +460,7 @@ static void pdc20621_dma_prep(struct ata
 	unsigned int i, idx, total_len = 0, sgt_len;
 	u32 *buf = (u32 *) &pp->dimm_buf[PDC_DIMM_HEADER_SZ];
 
-	assert(qc->flags & ATA_QCFLAG_DMAMAP);
+	WARN_ON(!(qc->flags & ATA_QCFLAG_DMAMAP));
 
 	VPRINTK("ata%u: ENTER\n", ap->id);
 



--===============25419057807331491==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============25419057807331491==--
