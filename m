From: Marcin Slusarz <marcin.slusarz@gmail.com>
Date: Sun, 04 Dec 2005 00:20:12 +0000
Subject: [KJ] [PATCH 13/21] polling loops: change exit condition to
Message-Id: <4392363C.90108@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

who is responsible for those files?

Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/message/fusion/mptbase.c linux-2.6.15-rc4/drivers/message/fusion/mptbase.c
--- linux-2.6.15-rc4-orig/drivers/message/fusion/mptbase.c	2005-12-03 15:22:33.000000000 +0100
+++ linux-2.6.15-rc4/drivers/message/fusion/mptbase.c	2005-12-03 16:53:10.000000000 +0100
@@ -2874,6 +2874,7 @@ mpt_downloadboot(MPT_ADAPTER *ioc, MpiFw
 	u32			 fwSize;
 	u32			 diag0val;
 	int			 count;
+	unsigned long end_time;
 	u32			*ptrFw;
 	u32			 diagRwData;
 	u32			 nextImage;
@@ -2902,7 +2903,9 @@ mpt_downloadboot(MPT_ADAPTER *ioc, MpiFw
 	diag0val = CHIPREG_READ32(&ioc->chip->Diagnostic);
 	CHIPREG_WRITE32(&ioc->chip->Diagnostic, diag0val | MPI_DIAG_RESET_ADAPTER);
 
-	for (count = 0; count < 30; count ++) {
+	count = 0;
+	end_time = jiffies + msecs_to_jiffies(3000);
+	while (time_before(jiffies, end_time)) {
 		diag0val = CHIPREG_READ32(&ioc->chip->Diagnostic);
 		if (!(diag0val & MPI_DIAG_RESET_ADAPTER)) {
 			ddlprintk((MYIOC_s_INFO_FMT "RESET_ADAPTER cleared, count=%d\n",
@@ -2915,9 +2918,10 @@ mpt_downloadboot(MPT_ADAPTER *ioc, MpiFw
 		} else {
 			mdelay (100);
 		}
+		++count;
 	}
 
-	if ( count = 30 ) {
+	if (diag0val & MPI_DIAG_RESET_ADAPTER) {
 		ddlprintk((MYIOC_s_INFO_FMT "downloadboot failed! "
 		"Unable to get MPI_DIAG_DRWE mode, diag0val=%x\n",
 		ioc->name, diag0val));
@@ -3032,7 +3036,9 @@ mpt_downloadboot(MPT_ADAPTER *ioc, MpiFw
 		}
 	}
 
-	for (count=0; count<HZ*20; count++) {
+	count = 0;
+	end_time = jiffies + msecs_to_jiffies(HZ * 200);
+	while (time_before(jiffies, end_time)) {
 		if ((ioc_state = mpt_GetIocState(ioc, 0)) & MPI_IOC_STATE_READY) {
 			ddlprintk((MYIOC_s_INFO_FMT "downloadboot successful! (count=%d) IocState=%x\n",
 					ioc->name, count, ioc_state));
@@ -3053,6 +3059,7 @@ mpt_downloadboot(MPT_ADAPTER *ioc, MpiFw
 		} else {
 			mdelay (10);
 		}
+		++count;
 	}
 	ddlprintk((MYIOC_s_INFO_FMT "downloadboot failed! IocState=%x\n",
 		ioc->name, ioc_state));
@@ -3090,7 +3097,8 @@ KickStart(MPT_ADAPTER *ioc, int force, i
 {
 	int hard_reset_done = 0;
 	u32 ioc_state=0;
-	int cnt,cntdn;
+	int cnt;
+	unsigned long end_time;
 
 	dinitprintk((KERN_WARNING MYNAM ": KickStarting %s!\n", ioc->name));
 	if (ioc->bus_type = SCSI) {
@@ -3113,8 +3121,9 @@ KickStart(MPT_ADAPTER *ioc, int force, i
 	dinitprintk((MYIOC_s_INFO_FMT "Diagnostic reset successful!\n",
 			ioc->name));
 
-	cntdn = ((sleepFlag = CAN_SLEEP) ? HZ : 1000) * 2;	/* 2 seconds */
-	for (cnt=0; cnt<cntdn; cnt++) {
+	cnt = 0;
+	end_time = jiffies + msecs_to_jiffies(2000);
+	while (time_before(jiffies, end_time)) {
 		ioc_state = mpt_GetIocState(ioc, 1);
 		if ((ioc_state = MPI_IOC_STATE_READY) || (ioc_state = MPI_IOC_STATE_OPERATIONAL)) {
 			dinitprintk((MYIOC_s_INFO_FMT "KickStart successful! (cnt=%d)\n",
@@ -3126,6 +3135,7 @@ KickStart(MPT_ADAPTER *ioc, int force, i
 		} else {
 			mdelay (10);
 		}
+		++cnt;
 	}
 
 	printk(MYIOC_s_ERR_FMT "Failed to come READY after reset! IocState=%x\n",
@@ -3162,6 +3172,7 @@ mpt_diag_reset(MPT_ADAPTER *ioc, int ign
 #ifdef MPT_DEBUG
 	u32 diag1val = 0;
 #endif
+	unsigned long end_time;
 
 	/* Clear any existing interrupts */
 	CHIPREG_WRITE32(&ioc->chip->IntStatus, 0);
@@ -3180,6 +3191,7 @@ mpt_diag_reset(MPT_ADAPTER *ioc, int ign
 	 * or if the reset history is 0
 	 */
 	if (ignore || !(diag0val & MPI_DIAG_RESET_HISTORY)) {
+		end_time = jiffies + msecs_to_jiffies(2000);
 		while ((diag0val & MPI_DIAG_DRWE) = 0) {
 			/* Write magic sequence to WriteSequence register
 			 * Loop until in diagnostic mode
@@ -3198,12 +3210,10 @@ mpt_diag_reset(MPT_ADAPTER *ioc, int ign
 				mdelay (100);
 			}
 
-			count++;
-			if (count > 20) {
+			if (time_after(jiffies, end_time)) {
 				printk(MYIOC_s_ERR_FMT "Enable Diagnostic mode FAILED! (%02xh)\n",
 						ioc->name, diag0val);
 				return -2;
-
 			}
 
 			diag0val = CHIPREG_READ32(&ioc->chip->Diagnostic);
@@ -3264,7 +3274,8 @@ mpt_diag_reset(MPT_ADAPTER *ioc, int ign
 			 * IOC will be left unusable. This is a fatal error
 			 * case.  _diag_reset will return < 0
 			 */
-			for (count = 0; count < 30; count ++) {
+			end_time = jiffies + msecs_to_jiffies(30000);
+			while (time_before(jiffies, end_time)) {
 				diag0val = CHIPREG_READ32(&ioc->chip->Diagnostic);
 				if (!(diag0val & MPI_DIAG_RESET_ADAPTER)) {
 					break;
@@ -3290,7 +3301,8 @@ mpt_diag_reset(MPT_ADAPTER *ioc, int ign
 			 * If fail, no error will check again
 			 * with calling program.
 			 */
-			for (count = 0; count < 60; count ++) {
+			end_time = jiffies + msecs_to_jiffies(60000);
+			while (time_before(jiffies, end_time)) {
 				doorbell = CHIPREG_READ32(&ioc->chip->Doorbell);
 				doorbell &= MPI_IOC_STATE_MASK;
 
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/message/fusion/mptscsih.c linux-2.6.15-rc4/drivers/message/fusion/mptscsih.c
--- linux-2.6.15-rc4-orig/drivers/message/fusion/mptscsih.c	2005-12-03 15:22:33.000000000 +0100
+++ linux-2.6.15-rc4/drivers/message/fusion/mptscsih.c	2005-12-03 16:53:10.000000000 +0100
@@ -1964,10 +1964,11 @@ static int
 mptscsih_tm_pending_wait(MPT_SCSI_HOST * hd)
 {
 	unsigned long  flags;
-	int            loop_count = 4 * 10;  /* Wait 10 seconds */
 	int            status = FAILED;
+	unsigned long  end_time;
 
-	do {
+	end_time = jiffies + msecs_to_jiffies(10000); /* Wait 10 seconds */
+	while (time_before(jiffies, end_time)) {
 		spin_lock_irqsave(&hd->ioc->FreeQlock, flags);
 		if (hd->tmState = TM_STATE_NONE) {
 			hd->tmState = TM_STATE_IN_PROGRESS;
@@ -1978,7 +1979,7 @@ mptscsih_tm_pending_wait(MPT_SCSI_HOST *
 		}
 		spin_unlock_irqrestore(&hd->ioc->FreeQlock, flags);
 		msleep(250);
-	} while (--loop_count);
+	}
 
 	return status;
 }
@@ -1994,19 +1995,20 @@ static int
 mptscsih_tm_wait_for_completion(MPT_SCSI_HOST * hd, ulong timeout )
 {
 	unsigned long  flags;
-	int            loop_count = 4 * timeout;
 	int            status = FAILED;
+	unsigned long  end_time;
 
-	do {
+	end_time = jiffies + msecs_to_jiffies(timeout * 1000);
+	while (time_before(jiffies, end_time)) {
 		spin_lock_irqsave(&hd->ioc->FreeQlock, flags);
-		if(hd->tmPending = 0) {
+		if (hd->tmPending = 0) {
 			status = SUCCESS;
  			spin_unlock_irqrestore(&hd->ioc->FreeQlock, flags);
 			break;
 		}
 		spin_unlock_irqrestore(&hd->ioc->FreeQlock, flags);
 		msleep_interruptible(250);
-	} while (--loop_count);
+	}
 
 	return status;
 }
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
