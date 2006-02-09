From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Thu, 09 Feb 2006 17:25:40 +0000
Subject: [KJ] [Patch] BUG_ON() Conversion in drivers/scsi
Message-Id: <1139505940.6376.1.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============57552737595668391=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1138753677.9742.10.camel@alice>
In-Reply-To: <1138753677.9742.10.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============57552737595668391==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc2-git2/drivers/scsi/arm/queue.c.orig	2006-02-08 18:12:18.000000000 +0100
+++ linux-2.6.16-rc2-git2/drivers/scsi/arm/queue.c	2006-02-08 18:12:48.000000000 +0100
@@ -118,8 +118,7 @@ int __queue_add(Queue_t *queue, Scsi_Cmn
 	list_del(l);
 
 	q = list_entry(l, QE_t, list);
-	if (BAD_MAGIC(q, QUEUE_MAGIC_FREE))
-		BUG();
+	BUG_ON(BAD_MAGIC(q, QUEUE_MAGIC_FREE));
 
 	SET_MAGIC(q, QUEUE_MAGIC_USED);
 	q->SCpnt = SCpnt;
@@ -144,8 +143,7 @@ static Scsi_Cmnd *__queue_remove(Queue_t
 	 */
 	list_del(ent);
 	q = list_entry(ent, QE_t, list);
-	if (BAD_MAGIC(q, QUEUE_MAGIC_USED))
-		BUG();
+	BUG_ON(BAD_MAGIC(q, QUEUE_MAGIC_USED));
 
 	SET_MAGIC(q, QUEUE_MAGIC_FREE);
 	list_add(ent, &queue->free);
--- linux-2.6.16-rc2-git2/drivers/scsi/ibmmca.c.orig	2006-02-08 18:13:01.000000000 +0100
+++ linux-2.6.16-rc2-git2/drivers/scsi/ibmmca.c	2006-02-08 18:13:10.000000000 +0100
@@ -2243,8 +2243,7 @@ static int __ibmmca_host_reset(Scsi_Cmnd
 	int host_index;
 	unsigned long imm_command;
 
-	if (cmd == NULL)
-		BUG();
+	BUG_ON(cmd == NULL);
 
 	ticks = IM_RESET_DELAY * HZ;
 	shpnt = cmd->device->host;
--- linux-2.6.16-rc2-git2/drivers/scsi/aacraid/aachba.c.orig	2006-02-08 18:13:23.000000000 +0100
+++ linux-2.6.16-rc2-git2/drivers/scsi/aacraid/aachba.c	2006-02-08 18:14:28.000000000 +0100
@@ -388,8 +388,7 @@ static void get_container_name_callback(
 	scsicmd = (struct scsi_cmnd *) context;
 
 	dprintk((KERN_DEBUG "get_container_name_callback[cpu %d]: t = %ld.\n", smp_processor_id(), jiffies));
-	if (fibptr == NULL)
-		BUG();
+	BUG_ON(fibptr == NULL);
 
 	get_name_reply = (struct aac_get_name_resp *) fib_data(fibptr);
 	/* Failure is irrelevant, using default value instead */
@@ -945,8 +944,7 @@ static void io_callback(void *context, s
 		  smp_processor_id(), (unsigned long long)lba, jiffies);
 	}
 
-	if (fibptr == NULL)
-		BUG();
+	BUG_ON(fibptr == NULL);
 		
 	if(scsicmd->use_sg)
 		pci_unmap_sg(dev->pdev, 
@@ -1081,8 +1079,7 @@ static int aac_read(struct scsi_cmnd * s
 		
 		aac_build_sgraw(scsicmd, &readcmd->sg);
 		fibsize = sizeof(struct aac_raw_io) + ((le32_to_cpu(readcmd->sg.count) - 1) * sizeof (struct sgentryraw));
-		if (fibsize > (dev->max_fib_size - sizeof(struct aac_fibhdr)))
-			BUG();
+		BUG_ON(fibsize > (dev->max_fib_size - sizeof(struct aac_fibhdr)));
 		/*
 		 *	Now send the Fib to the adapter
 		 */
@@ -1248,8 +1245,7 @@ static int aac_write(struct scsi_cmnd * 
 		
 		aac_build_sgraw(scsicmd, &writecmd->sg);
 		fibsize = sizeof(struct aac_raw_io) + ((le32_to_cpu(writecmd->sg.count) - 1) * sizeof (struct sgentryraw));
-		if (fibsize > (dev->max_fib_size - sizeof(struct aac_fibhdr)))
-			BUG();
+		BUG_ON(fibsize > (dev->max_fib_size - sizeof(struct aac_fibhdr)));
 		/*
 		 *	Now send the Fib to the adapter
 		 */
@@ -1891,8 +1887,7 @@ static void aac_srb_callback(void *conte
 	scsicmd = (struct scsi_cmnd *) context;
 	dev = (struct aac_dev *)scsicmd->device->host->hostdata;
 
-	if (fibptr == NULL)
-		BUG();
+	BUG_ON(fibptr == NULL);
 
 	srbreply = (struct aac_srb_reply *) fib_data(fibptr);
 
--- linux-2.6.16-rc2-git2/drivers/scsi/aacraid/commsup.c.orig	2006-02-08 18:14:41.000000000 +0100
+++ linux-2.6.16-rc2-git2/drivers/scsi/aacraid/commsup.c	2006-02-08 18:15:25.000000000 +0100
@@ -228,9 +228,8 @@ void fib_init(struct fib *fibptr)
 static void fib_dealloc(struct fib * fibptr)
 {
 	struct hw_fib *hw_fib = fibptr->hw_fib;
-	if(hw_fib->header.StructType != FIB_MAGIC) 
-		BUG();
-	hw_fib->header.XferState = 0;        
+	BUG_ON(hw_fib->header.StructType != FIB_MAGIC);
+	hw_fib->header.XferState = 0;
 }
 
 /*
@@ -531,9 +530,8 @@ int fib_send(u16 command, struct fib * f
 			}
 		} else
 			down(&fibptr->event_wait);
-		if(fibptr->done == 0)
-			BUG();
-			
+		BUG_ON(fibptr->done == 0);
+
 		if((fibptr->flags & FIB_CONTEXT_FLAG_TIMED_OUT)){
 			return -ETIMEDOUT;
 		} else {
--- linux-2.6.16-rc2-git2/drivers/scsi/53c700.h.orig	2006-02-08 18:16:11.000000000 +0100
+++ linux-2.6.16-rc2-git2/drivers/scsi/53c700.h	2006-02-08 18:16:27.000000000 +0100
@@ -472,8 +472,7 @@ NCR_700_readl(struct Scsi_Host *host, __
 		ioread32(hostdata->base + reg);
 #if 1
 	/* sanity check the register */
-	if((reg & 0x3) != 0)
-		BUG();
+	BUG_ON((reg & 0x3) != 0);
 #endif
 
 	return value;
@@ -496,8 +495,7 @@ NCR_700_writel(__u32 value, struct Scsi_
 
 #if 1
 	/* sanity check the register */
-	if((reg & 0x3) != 0)
-		BUG();
+	BUG_ON((reg & 0x3) != 0);
 #endif
 
 	bEBus ? iowrite32be(value, hostdata->base + reg): 
--- linux-2.6.16-rc2-git2/drivers/scsi/megaraid.c.orig	2006-02-08 18:16:38.000000000 +0100
+++ linux-2.6.16-rc2-git2/drivers/scsi/megaraid.c	2006-02-08 18:16:51.000000000 +0100
@@ -1827,7 +1827,7 @@ mega_build_sglist(adapter_t *adapter, sc
 
 	scb->dma_type = MEGA_SGLIST;
 
-	if( sgcnt > adapter->sglen ) BUG();
+	BUG_ON( sgcnt > adapter->sglen );
 
 	*len = 0;
 
--- linux-2.6.16-rc2-git2/drivers/scsi/ide-scsi.c.orig	2006-02-08 18:17:01.000000000 +0100
+++ linux-2.6.16-rc2-git2/drivers/scsi/ide-scsi.c	2006-02-08 18:17:21.000000000 +0100
@@ -599,8 +599,7 @@ static ide_startstop_t idescsi_transfer_
 				"issuing a packet command\n");
 		return ide_do_reset (drive);
 	}
-	if (HWGROUP(drive)->handler != NULL)
-		BUG();
+	BUG_ON(HWGROUP(drive)->handler != NULL);
 	/* Set the interrupt routine */
 	ide_set_handler(drive, &idescsi_pc_intr, get_timeout(pc), idescsi_expiry);
 	/* Send the actual packet */
@@ -690,8 +689,7 @@ static ide_startstop_t idescsi_issue_pc 
 		set_bit(PC_DMA_OK, &pc->flags);
 
 	if (test_bit(IDESCSI_DRQ_INTERRUPT, &scsi->flags)) {
-		if (HWGROUP(drive)->handler != NULL)
-			BUG();
+		BUG_ON(HWGROUP(drive)->handler != NULL);
 		ide_set_handler(drive, &idescsi_transfer_pc,
 				get_timeout(pc), idescsi_expiry);
 		/* Issue the packet command */



--===============57552737595668391==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============57552737595668391==--
