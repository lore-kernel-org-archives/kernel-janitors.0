From: Amol Lad <amol@verismonetworks.com>
Date: Tue, 10 Oct 2006 06:19:51 +0000
Subject: [KJ] [PATCH 1/2] drivers/isdn/hysdn: save_flags()/cli(),
Message-Id: <1160460471.19143.265.camel@amol.verismonetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

save_flags()/cli() pair is replaced with spin_lock_irqsave() and
restore_flags() replaced with spin_unlock_irqrestore()

Tested compile only using allmodconfig

Signed-off-by: Amol Lad <amol@verismonetworks.com>
---
 boardergo.c     |   32 ++++++++++++++------------------
 hysdn_defs.h    |    2 ++
 hysdn_proclog.c |   17 +++++++----------
 hysdn_sched.c   |    9 ++++-----
 4 files changed, 27 insertions(+), 33 deletions(-)
---
diff -uprN -X linux-2.6.19-rc1-orig/Documentation/dontdiff linux-2.6.19-rc1-orig/drivers/isdn/hysdn/boardergo.c linux-2.6.19-rc1/drivers/isdn/hysdn/boardergo.c
--- linux-2.6.19-rc1-orig/drivers/isdn/hysdn/boardergo.c	2006-09-21 10:15:33.000000000 +0530
+++ linux-2.6.19-rc1/drivers/isdn/hysdn/boardergo.c	2006-10-10 10:50:50.000000000 +0530
@@ -45,11 +45,10 @@ ergo_interrupt(int intno, void *dev_id, 
 	if (!card->irq_enabled)
 		return IRQ_NONE;		/* other device interrupting or irq switched off */
 
-	save_flags(flags);
-	cli();			/* no further irqs allowed */
+	spin_lock_irqsave(&card->hysdn_lock, flags); /* no further irqs allowed */
 
 	if (!(bytein(card->iobase + PCI9050_INTR_REG) & PCI9050_INTR_REG_STAT1)) {
-		restore_flags(flags);	/* restore old state */
+		spin_unlock_irqrestore(&card->hysdn_lock, flags);	/* restore old state */
 		return IRQ_NONE;		/* no interrupt requested by E1 */
 	}
 	/* clear any pending ints on the board */
@@ -61,7 +60,7 @@ ergo_interrupt(int intno, void *dev_id, 
 	/* start kernel task immediately after leaving all interrupts */
 	if (!card->hw_lock)
 		schedule_work(&card->irq_queue);
-	restore_flags(flags);
+	spin_unlock_irqrestore(&card->hysdn_lock, flags);
 	return IRQ_HANDLED;
 }				/* ergo_interrupt */
 
@@ -83,10 +82,9 @@ ergo_irq_bh(hysdn_card * card)
 
 	dpr = card->dpram;	/* point to DPRAM */
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&card->hysdn_lock, flags);
 	if (card->hw_lock) {
-		restore_flags(flags);	/* hardware currently unavailable */
+		spin_unlock_irqrestore(&card->hysdn_lock, flags);	/* hardware currently unavailable */
 		return;
 	}
 	card->hw_lock = 1;	/* we now lock the hardware */
@@ -120,7 +118,7 @@ ergo_irq_bh(hysdn_card * card)
 			card->hw_lock = 0;	/* free hardware again */
 	} while (again);	/* until nothing more to do */
 
-	restore_flags(flags);
+	spin_unlock_irqrestore(&card->hysdn_lock, flags);
 }				/* ergo_irq_bh */
 
 
@@ -137,8 +135,7 @@ ergo_stopcard(hysdn_card * card)
 #ifdef CONFIG_HYSDN_CAPI
 	hycapi_capi_stop(card);
 #endif /* CONFIG_HYSDN_CAPI */
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&card->hysdn_lock, flags);
 	val = bytein(card->iobase + PCI9050_INTR_REG);	/* get actual value */
 	val &= ~(PCI9050_INTR_REG_ENPCI | PCI9050_INTR_REG_EN1);	/* mask irq */
 	byteout(card->iobase + PCI9050_INTR_REG, val);
@@ -147,7 +144,7 @@ ergo_stopcard(hysdn_card * card)
 	card->state = CARD_STATE_UNUSED;
 	card->err_log_state = ERRLOG_STATE_OFF;		/* currently no log active */
 
-	restore_flags(flags);
+	spin_unlock_irqrestore(&card->hysdn_lock, flags);
 }				/* ergo_stopcard */
 
 /**************************************************************************/
