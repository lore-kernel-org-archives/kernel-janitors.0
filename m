From: Michael Veeck <michael.veeck@gmx.net>
Date: Thu, 19 Feb 2004 20:55:00 +0000
Subject: [Kernel-janitors] [PATCH] drivers/message/fusion/ MIN/MAX removal
Message-Id: <403522A4.8090402@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------060101020404040304090703"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------060101020404040304090703
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.3) removes unnecessary min/max macros and changes
calls to use kernel.h macros instead.

Feedback is always welcome
Michael


--------------060101020404040304090703
Content-Type: text/plain;
 name="minmax_drivers_message_fusion.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="minmax_drivers_message_fusion.patch"

diff -Naur linux-2.6.3.org/drivers/message/fusion/mptbase.c linux-2.6.3.test/drivers/message/fusion/mptbase.c
--- linux-2.6.3.org/drivers/message/fusion/mptbase.c	2004-02-18 04:57:20.000000000 +0100
+++ linux-2.6.3.test/drivers/message/fusion/mptbase.c	2004-02-19 21:12:11.000000000 +0100
@@ -2485,10 +2485,10 @@
 			 * Set values for this IOC's request & reply frame sizes,
 			 * and request & reply queue depths...
 			 */
-			ioc->req_sz = MIN(MPT_DEFAULT_FRAME_SIZE, facts->RequestFrameSize * 4);
-			ioc->req_depth = MIN(MPT_MAX_REQ_DEPTH, facts->GlobalCredits);
+			ioc->req_sz = min(MPT_DEFAULT_FRAME_SIZE, facts->RequestFrameSize * 4);
+			ioc->req_depth = min_t(int, MPT_MAX_REQ_DEPTH, facts->GlobalCredits);
 			ioc->reply_sz = ioc->req_sz;
-			ioc->reply_depth = MIN(MPT_DEFAULT_REPLY_DEPTH, facts->ReplyQueueDepth);
+			ioc->reply_depth = min_t(int, MPT_DEFAULT_REPLY_DEPTH, facts->ReplyQueueDepth);
 
 			dprintk((MYIOC_s_INFO_FMT "reply_sz=%3d, reply_depth=%4d\n",
 				ioc->name, ioc->reply_sz, ioc->reply_depth));
@@ -3969,7 +3969,7 @@
 		/*
 		 * Copy out the cached reply...
 		 */
