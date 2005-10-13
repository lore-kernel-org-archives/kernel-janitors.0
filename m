From: Masoud Sharbiani <masouds@masoud.ir>
Date: Thu, 13 Oct 2005 19:13:21 +0000
Subject: [KJ] [PATCH] Get rid of yield()
Message-Id: <20051013191321.GA22138@masoud.ir>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============058921454935977113=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============058921454935977113==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello, 
the following patch removes yield() from all drivers. They have been replaced by schedule_timeout() or cond_resched(). Please verify and comment.

Signed-off-by: Masoud A Sharbiani <masouds@masoud.ir>

diff --git a/drivers/cdrom/cdu31a.c b/drivers/cdrom/cdu31a.c
--- a/drivers/cdrom/cdu31a.c
+++ b/drivers/cdrom/cdu31a.c
@@ -371,7 +371,7 @@ static inline void disable_interrupts(vo
 static inline void sony_sleep(void)
 {
 	if (cdu31a_irq <= 0) {
-		yield();
+		schedule_timeout(1);
 	} else {		/* Interrupt driven */
 		DEFINE_WAIT(w);
 		int first = 1;
diff --git a/drivers/cdrom/sonycd535.c b/drivers/cdrom/sonycd535.c
--- a/drivers/cdrom/sonycd535.c
+++ b/drivers/cdrom/sonycd535.c
@@ -342,7 +342,7 @@ static inline void
 sony_sleep(void)
 {
 	if (sony535_irq_used <= 0) {	/* poll */
-		yield();
+		schedule_timeout(1);
 	} else {	/* Interrupt driven */
 		DEFINE_WAIT(wait);
 		
diff --git a/drivers/macintosh/adb.c b/drivers/macintosh/adb.c
--- a/drivers/macintosh/adb.c
+++ b/drivers/macintosh/adb.c
@@ -556,7 +556,7 @@ adb_unregister(int index)
 	if (adb_handler[index].handler) {
 		while(adb_handler[index].busy) {
 			write_unlock_irq(&adb_handler_lock);
-			yield();
+			schedule_timeout(1);
 			write_lock_irq(&adb_handler_lock);
 		}
 		ret = 0;
diff --git a/drivers/mmc/mmc.c b/drivers/mmc/mmc.c
--- a/drivers/mmc/mmc.c
+++ b/drivers/mmc/mmc.c
@@ -396,7 +396,7 @@ static void mmc_deselect_cards(struct mm
 static inline void mmc_delay(unsigned int ms)
 {
 	if (ms < HZ / 1000) {
-		yield();
+		cond_resched();
 		mdelay(ms);
 	} else {
 		msleep_interruptible (ms);
diff --git a/drivers/net/depca.c b/drivers/net/depca.c
--- a/drivers/net/depca.c
+++ b/drivers/net/depca.c
@@ -762,9 +762,7 @@ static int __init depca_hw_init (struct 
 		/* Trigger an initialization just for the interrupt. */
 		outw(INEA | INIT, DEPCA_DATA);
 
-		delay = jiffies + HZ/50;
-		while (time_before(jiffies, delay))
-			yield();
+		schedule_timeout(HZ/50);
 
 		irqnum = probe_irq_off(irq_mask);
 
diff --git a/drivers/net/sb1000.c b/drivers/net/sb1000.c
--- a/drivers/net/sb1000.c
+++ b/drivers/net/sb1000.c
@@ -264,7 +264,7 @@ card_wait_for_busy_clear(const int ioadd
 	timeout = jiffies + TimeOutJiffies;
 	while (a & 0x80 || a & 0x40) {
 		/* a little sleep */
-		yield();
+		schedule_timeout(1);
 
 		a = inb(ioaddr[0] + 7);
 		if (time_after_eq(jiffies, timeout)) {
@@ -288,7 +288,7 @@ card_wait_for_ready(const int ioaddr[], 
 	timeout = jiffies + TimeOutJiffies;
 	while (a & 0x80 || !(a & 0x40)) {
 		/* a little sleep */
-		yield();
+		schedule_timeout(1);
 
 		a = inb(ioaddr[1] + 6);
 		if (time_after_eq(jiffies, timeout)) {
diff --git a/drivers/net/sis900.c b/drivers/net/sis900.c
--- a/drivers/net/sis900.c
+++ b/drivers/net/sis900.c
@@ -654,7 +654,7 @@ static int __init sis900_mii_probe(struc
 
 	if(status & MII_STAT_LINK){
 		while (poll_bit) {
-			yield();
+			schedule_timeout(1);
 
 			poll_bit ^= (mdio_read(net_dev, sis_priv->cur_phy, MII_STATUS) & poll_bit);
 			if (time_after_eq(jiffies, timeout)) {
diff --git a/drivers/net/smc91x.c b/drivers/net/smc91x.c
--- a/drivers/net/smc91x.c
+++ b/drivers/net/smc91x.c
@@ -1073,7 +1073,7 @@ static void smc_phy_powerdown(struct net
 	   above). linkwatch_event() also wants the netlink semaphore.
 	*/
 	while(lp->work_pending)
-		yield();
+		schedule_timeout(1);
 
 	bmcr = smc_phy_read(dev, phy, MII_BMCR);
 	smc_phy_write(dev, phy, MII_BMCR, bmcr | BMCR_PDOWN);
diff --git a/drivers/net/sungem.c b/drivers/net/sungem.c
--- a/drivers/net/sungem.c
+++ b/drivers/net/sungem.c
@@ -2397,7 +2397,7 @@ static int gem_suspend(struct pci_dev *p
 
 	/* Wait for a pending reset task to complete */
 	while (gp->reset_task_pending)
-		yield();
+		sched_timeout(1);
 	flush_scheduled_work();
 
 	/* Shut the PHY down eventually and setup WOL */
@@ -2922,7 +2922,7 @@ static void __devexit gem_remove_one(str
 
 		/* Wait for a pending reset task to complete */
 		while (gp->reset_task_pending)
-			yield();
+			schedule_timeout(1);
 		flush_scheduled_work();
 
 		/* Shut the PHY down */
diff --git a/drivers/net/wireless/hostap/hostap_hw.c b/drivers/net/wireless/hostap/hostap_hw.c
--- a/drivers/net/wireless/hostap/hostap_hw.c
+++ b/drivers/net/wireless/hostap/hostap_hw.c
@@ -995,7 +995,7 @@ static u16 hfa384x_allocate_fid(struct n
 	delay = jiffies + HFA384X_ALLOC_COMPL_TIMEOUT;
 	while (!(HFA384X_INW(HFA384X_EVSTAT_OFF) & HFA384X_EV_ALLOC) &&
 	       time_before(jiffies, delay))
-		yield();
+		schedule_timeout(1);
 	if (!(HFA384X_INW(HFA384X_EVSTAT_OFF) & HFA384X_EV_ALLOC)) {
 		printk("%s: fid allocate, len=%d - timeout\n", dev->name, len);
 		return 0xffff;
@@ -1332,7 +1332,7 @@ static int prism2_hw_init(struct net_dev
 	delay = jiffies + HFA384X_INIT_TIMEOUT;
 	while (!(HFA384X_INW(HFA384X_EVSTAT_OFF) & HFA384X_EV_CMD) &&
 	       time_before(jiffies, delay))
-		yield();
+		schedule_timeout(1);
 	if (!(HFA384X_INW(HFA384X_EVSTAT_OFF) & HFA384X_EV_CMD)) {
 		printk(KERN_DEBUG "%s: assuming no Primary image in "
 		       "flash - card initialization not completed\n",
diff --git a/drivers/scsi/NCR5380.c b/drivers/scsi/NCR5380.c
--- a/drivers/scsi/NCR5380.c
+++ b/drivers/scsi/NCR5380.c
@@ -346,7 +346,7 @@ static int NCR5380_poll_politely(struct 
 		if((r & bit) == val)
 			return 0;
 		if(!in_interrupt())
-			yield();
+			schedule_timeout(1);
 		else
 			cpu_relax();
 	}
diff --git a/drivers/scsi/ibmmca.c b/drivers/scsi/ibmmca.c
--- a/drivers/scsi/ibmmca.c
+++ b/drivers/scsi/ibmmca.c
@@ -2196,7 +2196,7 @@ static int __ibmmca_abort(Scsi_Cmnd * cm
 #endif
 	spin_unlock_irq(shpnt->host_lock);
 	while (!cmd->SCp.Status)
-		yield();
+		schedule_timeout(1);
 	spin_lock_irq(shpnt->host_lock);
 	cmd->scsi_done = saved_done;
 #ifdef IM_DEBUG_PROBE
@@ -2275,7 +2275,7 @@ static int __ibmmca_host_reset(Scsi_Cmnd
 		if (!(inb(IM_STAT_REG(host_index)) & IM_BUSY))
 			break;
 		spin_unlock_irq(shpnt->host_lock);
-		yield();
+		schedule_timeout(1);
 		spin_lock_irq(shpnt->host_lock);
 	}
 	/*write registers and enable system interrupts */
diff --git a/drivers/scsi/megaraid.c b/drivers/scsi/megaraid.c
--- a/drivers/scsi/megaraid.c
+++ b/drivers/scsi/megaraid.c
@@ -1750,7 +1750,7 @@ __mega_busywait_mbox (adapter_t *adapter
 	for (counter = 0; counter < 10000; counter++) {
 		if (!mbox->m_in.busy)
 			return 0;
-		udelay(100); yield();
+		udelay(100); cond_resched();
 	}
 	return -1;		/* give up after 1 second */
 }
diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -477,7 +477,7 @@ void usb_sg_wait (struct usb_sg_request 
 			io->urbs[i]->dev = NULL;
 			retval = 0;
 			i--;
-			yield ();
+			schedule_timeout(1);
 			break;
 
 			/* no error? continue immediately.


--===============058921454935977113==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============058921454935977113==--