@@ -162,12 +159,11 @@ ergo_set_errlog_state(hysdn_card * card,
 		card->err_log_state = ERRLOG_STATE_OFF;		/* must be off */
 		return;
 	}
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&card->hysdn_lock, flags);
 
 	if (((card->err_log_state = ERRLOG_STATE_OFF) && !on) ||
 	    ((card->err_log_state = ERRLOG_STATE_ON) && on)) {
-		restore_flags(flags);
+		spin_unlock_irqrestore(&card->hysdn_lock, flags);
 		return;		/* nothing to do */
 	}
 	if (on)
@@ -175,7 +171,7 @@ ergo_set_errlog_state(hysdn_card * card,
 	else
 		card->err_log_state = ERRLOG_STATE_STOP;	/* request stop */
 
-	restore_flags(flags);
+	spin_unlock_irqrestore(&card->hysdn_lock, flags);
 	schedule_work(&card->irq_queue);
 }				/* ergo_set_errlog_state */
 
@@ -356,8 +352,7 @@ ergo_waitpofready(struct HYSDN_CARD *car
 
 			if (card->debug_flags & LOG_POF_RECORD)
 				hysdn_addlog(card, "ERGO: pof boot success");
-			save_flags(flags);
-			cli();
+			spin_lock_irqsave(&card->hysdn_lock, flags);
 
 			card->state = CARD_STATE_RUN;	/* now card is running */
 			/* enable the cards interrupt */
@@ -370,7 +365,7 @@ ergo_waitpofready(struct HYSDN_CARD *car
 			dpr->ToHyInt = 1;
 			dpr->ToPcInt = 1;	/* interrupt to E1 for all cards */
 
-			restore_flags(flags);
+			spin_unlock_irqrestore(&card->hysdn_lock, flags);
 			if ((hynet_enable & (1 << card->myid)) 
 			    && (i = hysdn_net_create(card))) 
 			{
@@ -448,6 +443,7 @@ ergo_inithardware(hysdn_card * card)
 	card->waitpofready = ergo_waitpofready;
 	card->set_errlog_state = ergo_set_errlog_state;
 	INIT_WORK(&card->irq_queue, (void *) (void *) ergo_irq_bh, card);
+	card->hysdn_lock = SPIN_LOCK_UNLOCKED;
 
 	return (0);
 }				/* ergo_inithardware */
diff -uprN -X linux-2.6.19-rc1-orig/Documentation/dontdiff linux-2.6.19-rc1-orig/drivers/isdn/hysdn/hysdn_defs.h linux-2.6.19-rc1/drivers/isdn/hysdn/hysdn_defs.h
--- linux-2.6.19-rc1-orig/drivers/isdn/hysdn/hysdn_defs.h	2006-09-21 10:15:33.000000000 +0530
+++ linux-2.6.19-rc1/drivers/isdn/hysdn/hysdn_defs.h	2006-10-10 11:22:22.000000000 +0530
@@ -188,6 +188,8 @@ typedef struct HYSDN_CARD {
 	/* init and deinit stopcard for booting, too */
 	void (*stopcard) (struct HYSDN_CARD *);
 	void (*releasehardware) (struct HYSDN_CARD *);
+
+	spinlock_t hysdn_lock;
 #ifdef CONFIG_HYSDN_CAPI
 	struct hycapictrl_info {
 		char cardname[32];
diff -uprN -X linux-2.6.19-rc1-orig/Documentation/dontdiff linux-2.6.19-rc1-orig/drivers/isdn/hysdn/hysdn_proclog.c linux-2.6.19-rc1/drivers/isdn/hysdn/hysdn_proclog.c
--- linux-2.6.19-rc1-orig/drivers/isdn/hysdn/hysdn_proclog.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.19-rc1/drivers/isdn/hysdn/hysdn_proclog.c	2006-10-10 11:10:26.000000000 +0530
@@ -116,8 +116,7 @@ put_log_buffer(hysdn_card * card, char *
 	strcpy(ib->log_start, cp);	/* set output string */
 	ib->next = NULL;
 	ib->proc_ctrl = pd;	/* point to own control structure */
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&card->hysdn_lock, flags);
 	ib->usage_cnt = pd->if_used;
 	if (!pd->log_head)
 		pd->log_head = ib;	/* new head */
@@ -125,7 +124,7 @@ put_log_buffer(hysdn_card * card, char *
 		pd->log_tail->next = ib;	/* follows existing messages */
 	pd->log_tail = ib;	/* new tail */
 	i = pd->del_lock++;	/* get lock state */
-	restore_flags(flags);
+	spin_unlock_irqrestore(&card->hysdn_lock, flags);
 
 	/* delete old entrys */
 	if (!i)
@@ -270,14 +269,13 @@ hysdn_log_open(struct inode *ino, struct
 	} else if ((filep->f_mode & (FMODE_READ | FMODE_WRITE)) = FMODE_READ) {
 
 		/* read access -> log/debug read */
-		save_flags(flags);
-		cli();
+		spin_lock_irqsave(&card->hysdn_lock, flags);
 		pd->if_used++;
 		if (pd->log_head)
 			filep->private_data = &pd->log_tail->next;
 		else
 			filep->private_data = &pd->log_head;
-		restore_flags(flags);
+		spin_unlock_irqrestore(&card->hysdn_lock, flags);
 	} else {		/* simultaneous read/write access forbidden ! */
 		unlock_kernel();
 		return (-EPERM);	/* no permission this time */
@@ -301,7 +299,7 @@ hysdn_log_close(struct inode *ino, struc
 	hysdn_card *card;
 	int retval = 0;
 	unsigned long flags;
-
+	spinlock_t hysdn_lock = SPIN_LOCK_UNLOCKED;
 
 	lock_kernel();
 	if ((filep->f_mode & (FMODE_READ | FMODE_WRITE)) = FMODE_WRITE) {
@@ -311,8 +309,7 @@ hysdn_log_close(struct inode *ino, struc
 		/* read access -> log/debug read, mark one further file as closed */
 
 		pd = NULL;
-		save_flags(flags);
-		cli();
+		spin_lock_irqsave(&hysdn_lock, flags);
 		inf = *((struct log_data **) filep->private_data);	/* get first log entry */
 		if (inf)
 			pd = (struct procdata *) inf->proc_ctrl;	/* still entries there */
@@ -335,7 +332,7 @@ hysdn_log_close(struct inode *ino, struc
 			inf->usage_cnt--;	/* decrement usage count for buffers */
 			inf = inf->next;
 		}
-		restore_flags(flags);
+		spin_unlock_irqrestore(&hysdn_lock, flags);
 
 		if (pd)
 			if (pd->if_used <= 0)	/* delete buffers if last file closed */
diff -uprN -X linux-2.6.19-rc1-orig/Documentation/dontdiff linux-2.6.19-rc1-orig/drivers/isdn/hysdn/hysdn_sched.c linux-2.6.19-rc1/drivers/isdn/hysdn/hysdn_sched.c
--- linux-2.6.19-rc1-orig/drivers/isdn/hysdn/hysdn_sched.c	2006-09-21 10:15:33.000000000 +0530
+++ linux-2.6.19-rc1/drivers/isdn/hysdn/hysdn_sched.c	2006-10-10 11:17:44.000000000 +0530
@@ -155,8 +155,7 @@ hysdn_tx_cfgline(hysdn_card *card, unsig
 	if (card->debug_flags & LOG_SCHED_ASYN)
 		hysdn_addlog(card, "async tx-cfg chan=%d len=%d", chan, strlen(line) + 1);
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&card->hysdn_lock, flags);
 	while (card->async_busy) {
 		sti();
 
@@ -165,7 +164,7 @@ hysdn_tx_cfgline(hysdn_card *card, unsig
 
 		msleep_interruptible(20);		/* Timeout 20ms */
 		if (!--cnt) {
-			restore_flags(flags);
+			spin_unlock_irqrestore(&card->hysdn_lock, flags);
 			return (-ERR_ASYNC_TIME);	/* timed out */
 		}
 		cli();
@@ -194,13 +193,13 @@ hysdn_tx_cfgline(hysdn_card *card, unsig
 
 		msleep_interruptible(20);		/* Timeout 20ms */
 		if (!--cnt) {
-			restore_flags(flags);
+			spin_unlock_irqrestore(&card->hysdn_lock, flags);
 			return (-ERR_ASYNC_TIME);	/* timed out */
 		}
 		cli();
 	}			/* wait for buffer to become free again */
 
-	restore_flags(flags);
+	spin_unlock_irqrestore(&card->hysdn_lock, flags);
 
 	if (card->debug_flags & LOG_SCHED_ASYN)
 		hysdn_addlog(card, "async tx-cfg data send");


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