-		for (ii=0; ii < MIN(replyBytes/2,mptReply->MsgLength*2); ii++)
+		for (ii=0; ii < min(replyBytes/2,mptReply->MsgLength*2); ii++)
 			u16reply[ii] = ioc->hs_reply[ii];
 	} else {
 		return -99;
@@ -4216,7 +4216,7 @@
 
 			if ((rc = mpt_config(ioc, &cfg)) == 0) {
 				/* save the data */
-				copy_sz = MIN(sizeof(LANPage0_t), data_sz);
+				copy_sz = min_t(int, sizeof(LANPage0_t), data_sz);
 				memcpy(&ioc->lan_cnfg_page0, ppage0_alloc, copy_sz);
 
 			}
@@ -4261,7 +4261,7 @@
 
 		if ((rc = mpt_config(ioc, &cfg)) == 0) {
 			/* save the data */
-			copy_sz = MIN(sizeof(LANPage1_t), data_sz);
+			copy_sz = min_t(int, sizeof(LANPage1_t), data_sz);
 			memcpy(&ioc->lan_cnfg_page1, ppage1_alloc, copy_sz);
 		}
 
@@ -4330,7 +4330,7 @@
 		if ((rc = mpt_config(ioc, &cfg)) == 0) {
 			/* save the data */
 			pp0dest = &ioc->fc_port_page0[portnum];
-			copy_sz = MIN(sizeof(FCPortPage0_t), data_sz);
+			copy_sz = min_t(int, sizeof(FCPortPage0_t), data_sz);
 			memcpy(pp0dest, ppage0_alloc, copy_sz);
 
 			/*
diff -Naur linux-2.6.3.org/drivers/message/fusion/mptbase.h linux-2.6.3.test/drivers/message/fusion/mptbase.h
--- linux-2.6.3.org/drivers/message/fusion/mptbase.h	2004-02-18 04:57:17.000000000 +0100
+++ linux-2.6.3.test/drivers/message/fusion/mptbase.h	2004-02-19 21:12:11.000000000 +0100
@@ -1057,13 +1057,6 @@
 /*
  *  More (public) macros...
  */
-#ifndef MIN
-#define MIN(a, b)   (((a) < (b)) ? (a) : (b))
-#endif
-#ifndef MAX
-#define MAX(a, b)   (((a) > (b)) ? (a) : (b))
-#endif
-
 #ifndef offsetof
 #define offsetof(t, m)	((size_t) (&((t *)0)->m))
 #endif
diff -Naur linux-2.6.3.org/drivers/message/fusion/mptctl.c linux-2.6.3.test/drivers/message/fusion/mptctl.c
--- linux-2.6.3.org/drivers/message/fusion/mptctl.c	2004-02-18 04:57:13.000000000 +0100
+++ linux-2.6.3.test/drivers/message/fusion/mptctl.c	2004-02-19 21:12:11.000000000 +0100
@@ -283,7 +283,7 @@
 				dctlprintk((MYIOC_s_INFO_FMT ": Copying Reply Frame @%p to IOC!\n",
 						ioc->name, reply));
 				memcpy(ioc->ioctl->ReplyFrame, reply,
-					MIN(ioc->reply_sz, 4*reply->u.reply.MsgLength));
+					min(ioc->reply_sz, 4*reply->u.reply.MsgLength));
 				ioc->ioctl->status |= MPT_IOCTL_STATUS_RF_VALID;
 
 				/* Set the command status to GOOD if IOC Status is GOOD
@@ -334,7 +334,7 @@
 			// NOTE: Expects/requires non-Turbo reply!
 			dctlprintk((MYIOC_s_INFO_FMT ":Caching MPI_FUNCTION_FW_DOWNLOAD reply!\n",
 				ioc->name));
-			memcpy(fwReplyBuffer, reply, MIN(sizeof(fwReplyBuffer), 4*reply->u.reply.MsgLength));
+			memcpy(fwReplyBuffer, reply, min_t(int, sizeof(fwReplyBuffer), 4*reply->u.reply.MsgLength));
 			ReplyMsg = (pMPIDefaultReply_t) fwReplyBuffer;
 		}
 	}
@@ -992,7 +992,7 @@
 	MptSge_t	*sgl;
 	int		 numfrags = 0;
 	int		 fragcnt = 0;
-	int		 alloc_sz = MIN(bytes,MAX_KMALLOC_SZ);	// avoid kernel warning msg!
+	int		 alloc_sz = min(bytes,MAX_KMALLOC_SZ);	// avoid kernel warning msg!
 	int		 bytes_allocd = 0;
 	int		 this_alloc;
 	dma_addr_t	 pa;					// phys addr
@@ -1037,7 +1037,7 @@
 	sgl = sglbuf;
 	sg_spill = ((ioc->req_sz - sge_offset)/(sizeof(dma_addr_t) + sizeof(u32))) - 1;
 	while (bytes_allocd < bytes) {
-		this_alloc = MIN(alloc_sz, bytes-bytes_allocd);
+		this_alloc = min(alloc_sz, bytes-bytes_allocd);
 		buflist[buflist_ent].len = this_alloc;
 		buflist[buflist_ent].kptr = pci_alloc_consistent(ioc->pcidev,
 								 this_alloc,
@@ -2280,9 +2280,9 @@
 		 */
 		if (ioc->ioctl->status & MPT_IOCTL_STATUS_RF_VALID) {
 			if (karg.maxReplyBytes < ioc->reply_sz) {
-				 sz = MIN(karg.maxReplyBytes, 4*ioc->ioctl->ReplyFrame[2]);
+				 sz = min(karg.maxReplyBytes, 4*ioc->ioctl->ReplyFrame[2]);
 			} else {
-				 sz = MIN(ioc->reply_sz, 4*ioc->ioctl->ReplyFrame[2]);
+				 sz = min(ioc->reply_sz, 4*ioc->ioctl->ReplyFrame[2]);
 			}
 
 			if (sz > 0) {
@@ -2301,7 +2301,7 @@
 		/* If valid sense data, copy to user.
 		 */
 		if (ioc->ioctl->status & MPT_IOCTL_STATUS_SENSE_VALID) {
-			sz = MIN(karg.maxSenseBytes, MPT_SENSE_BUFFER_SIZE);
+			sz = min(karg.maxSenseBytes, MPT_SENSE_BUFFER_SIZE);
 			if (sz > 0) {
 				if (copy_to_user((char *)karg.senseDataPtr, ioc->ioctl->sense, sz)) {
 					printk(KERN_ERR "%s@%d::mptctl_do_mpt_command - "
diff -Naur linux-2.6.3.org/drivers/message/fusion/mptscsih.c linux-2.6.3.test/drivers/message/fusion/mptscsih.c
--- linux-2.6.3.org/drivers/message/fusion/mptscsih.c	2004-02-18 04:57:30.000000000 +0100
+++ linux-2.6.3.test/drivers/message/fusion/mptscsih.c	2004-02-19 21:12:11.000000000 +0100
@@ -3663,7 +3663,7 @@
 				if (nfactor < pspi_data->minSyncFactor )
 					nfactor = pspi_data->minSyncFactor;
 
-				factor = MAX (factor, nfactor);
+				factor = max(factor, nfactor);
 				if (factor == MPT_ASYNC)
 					offset = 0;
 			} else {
@@ -4721,7 +4721,7 @@
 		maxid = ioc->sh->max_id - 1;
 	} else if (ioc->sh) {
 		id = target_id;
-		maxid = MIN(id, ioc->sh->max_id - 1);
+		maxid = min_t(int, id, ioc->sh->max_id - 1);
 	}
 
 	for (; id <= maxid; id++) {
@@ -5054,7 +5054,7 @@
 				sense_data = ((u8 *)hd->ioc->sense_buf_pool +
 					(req_idx * MPT_SENSE_BUFFER_ALLOC));
 
-				sz = MIN (pReq->SenseBufferLength,
+				sz = min_t(int, pReq->SenseBufferLength,
 							SCSI_STD_SENSE_BYTES);
 				memcpy(hd->pLocal->sense, sense_data, sz);
 
@@ -5703,7 +5703,7 @@
 				ioc->spi_data.forceDv &= ~MPT_SCSICFG_RELOAD_IOC_PG3;
 			}
 
-			maxid = MIN (ioc->sh->max_id, MPT_MAX_SCSI_DEVICES);
+			maxid = min_t(int, ioc->sh->max_id, MPT_MAX_SCSI_DEVICES);
 
 			for (id = 0; id < maxid; id++) {
 				spin_lock_irqsave(&dvtaskQ_lock, flags);
@@ -6379,7 +6379,7 @@
 	if (echoBufSize > 0) {
 		iocmd.flags |= MPT_ICFLAG_ECHO;
 		if (dataBufSize > 0)
-			bufsize = MIN(echoBufSize, dataBufSize);
+			bufsize = min(echoBufSize, dataBufSize);
 		else
 			bufsize = echoBufSize;
 	} else if (dataBufSize == 0)
@@ -6390,7 +6390,7 @@
 
 	/* Data buffers for write-read-compare test max 1K.
 	 */
-	sz = MIN(bufsize, 1024);
+	sz = min(bufsize, 1024);
 
 	/* --- loop ----
 	 * On first pass, always issue a reserve.
@@ -6745,9 +6745,9 @@
 		}
 
 		/* limit by adapter capabilities */
-		width = MIN(width, hd->ioc->spi_data.maxBusWidth);
-		offset = MIN(offset, hd->ioc->spi_data.maxSyncOffset);
-		factor = MAX(factor, hd->ioc->spi_data.minSyncFactor);
+		width = min(width, hd->ioc->spi_data.maxBusWidth);
+		offset = min(offset, hd->ioc->spi_data.maxSyncOffset);
+		factor = max(factor, hd->ioc->spi_data.minSyncFactor);
 
 		/* Check Consistency */
 		if (offset && (factor < MPT_ULTRA2) && !width)

--------------060101020404040304090703
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------060101020404040304090703--
