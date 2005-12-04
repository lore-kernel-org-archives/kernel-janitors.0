From: Marcin Slusarz <marcin.slusarz@gmail.com>
Date: Sun, 04 Dec 2005 00:23:55 +0000
Subject: [KJ] [PATCH 19/21] polling loops: change exit condition to
Message-Id: <4392371B.7090403@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

*  Maintained by:  Jeff Garzik <jgarzik@pobox.com>

Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/scsi/ahci.c linux-2.6.15-rc4/drivers/scsi/ahci.c
--- linux-2.6.15-rc4-orig/drivers/scsi/ahci.c	2005-12-03 15:22:34.000000000 +0100
+++ linux-2.6.15-rc4/drivers/scsi/ahci.c	2005-12-03 16:53:10.000000000 +0100
@@ -790,7 +790,7 @@ static int ahci_host_init(struct ata_pro
 	void __iomem *mmio = probe_ent->mmio_base;
 	u32 tmp, cap_save;
 	u16 tmp16;
-	unsigned int i, j, using_dac;
+	unsigned int i, using_dac;
 	int rc;
 	void __iomem *port_mmio;
 
@@ -862,6 +862,7 @@ static int ahci_host_init(struct ata_pro
 	}
 
 	for (i = 0; i < probe_ent->n_ports; i++) {
+		unsigned long end_time;
 #if 0 /* BIOSen initialize this incorrectly */
 		if (!(hpriv->port_map & (1 << i)))
 			continue;
@@ -891,13 +892,12 @@ static int ahci_host_init(struct ata_pro
 
 		writel(PORT_CMD_SPIN_UP, port_mmio + PORT_CMD);
 
-		j = 0;
-		while (j < 100) {
+		end_time = jiffies + msecs_to_jiffies(1000);
+		while (time_before(jiffies, end_time)) {
 			msleep(10);
 			tmp = readl(port_mmio + PORT_SCR_STAT);
 			if ((tmp & 0xf) = 0x3)
 				break;
-			j++;
 		}
 
 		tmp = readl(port_mmio + PORT_SCR_ERR);

MEGARAID SCSI DRIVERS
P:     Neela Syam Kolli
M:     Neela.Kolli@engenio.com
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/scsi/megaraid/megaraid_mbox.c linux-2.6.15-rc4/drivers/scsi/megaraid/megaraid_mbox.c
--- linux-2.6.15-rc4-orig/drivers/scsi/megaraid/megaraid_mbox.c	2005-12-03 15:22:34.000000000 +0100
+++ linux-2.6.15-rc4/drivers/scsi/megaraid/megaraid_mbox.c	2005-12-03 16:53:10.000000000 +0100
@@ -2833,6 +2833,7 @@ mbox_post_sync_cmd(adapter_t *adapter, u
 	mbox_t		*mbox;
 	uint8_t		status;
 	int		i;
+	unsigned long end_time;
 
 
 	mbox64	= raid_dev->mbox64;
@@ -2864,25 +2865,27 @@ mbox_post_sync_cmd(adapter_t *adapter, u
 	if (mbox->numstatus = 0xFF) {	// status not yet available
 		udelay(25);;
 
-		for (i = 0; mbox->numstatus = 0xFF && i < 1000; i++) {
+		end_time = jiffies + msecs_to_jiffies(1000);
+		while (mbox->numstatus = 0xFF && time_before(jiffies, end_time)) {
 			rmb();
 			msleep(1);
 		}
 
 
-		if (i = 1000) {
+		if (time_after_eq(jiffies, end_time)) {
 			con_log(CL_ANN, (KERN_NOTICE
 				"megaraid mailbox: wait for FW to boot      "));
 
+			end_time = jiffies + msecs_to_jiffies(MBOX_RESET_WAIT * 1000);
 			for (i = 0; (mbox->numstatus = 0xFF) &&
-					(i < MBOX_RESET_WAIT); i++) {
+					time_before(jiffies, end_time); ++i) {
 				rmb();
 				con_log(CL_ANN, ("\b\b\b\b\b[%03d]",
 							MBOX_RESET_WAIT - i));
 				msleep(1000);
 			}
 
-			if (i = MBOX_RESET_WAIT) {
+			if (time_after_eq(jiffies, end_time)) {
 
 				con_log(CL_ANN, (
 				"\nmegaraid mailbox: status not available\n"));
@@ -2897,12 +2900,13 @@ mbox_post_sync_cmd(adapter_t *adapter, u
 	if (mbox->poll != 0x77) {
 		udelay(25);
 
-		for (i = 0; (mbox->poll != 0x77) && (i < 1000); i++) {
+		end_time = jiffies + msecs_to_jiffies(1000);
+		while ((mbox->poll != 0x77) && time_before(jiffies, end_time)) {
 			rmb();
 			msleep(1);
 		}
 
-		if (i = 1000) {
+		if (time_after_eq(jiffies, end_time)) {
 			con_log(CL_ANN, (KERN_WARNING
 			"megaraid mailbox: could not get poll semaphore\n"));
 			return -1;
@@ -2916,12 +2920,13 @@ mbox_post_sync_cmd(adapter_t *adapter, u
 	if (RDINDOOR(raid_dev) & 0x2) {
 		udelay(25);
 
-		for (i = 0; (RDINDOOR(raid_dev) & 0x2) && (i < 1000); i++) {
+		end_time = jiffies + msecs_to_jiffies(1000);
+		while ((RDINDOOR(raid_dev) & 0x2) && time_before(jiffies, end_time)) {
 			rmb();
 			msleep(1);
 		}
 
-		if (i = 1000) {
+		if (time_after_eq(jiffies, end_time)) {
 			con_log(CL_ANN, (KERN_WARNING
 				"megaraid mailbox: could not acknowledge\n"));
 			return -1;
@@ -3011,16 +3016,19 @@ static int
 megaraid_busywait_mbox(mraid_device_t *raid_dev)
 {
 	mbox_t	*mbox = raid_dev->mbox;
-	int	i = 0;
+	unsigned long end_time;
 
 	if (mbox->busy) {
 		udelay(25);
-		for (i = 0; mbox->busy && i < 1000; i++)
+		end_time = jiffies + msecs_to_jiffies(1000);
+		while (mbox->busy && time_before(jiffies, end_time))
 			msleep(1);
 	}
 
-	if (i < 1000) return 0;
-	else return -1;
+	if (mbox->busy)
+		return -1;
+	else
+		return 0;
 }
 
 
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/scsi/megaraid/megaraid_sas.c linux-2.6.15-rc4/drivers/scsi/megaraid/megaraid_sas.c
--- linux-2.6.15-rc4-orig/drivers/scsi/megaraid/megaraid_sas.c	2005-12-03 15:22:34.000000000 +0100
+++ linux-2.6.15-rc4/drivers/scsi/megaraid/megaraid_sas.c	2005-12-03 16:53:10.000000000 +0100
@@ -155,8 +155,7 @@ megasas_disable_intr(struct megasas_regi
 static int
 megasas_issue_polled(struct megasas_instance *instance, struct megasas_cmd *cmd)
 {
-	int i;
-	u32 msecs = MFI_POLL_TIMEOUT_SECS * 1000;
+	unsigned long end_time;
 
 	struct megasas_header *frame_hdr = &cmd->frame->hdr;
 
@@ -172,7 +171,8 @@ megasas_issue_polled(struct megasas_inst
 	/*
 	 * Wait for cmd_status to change
 	 */
-	for (i = 0; (i < msecs) && (frame_hdr->cmd_status = 0xff); i++) {
+	end_time = jiffies + msecs_to_jiffies(MFI_POLL_TIMEOUT_SECS * 1000);
+	while ((frame_hdr->cmd_status = 0xff) && time_before(jiffies, end_time)) {
 		rmb();
 		msleep(1);
 	}
@@ -718,9 +718,9 @@ megasas_queue_command(struct scsi_cmnd *
 static int megasas_wait_for_outstanding(struct megasas_instance *instance)
 {
 	int i;
-	u32 wait_time = MEGASAS_RESET_WAIT_TIME;
+	unsigned long end_time = jiffies + msecs_to_jiffies(MEGASAS_RESET_WAIT_TIME * 1000);
 
-	for (i = 0; i < wait_time; i++) {
+	for (i = 0; time_before(jiffies, end_time); ++i) {
 
 		if (!instance->fw_outstanding)
 			break;
@@ -1169,10 +1169,10 @@ static irqreturn_t megasas_isr(int irq, 
 static int
 megasas_transition_to_ready(struct megasas_register_set __iomem * reg_set)
 {
-	int i;
 	u8 max_wait;
 	u32 fw_state;
 	u32 cur_state;
+	unsigned long end_time;
 
 	fw_state = readl(&reg_set->outbound_msg_0) & MFI_STATE_MASK;
 
@@ -1251,7 +1251,8 @@ megasas_transition_to_ready(struct megas
 		/*
 		 * The cur_state should not last for more than max_wait secs
 		 */
-		for (i = 0; i < (max_wait * 1000); i++) {
+		end_time = jiffies + msecs_to_jiffies(max_wait * 1000);
+		while (time_before(jiffies, end_time)) {
 			fw_state = MFI_STATE_MASK &
 			    readl(&reg_set->outbound_msg_0);
 

QLOGIC QLA2XXX FC-SCSI DRIVER
P:	Andrew Vasquez
M:	andrew.vasquez@qlogic.com
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/scsi/qla2xxx/qla_os.c linux-2.6.15-rc4/drivers/scsi/qla2xxx/qla_os.c
--- linux-2.6.15-rc4-orig/drivers/scsi/qla2xxx/qla_os.c	2005-12-03 15:22:34.000000000 +0100
+++ linux-2.6.15-rc4/drivers/scsi/qla2xxx/qla_os.c	2005-12-03 16:53:10.000000000 +0100
@@ -2470,15 +2470,14 @@ qla2x00_timer(scsi_qla_host_t *ha)
 int
 qla2x00_down_timeout(struct semaphore *sema, unsigned long timeout)
 {
-	const unsigned int step = 100; /* msecs */
-	unsigned int iterations = jiffies_to_msecs(timeout)/100;
+	unsigned long end_time = jiffies + timeout;
 
 	do {
 		if (!down_trylock(sema))
 			return 0;
-		if (msleep_interruptible(step))
+		if (msleep_interruptible(100))
 			break;
-	} while (--iterations >= 0);
+	} while (time_before(jiffies, end_time));
 
 	return -ETIMEDOUT;
 }
*  Maintained by:  Jeff Garzik <jgarzik@pobox.com>
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/scsi/sata_sx4.c linux-2.6.15-rc4/drivers/scsi/sata_sx4.c
--- linux-2.6.15-rc4-orig/drivers/scsi/sata_sx4.c	2005-12-03 15:22:34.000000000 +0100
+++ linux-2.6.15-rc4/drivers/scsi/sata_sx4.c	2005-12-03 16:53:10.000000000 +0100
@@ -1167,6 +1167,7 @@ static unsigned int pdc20621_prog_dimm_g
 	u32 data, spd0;
    	int error, i;
    	void __iomem *mmio = pe->mmio_base;
+	unsigned long end_time;
 
 	/* hard-code chip #0 */
    	mmio += PDC_CHIP0_OFS;
@@ -1198,7 +1199,8 @@ static unsigned int pdc20621_prog_dimm_g
    	writel(data, mmio + PDC_SDRAM_CONTROL_OFFSET);
 
    	error = 1;
-   	for (i = 1; i <= 10; i++) {   /* polling ~5 secs */
+	end_time = jiffies + msecs_to_jiffies(5600);
+	for (i = 1; time_before(jiffies, end_time); ++i) {   /* polling ~5 secs */
 		data = readl(mmio + PDC_SDRAM_CONTROL_OFFSET);
 		if (!(data & (1<<19))) {
 	   		error = 0;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
