From: Marcin Slusarz <marcin.slusarz@gmail.com>
Date: Sun, 04 Dec 2005 00:21:15 +0000
Subject: [KJ] [PATCH 15/21] polling loops: change exit condition to
Message-Id: <4392367B.7070906@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

bug in drivers/pci/hotplug/ibmphp_hpc.c - CMD_COMPLETE_TOUT_SEC wasn't treated as seconds (timeout was 0.6s instead 60s as comment say)

PCI HOTPLUG CORE
P:	Greg Kroah-Hartman
M:	gregkh@suse.de

Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/pci/hotplug/ibmphp_hpc.c linux-2.6.15-rc4/drivers/pci/hotplug/ibmphp_hpc.c
--- linux-2.6.15-rc4-orig/drivers/pci/hotplug/ibmphp_hpc.c	2005-11-20 16:53:26.000000000 +0100
+++ linux-2.6.15-rc4/drivers/pci/hotplug/ibmphp_hpc.c	2005-12-03 16:53:10.000000000 +0100
@@ -150,11 +150,11 @@ void __init ibmphp_hpc_initvars (void)
 static u8 i2c_ctrl_read (struct controller *ctlr_ptr, void __iomem *WPGBbar, u8 index)
 {
 	u8 status;
-	int i;
 	void __iomem *wpg_addr;	// base addr + offset
 	unsigned long wpg_data;	// data to/from WPG LOHI format
 	unsigned long ultemp;
 	unsigned long data;	// actual data HILO format
+	unsigned long end_time;
 
 	debug_polling ("%s - Entry WPGBbar[%p] index[%x] \n", __FUNCTION__, WPGBbar, index);
 
@@ -204,33 +204,31 @@ static u8 i2c_ctrl_read (struct controll
 
 	//--------------------------------------------------------------------
 	// READ - step 4 : wait until start operation bit clears
-	i = CMD_COMPLETE_TOUT_SEC;
-	while (i) {
+	end_time = jiffies + msecs_to_jiffies(CMD_COMPLETE_TOUT_SEC * 1000);
+	while (time_before(jiffies, end_time)) {
 		msleep(10);
 		wpg_addr = WPGBbar + WPG_I2CMCNTL_OFFSET;
 		wpg_data = readl (wpg_addr);
 		data = swab32 (wpg_data);
 		if (!(data & WPG_I2CMCNTL_STARTOP_MASK))
 			break;
-		i--;
 	}
-	if (i = 0) {
+	if (data & WPG_I2CMCNTL_STARTOP_MASK) {
 		debug ("%s - Error : WPG timeout\n", __FUNCTION__);
 		return HPC_ERROR;
 	}
 	//--------------------------------------------------------------------
 	// READ - step 5 : read I2C status register
-	i = CMD_COMPLETE_TOUT_SEC;
-	while (i) {
+	end_time = jiffies + msecs_to_jiffies(CMD_COMPLETE_TOUT_SEC * 1000);
+	while (time_before(jiffies, end_time)) {
 		msleep(10);
 		wpg_addr = WPGBbar + WPG_I2CSTAT_OFFSET;
 		wpg_data = readl (wpg_addr);
 		data = swab32 (wpg_data);
 		if (HPC_I2CSTATUS_CHECK (data))
 			break;
-		i--;
 	}
-	if (i = 0) {
+	if (!(HPC_I2CSTATUS_CHECK (data))) {
 		debug ("ctrl_read - Exit Error:I2C timeout\n");
 		return HPC_ERROR;
 	}
@@ -315,34 +313,32 @@ static u8 i2c_ctrl_write (struct control
 
 	//--------------------------------------------------------------------
 	// WRITE - step 4 : wait until start operation bit clears
-	i = CMD_COMPLETE_TOUT_SEC;
-	while (i) {
+	end_time = jiffies + msecs_to_jiffies(CMD_COMPLETE_TOUT_SEC * 1000);
+	while (time_before(jiffies, end_time)) {
 		msleep(10);
 		wpg_addr = WPGBbar + WPG_I2CMCNTL_OFFSET;
 		wpg_data = readl (wpg_addr);
 		data = swab32 (wpg_data);
 		if (!(data & WPG_I2CMCNTL_STARTOP_MASK))
 			break;
-		i--;
 	}
-	if (i = 0) {
+	if (data & WPG_I2CMCNTL_STARTOP_MASK) {
 		debug ("%s - Exit Error:WPG timeout\n", __FUNCTION__);
 		rc = HPC_ERROR;
 	}
 
 	//--------------------------------------------------------------------
 	// WRITE - step 5 : read I2C status register
-	i = CMD_COMPLETE_TOUT_SEC;
-	while (i) {
+	end_time = jiffies + msecs_to_jiffies(CMD_COMPLETE_TOUT_SEC * 1000);
+	while (time_before(jiffies, end_time)) {
 		msleep(10);
 		wpg_addr = WPGBbar + WPG_I2CSTAT_OFFSET;
 		wpg_data = readl (wpg_addr);
 		data = swab32 (wpg_data);
 		if (HPC_I2CSTATUS_CHECK (data))
 			break;
-		i--;
 	}
-	if (i = 0) {
+	if (!(HPC_I2CSTATUS_CHECK (data))) {
 		debug ("ctrl_read - Error : I2C timeout\n");
 		rc = HPC_ERROR;
 	}

SHPC HOTPLUG DRIVER
P:	Kristen Carlson Accardi
M:	kristen.c.accardi@intel.com
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/pci/hotplug/shpchp_hpc.c linux-2.6.15-rc4/drivers/pci/hotplug/shpchp_hpc.c
--- linux-2.6.15-rc4-orig/drivers/pci/hotplug/shpchp_hpc.c	2005-12-03 15:22:33.000000000 +0100
+++ linux-2.6.15-rc4/drivers/pci/hotplug/shpchp_hpc.c	2005-12-03 16:53:10.000000000 +0100
@@ -281,7 +281,7 @@ static int shpc_write_cmd(struct slot *s
 	u16 cmd_status;
 	int retval = 0;
 	u16 temp_word;
-	int i;
+	unsigned long end_time;
 
 	DBG_ENTER_ROUTINE 
 	
@@ -290,7 +290,8 @@ static int shpc_write_cmd(struct slot *s
 		return -1;
 	}
 
-	for (i = 0; i < 10; i++) {
+	end_time = jiffies + msecs_to_jiffies(1000);
+	while (time_before(jiffies, end_time)) {
 		cmd_status = readw(php_ctlr->creg + CMD_STATUS);
 		
 		if (!(cmd_status & 0x1))
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
