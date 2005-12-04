From: Marcin Slusarz <marcin.slusarz@gmail.com>
Date: Sun, 04 Dec 2005 00:20:43 +0000
Subject: [KJ] [PATCH 14/21] polling loops: change exit condition to
Message-Id: <4392365B.7050206@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

small bug in drivers/net/sis190.c - "i" never reached 1000

NETWORK DEVICE DRIVERS
P:	Andrew Morton
M:	akpm@osdl.org
P:	Jeff Garzik
M:	jgarzik@pobox.com

Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/net/bnx2.c linux-2.6.15-rc4/drivers/net/bnx2.c
--- linux-2.6.15-rc4-orig/drivers/net/bnx2.c	2005-12-03 15:22:33.000000000 +0100
+++ linux-2.6.15-rc4/drivers/net/bnx2.c	2005-12-03 16:53:10.000000000 +0100
@@ -4055,9 +4055,9 @@ bnx2_test_link(struct bnx2 *bp)
 static int
 bnx2_test_intr(struct bnx2 *bp)
 {
-	int i;
 	u32 val;
 	u16 status_idx;
+	unsigned long end_time;
 
 	if (!netif_running(bp->dev))
 		return -ENODEV;
@@ -4069,7 +4069,8 @@ bnx2_test_intr(struct bnx2 *bp)
 	REG_WR(bp, BNX2_HC_COMMAND, val | BNX2_HC_COMMAND_COAL_NOW);
 	REG_RD(bp, BNX2_HC_COMMAND);
 
-	for (i = 0; i < 10; i++) {
+	end_time = jiffies + msecs_to_jiffies(100);
+	while (time_before(jiffies, end_time)) {
 		if ((REG_RD(bp, BNX2_PCICFG_INT_ACK_CMD) & 0xffff) ! 			status_idx) {
 
@@ -4078,7 +4079,7 @@ bnx2_test_intr(struct bnx2 *bp)
 
 		msleep_interruptible(10);
 	}
-	if (i < 10)
+	if (time_before(jiffies, end_time))
 		return 0;
 
 	return -ENODEV;
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/net/pcmcia/xirc2ps_cs.c linux-2.6.15-rc4/drivers/net/pcmcia/xirc2ps_cs.c
--- linux-2.6.15-rc4-orig/drivers/net/pcmcia/xirc2ps_cs.c	2005-11-20 16:53:20.000000000 +0100
+++ linux-2.6.15-rc4/drivers/net/pcmcia/xirc2ps_cs.c	2005-12-03 16:53:10.000000000 +0100
@@ -1871,7 +1871,7 @@ init_mii(struct net_device *dev)
     local_info_t *local = netdev_priv(dev);
     kio_addr_t ioaddr = dev->base_addr;
     unsigned control, status, linkpartner;
-    int i;
+	unsigned long end_time;
 
     if (if_port = 4 || if_port = 1) { /* force 100BaseT or 10BaseT */
 	dev->if_port = if_port;
@@ -1905,13 +1905,13 @@ init_mii(struct net_device *dev)
     if (local->probe_port) {
 	/* according to the DP83840A specs the auto negotiation process
 	 * may take up to 3.5 sec, so we use this also for our ML6692
-	 * Fixme: Better to use a timer here!
 	 */
-	for (i=0; i < 35; i++) {
-	    msleep(100);	 /* wait 100 msec */
-	    status = mii_rd(ioaddr,  0, 1);
-	    if ((status & 0x0020) && (status & 0x0004))
-		break;
+	end_time = jiffies + msecs_to_jiffies(3500);
+	while (time_before(jiffies, end_time)) {
+		msleep(100);	 /* wait 100 msec */
+		status = mii_rd(ioaddr,  0, 1);
+		if ((status & 0x0020) && (status & 0x0004))
+			break;
 	}
 
 	if (!(status & 0x0020)) {
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/net/s2io.c linux-2.6.15-rc4/drivers/net/s2io.c
--- linux-2.6.15-rc4-orig/drivers/net/s2io.c	2005-12-03 15:22:33.000000000 +0100
+++ linux-2.6.15-rc4/drivers/net/s2io.c	2005-12-03 17:03:28.000000000 +0100
@@ -829,13 +829,13 @@ static int init_nic(struct s2io_nic *nic
 	struct net_device *dev = nic->dev;
 	register u64 val64 = 0;
 	void __iomem *add;
-	u32 time;
 	int i, j;
 	mac_info_t *mac_control;
 	struct config_param *config;
 	int mdio_cnt = 0, dtx_cnt = 0;
 	unsigned long long mem_share;
 	int mem_size;
+	unsigned long end_time;
 
 	mac_control = &nic->mac_control;
 	config = &nic->config;
@@ -1351,19 +1351,18 @@ static int init_nic(struct s2io_nic *nic
 	 * We wait for a maximum of 500ms for the operation to complete,
 	 * if it's not complete by then we return error.
 	 */
-	time = 0;
+	end_time = jiffies + msecs_to_jiffies(500);
 	while (TRUE) {
 		val64 = readq(&bar0->tti_command_mem);
 		if (!(val64 & TTI_CMD_MEM_STROBE_NEW_CMD)) {
 			break;
 		}
-		if (time > 10) {
+		if (time_after(jiffies, end_time)) {
 			DBG_PRINT(ERR_DBG, "%s: TTI init Failed\n",
 				  dev->name);
 			return -1;
 		}
 		msleep(50);
-		time++;
 	}
 
 	if (nic->config.bimodal) {
@@ -1379,19 +1378,18 @@ static int init_nic(struct s2io_nic *nic
 		 * We wait for a maximum of 500ms for the operation to complete,
 		 * if it's not complete by then we return error.
 		*/
-			time = 0;
+			end_time = jiffies + msecs_to_jiffies(500);
 			while (TRUE) {
 				val64 = readq(&bar0->tti_command_mem);
 				if (!(val64 & TTI_CMD_MEM_STROBE_NEW_CMD)) {
 					break;
 				}
-				if (time > 10) {
+				if (time_after(jiffies, end_time)) {
 					DBG_PRINT(ERR_DBG,
 						"%s: TTI init Failed\n",
 					dev->name);
 					return -1;
 				}
-				time++;
 				msleep(50);
 			}
 		}
@@ -1436,18 +1434,17 @@ static int init_nic(struct s2io_nic *nic
 			 * for the operation to complete, if it's not complete
 			 * by then we return error.
 			 */
-			time = 0;
+			end_time = jiffies + msecs_to_jiffies(500);
 			while (TRUE) {
 				val64 = readq(&bar0->rti_command_mem);
 				if (!(val64 & RTI_CMD_MEM_STROBE_NEW_CMD)) {
 					break;
 				}
-				if (time > 10) {
+				if (time_after(jiffies, end_time)) {
 					DBG_PRINT(ERR_DBG, "%s: RTI init Failed\n",
 						  dev->name);
 					return -1;
 				}
-				time++;
 				msleep(50);
 			}
 		}
@@ -2833,8 +2830,9 @@ static void alarm_intr_handler(struct s2
 static int wait_for_cmd_complete(nic_t * sp)
 {
 	XENA_dev_config_t __iomem *bar0 = sp->bar0;
-	int ret = FAILURE, cnt = 0;
+	int ret = FAILURE;
 	u64 val64;
+	unsigned long end_time = jiffies + msecs_to_jiffies(500);
 
 	while (TRUE) {
 		val64 = readq(&bar0->rmac_addr_cmd_mem);
@@ -2843,7 +2841,7 @@ static int wait_for_cmd_complete(nic_t *
 			break;
 		}
 		msleep(50);
-		if (cnt++ > 10)
+		if (time_after(jiffies, end_time))
 			break;
 	}
 
@@ -4792,13 +4790,15 @@ static int s2io_eeprom_test(nic_t * sp, 
 static int s2io_bist_test(nic_t * sp, uint64_t * data)
 {
 	u8 bist = 0;
-	int cnt = 0, ret = -1;
+	int ret = -1;
+	unsigned long end_time;
 
 	pci_read_config_byte(sp->pdev, PCI_BIST, &bist);
 	bist |= PCI_BIST_START;
 	pci_write_config_word(sp->pdev, PCI_BIST, bist);
 
-	while (cnt < 20) {
+	end_time = jiffies + msecs_to_jiffies(2000);
+	while (time_before(jiffies, end_time)) {
 		pci_read_config_byte(sp->pdev, PCI_BIST, &bist);
 		if (!(bist & PCI_BIST_START)) {
 			*data = (bist & PCI_BIST_CODE_MASK);
@@ -4806,7 +4806,6 @@ static int s2io_bist_test(nic_t * sp, ui
 			break;
 		}
 		msleep(100);
-		cnt++;
 	}
 
 	return ret;
@@ -4854,7 +4853,8 @@ static int s2io_rldram_test(nic_t * sp, 
 {
 	XENA_dev_config_t __iomem *bar0 = sp->bar0;
 	u64 val64;
-	int cnt, iteration = 0, test_fail = 0;
+	int iteration = 0, test_fail = 0;
+	unsigned long end_time;
 
 	val64 = readq(&bar0->adapter_control);
 	val64 &= ~ADAPTER_ECC_EN;
@@ -4897,27 +4897,29 @@ static int s2io_rldram_test(nic_t * sp, 
 		    	MC_RLDRAM_TEST_GO;
 		SPECIAL_REG_WRITE(val64, &bar0->mc_rldram_test_ctrl, LF);
 
-		for (cnt = 0; cnt < 5; cnt++) {
+		end_time = jiffies + msecs_to_jiffies(1000);
+		while (time_before(jiffies, end_time)) {
 			val64 = readq(&bar0->mc_rldram_test_ctrl);
 			if (val64 & MC_RLDRAM_TEST_DONE)
 				break;
 			msleep(200);
 		}
 
-		if (cnt = 5)
+		if (time_after_eq(jiffies, end_time))
 			break;
 
 		val64 = MC_RLDRAM_TEST_MODE | MC_RLDRAM_TEST_GO;
 		SPECIAL_REG_WRITE(val64, &bar0->mc_rldram_test_ctrl, LF);
 
-		for (cnt = 0; cnt < 5; cnt++) {
+		end_time = jiffies + msecs_to_jiffies(2500);
+		while (time_before(jiffies, end_time)) {
 			val64 = readq(&bar0->mc_rldram_test_ctrl);
 			if (val64 & MC_RLDRAM_TEST_DONE)
 				break;
 			msleep(500);
 		}
 
-		if (cnt = 5)
+		if (time_after_eq(jiffies, end_time))
 			break;
 
 		val64 = readq(&bar0->mc_rldram_test_ctrl);
@@ -5378,10 +5380,10 @@ static void s2io_set_link(unsigned long 
 
 static void s2io_card_down(nic_t * sp)
 {
-	int cnt = 0;
 	XENA_dev_config_t __iomem *bar0 = sp->bar0;
 	unsigned long flags;
 	register u64 val64 = 0;
+	unsigned long end_time;
 
 	del_timer_sync(&sp->alarm_timer);
 	/* If s2io_set_link task is executing, wait till it completes. */
@@ -5397,6 +5399,7 @@ static void s2io_card_down(nic_t * sp)
 	tasklet_kill(&sp->task);
 
 	/* Check if the device is Quiescent and then Reset the NIC */
+	end_time = jiffies + msecs_to_jiffies(500);
 	do {
 		val64 = readq(&bar0->adapter_status);
 		if (verify_xena_quiescence(sp, val64, sp->device_enabled_once)) {
@@ -5404,8 +5407,7 @@ static void s2io_card_down(nic_t * sp)
 		}
 
 		msleep(50);
-		cnt++;
-		if (cnt = 10) {
+		if (time_after(jiffies, end_time)) {
 			DBG_PRINT(ERR_DBG,
 				  "s2io_close:Device not Quiescent ");
 			DBG_PRINT(ERR_DBG, "adaper status reads 0x%llx\n",
@@ -5416,13 +5418,12 @@ static void s2io_card_down(nic_t * sp)
 	s2io_reset(sp);
 
 	/* Waiting till all Interrupt handlers are complete */
-	cnt = 0;
-	do {
+	end_time = jiffies + msecs_to_jiffies(50);
+	while (time_before(jiffies, end_time)) {
 		msleep(10);
 		if (!atomic_read(&sp->isr_cnt))
 			break;
-		cnt++;
-	} while(cnt < 5);
+	}
 
 	spin_lock_irqsave(&sp->tx_lock, flags);
 	/* Free all Tx buffers */
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/net/sis190.c linux-2.6.15-rc4/drivers/net/sis190.c
--- linux-2.6.15-rc4-orig/drivers/net/sis190.c	2005-12-03 15:22:33.000000000 +0100
+++ linux-2.6.15-rc4/drivers/net/sis190.c	2005-12-03 16:53:10.000000000 +0100
@@ -370,19 +370,20 @@ static int multicast_filter_limit = 32;
 
 static void __mdio_cmd(void __iomem *ioaddr, u32 ctl)
 {
-	unsigned int i;
+	unsigned long end_time;
 
 	SIS_W32(GMIIControl, ctl);
 
 	msleep(1);
 
-	for (i = 0; i < 100; i++) {
+	end_time = jiffies + msecs_to_jiffies(100);
+	while (time_before(jiffies, end_time)) {
 		if (!(SIS_R32(GMIIControl) & EhnMIInotDone))
 			break;
 		msleep(1);
 	}
 
-	if (i > 999)
+	if (time_after_eq(jiffies, end_time))
 		printk(KERN_ERR PFX "PHY command failed !\n");
 }
 
@@ -424,14 +425,15 @@ static u16 mdio_read_latched(void __iome
 static u16 __devinit sis190_read_eeprom(void __iomem *ioaddr, u32 reg)
 {
 	u16 data = 0xffff;
-	unsigned int i;
+	unsigned long end_time;
 
 	if (!(SIS_R32(ROMControl) & 0x0002))
 		return 0;
 
 	SIS_W32(ROMInterface, EEREQ | EEROP | (reg << 10));
 
-	for (i = 0; i < 200; i++) {
+	end_time = jiffies + msecs_to_jiffies(200);
+	while (time_before(jiffies, end_time)) {
 		if (!(SIS_R32(ROMInterface) & EEREQ)) {
 			data = (SIS_R32(ROMInterface) & 0xffff0000) >> 16;
 			break;

SKGE, SKY2 10/100/1000 GIGABIT ETHERNET DRIVERS
P:	Stephen Hemminger
M:	shemminger@osdl.org
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/net/skge.c linux-2.6.15-rc4/drivers/net/skge.c
--- linux-2.6.15-rc4-orig/drivers/net/skge.c	2005-12-03 15:22:33.000000000 +0100
+++ linux-2.6.15-rc4/drivers/net/skge.c	2005-12-03 16:53:10.000000000 +0100
@@ -680,21 +680,21 @@ static void skge_led(struct skge_port *s
 static int skge_phys_id(struct net_device *dev, u32 data)
 {
 	struct skge_port *skge = netdev_priv(dev);
-	unsigned long ms;
+	unsigned long end_time;
 	enum led_mode mode = LED_MODE_TST;
 
 	if (!data || data > (u32)(MAX_SCHEDULE_TIMEOUT / HZ))
-		ms = jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT / HZ) * 1000;
+		end_time = jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT / HZ) * 1000;
 	else
-		ms = data * 1000;
+		end_time = data * 1000;
 
-	while (ms > 0) {
+	end_time = jiffies + msecs_to_jiffies(end_time);
+	while (time_before(jiffies, end_time)) {
 		skge_led(skge, mode);
 		mode ^= LED_MODE_TST;
 
 		if (msleep_interruptible(BLINK_MS))
 			break;
-		ms -= BLINK_MS;
 	}
 
 	/* back to regular LED state */
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/net/tg3.c linux-2.6.15-rc4/drivers/net/tg3.c
--- linux-2.6.15-rc4-orig/drivers/net/tg3.c	2005-12-03 15:22:33.000000000 +0100
+++ linux-2.6.15-rc4/drivers/net/tg3.c	2005-12-03 16:53:10.000000000 +0100
@@ -6229,7 +6229,8 @@ static void tg3_timer(unsigned long __op
 static int tg3_test_interrupt(struct tg3 *tp)
 {
 	struct net_device *dev = tp->dev;
-	int err, i;
+	int err;
+	unsigned long end_time;
 	u32 int_mbox = 0;
 
 	if (!netif_running(dev))
@@ -6250,7 +6251,8 @@ static int tg3_test_interrupt(struct tg3
 	tw32_f(HOSTCC_MODE, tp->coalesce_mode | HOSTCC_MODE_ENABLE |
 	       HOSTCC_MODE_NOW);
 
-	for (i = 0; i < 5; i++) {
+	end_time = jiffies + msecs_to_jiffies(50);
+	while (time_before(jiffies, end_time)) {
 		int_mbox = tr32_mailbox(MAILBOX_INTERRUPT_0 +
 					TG3_64BIT_REG_LOW);
 		if (int_mbox != 0)
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/net/wan/cycx_drv.c linux-2.6.15-rc4/drivers/net/wan/cycx_drv.c
--- linux-2.6.15-rc4-orig/drivers/net/wan/cycx_drv.c	2005-12-03 15:22:33.000000000 +0100
+++ linux-2.6.15-rc4/drivers/net/wan/cycx_drv.c	2005-12-03 16:53:10.000000000 +0100
@@ -383,7 +383,7 @@ static int cycx_code_boot(void __iomem *
  * o start adapter up */
 static int load_cyc2x(struct cycx_hw *hw, struct cycx_firmware *cfm, u32 len)
 {
-	int i, j;
+	unsigned long end_time, end_time2;
 	struct cycx_fw_header *img_hdr;
 	u8 *reset_image,
 	   *data_image,
@@ -448,7 +448,8 @@ static int load_cyc2x(struct cycx_hw *hw
 			 cfm->descr[0] ? cfm->descr : "unknown firmware",
 			 cfm->info.codeid);
 
-	for (i = 0 ; i < 5 ; i++) {
+	end_time = jiffies + msecs_to_jiffies(20000);
+	while (time_before(jiffies, end_time)) {
 		/* Reset Cyclom hardware */
 		if (!reset_cyc2x(hw->dpmbase)) {
 			printk(KERN_ERR "%s: dpm problem or board not found\n",
@@ -462,7 +463,8 @@ static int load_cyc2x(struct cycx_hw *hw
 		writew(GEN_POWER_ON, pt_cycld);
 		msleep_interruptible(1 * 1000);
 
-		for (j = 0 ; j < 3 ; j++)
+		end_time2 = jiffies + msecs_to_jiffies(3000);
+		while (time_before(jiffies, end_time2))
 			if (!readw(pt_cycld))
 				goto reset_loaded;
 			else
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
