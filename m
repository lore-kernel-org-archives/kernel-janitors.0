From: Marcin Slusarz <marcin.slusarz@gmail.com>
Date: Sun, 04 Dec 2005 00:16:23 +0000
Subject: [KJ] [PATCH 6/21] polling loops: change exit condition to
Message-Id: <43923557.3020509@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I2C SUBSYSTEM
P:	Jean Delvare
M:	khali@linux-fr.org

Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/i2c/algos/i2c-algo-pca.c linux-2.6.15-rc4/drivers/i2c/algos/i2c-algo-pca.c
--- linux-2.6.15-rc4-orig/drivers/i2c/algos/i2c-algo-pca.c	2005-12-03 15:22:32.000000000 +0100
+++ linux-2.6.15-rc4/drivers/i2c/algos/i2c-algo-pca.c	2005-12-03 16:53:10.000000000 +0100
@@ -187,9 +187,10 @@ static int pca_xfer(struct i2c_adapter *
 	int numbytes = 0;
 	int state;
 	int ret;
-	int timeout = 100;
+	unsigned long end_time;
 
-	while ((state = pca_status(adap)) != 0xf8 && timeout--) {
+	end_time = jiffies + msecs_to_jiffies(1000);
+	while ((state = pca_status(adap)) != 0xf8 && time_before(jiffies, end_time)) {
 		msleep(10);
 	}
 	if (state != 0xf8) {
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/i2c/busses/i2c-ali1535.c linux-2.6.15-rc4/drivers/i2c/busses/i2c-ali1535.c
--- linux-2.6.15-rc4-orig/drivers/i2c/busses/i2c-ali1535.c	2005-12-03 15:22:32.000000000 +0100
+++ linux-2.6.15-rc4/drivers/i2c/busses/i2c-ali1535.c	2005-12-03 16:53:10.000000000 +0100
@@ -210,7 +210,7 @@ static int ali1535_transaction(struct i2
 {
 	int temp;
 	int result = 0;
-	int timeout = 0;
+	unsigned long end_time;
 
 	dev_dbg(&adap->dev, "Transaction (pre): STS=%02x, TYP=%02x, "
 		"CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
@@ -275,15 +275,15 @@ static int ali1535_transaction(struct i2
 	outb_p(0xFF, SMBHSTPORT);
 
 	/* We will always wait for a fraction of a second! */
-	timeout = 0;
+	end_time = jiffies + msecs_to_jiffies(MAX_TIMEOUT);
 	do {
 		msleep(1);
 		temp = inb_p(SMBHSTSTS);
 	} while (((temp & ALI1535_STS_BUSY) && !(temp & ALI1535_STS_IDLE))
-		 && (timeout++ < MAX_TIMEOUT));
+		 && time_before(jiffies, end_time));
 
 	/* If the SMBus is still busy, we give up */
-	if (timeout >= MAX_TIMEOUT) {
+	if (time_after_eq(jiffies, end_time)) {
 		result = -1;
 		dev_err(&adap->dev, "SMBus Timeout!\n");
 	}
@@ -342,19 +342,19 @@ static s32 ali1535_access(struct i2c_ada
 {
 	int i, len;
 	int temp;
-	int timeout;
 	s32 result = 0;
+	unsigned long end_time;
 
 	down(&i2c_ali1535_sem);
 	/* make sure SMBus is idle */
 	temp = inb_p(SMBHSTSTS);
-	for (timeout = 0;
-	     (timeout < MAX_TIMEOUT) && !(temp & ALI1535_STS_IDLE);
-	     timeout++) {
+
+	end_time = jiffies + msecs_to_jiffies(MAX_TIMEOUT);
+	while (time_before(jiffies, end_time) && !(temp & ALI1535_STS_IDLE)) {
 		msleep(1);
 		temp = inb_p(SMBHSTSTS);
 	}
-	if (timeout >= MAX_TIMEOUT)
+	if (time_after_eq(jiffies, end_time))
 		dev_warn(&adap->dev, "Idle wait Timeout! STS=0x%02x\n", temp);
 
 	/* clear status register (clear-on-write) */

ALI1563 I2C DRIVER
P:	Rudolf Marek
M:	r.marek@sh.cvut.cz
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/i2c/busses/i2c-ali1563.c linux-2.6.15-rc4/drivers/i2c/busses/i2c-ali1563.c
--- linux-2.6.15-rc4-orig/drivers/i2c/busses/i2c-ali1563.c	2005-12-03 15:22:32.000000000 +0100
+++ linux-2.6.15-rc4/drivers/i2c/busses/i2c-ali1563.c	2005-12-03 16:53:10.000000000 +0100
@@ -66,7 +66,8 @@ static unsigned short ali1563_smba;
 static int ali1563_transaction(struct i2c_adapter * a, int size)
 {
 	u32 data;
-	int timeout;
+	unsigned long end_time;
+	int timeout_reached;
 
 	dev_dbg(&a->dev, "Transaction (pre): STS=%02x, CNTL1=%02x, "
 		"CNTL2=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
@@ -84,10 +85,11 @@ static int ali1563_transaction(struct i2
 	}
 	outb_p(inb_p(SMB_HST_CNTL2) | HST_CNTL2_START, SMB_HST_CNTL2);
 
-	timeout = ALI1563_MAX_TIMEOUT;
+	end_time = jiffies + msecs_to_jiffies(ALI1563_MAX_TIMEOUT);
 	do
 		msleep(1);
-	while (((data = inb_p(SMB_HST_STS)) & HST_STS_BUSY) && --timeout);
+	while (((data = inb_p(SMB_HST_STS)) & HST_STS_BUSY) && time_before(jiffies, end_time));
+	timeout_reached = time_after_eq(jiffies, end_time);
 
 	dev_dbg(&a->dev, "Transaction (post): STS=%02x, CNTL1=%02x, "
 		"CNTL2=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
@@ -95,10 +97,10 @@ static int ali1563_transaction(struct i2
 		inb_p(SMB_HST_CMD), inb_p(SMB_HST_ADD), inb_p(SMB_HST_DAT0),
 		inb_p(SMB_HST_DAT1));
 
-	if (timeout && !(data & HST_STS_BAD))
+	if (timeout_reached && !(data & HST_STS_BAD))
 		return 0;
 
-	if (!timeout) {
+	if (!timeout_reached) {
 		dev_err(&a->dev, "Timeout - Trying to KILL transaction!\n");
 		/* Issue 'kill' to host controller */
 		outb_p(HST_CNTL2_KILL,SMB_HST_CNTL2);
@@ -128,7 +130,8 @@ static int ali1563_transaction(struct i2
 static int ali1563_block_start(struct i2c_adapter * a)
 {
 	u32 data;
-	int timeout;
+	unsigned long end_time;
+	int timeout_reached;
 
 	dev_dbg(&a->dev, "Block (pre): STS=%02x, CNTL1=%02x, "
 		"CNTL2=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
@@ -151,10 +154,11 @@ static int ali1563_block_start(struct i2
 	/* Start transaction and wait for byte-ready bit to be set */
 	outb_p(inb_p(SMB_HST_CNTL2) | HST_CNTL2_START, SMB_HST_CNTL2);
 
-	timeout = ALI1563_MAX_TIMEOUT;
+	end_time = jiffies + msecs_to_jiffies(ALI1563_MAX_TIMEOUT);
 	do
 		msleep(1);
-	while (!((data = inb_p(SMB_HST_STS)) & HST_STS_DONE) && --timeout);
+	while (!((data = inb_p(SMB_HST_STS)) & HST_STS_DONE) && time_before(jiffies, end_time));
+	timeout_reached = time_after_eq(jiffies, end_time);
 
 	dev_dbg(&a->dev, "Block (post): STS=%02x, CNTL1=%02x, "
 		"CNTL2=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
@@ -162,10 +166,10 @@ static int ali1563_block_start(struct i2
 		inb_p(SMB_HST_CMD), inb_p(SMB_HST_ADD), inb_p(SMB_HST_DAT0),
 		inb_p(SMB_HST_DAT1));
 
-	if (timeout && !(data & HST_STS_BAD))
+	if (timeout_reached && !(data & HST_STS_BAD))
 		return 0;
 	dev_err(&a->dev, "SMBus Error: %s%s%s%s%s\n",
-		timeout ? "Timeout " : "",
+		timeout_reached ? "Timeout " : "",
 		data & HST_STS_FAIL ? "Transaction Failed " : "",
 		data & HST_STS_BUSERR ? "No response or Bus Collision " : "",
 		data & HST_STS_DEVERR ? "Device Error " : "",
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/i2c/busses/i2c-ali15x3.c linux-2.6.15-rc4/drivers/i2c/busses/i2c-ali15x3.c
--- linux-2.6.15-rc4-orig/drivers/i2c/busses/i2c-ali15x3.c	2005-12-03 15:22:32.000000000 +0100
+++ linux-2.6.15-rc4/drivers/i2c/busses/i2c-ali15x3.c	2005-12-03 16:53:10.000000000 +0100
@@ -231,7 +231,7 @@ static int ali15x3_transaction(struct i2
 {
 	int temp;
 	int result = 0;
-	int timeout = 0;
+	unsigned long end_time;
 
 	dev_dbg(&adap->dev, "Transaction (pre): STS=%02x, CNT=%02x, CMD=%02x, "
 		"ADD=%02x, DAT0=%02x, DAT1=%02x\n", inb_p(SMBHSTSTS),
@@ -296,15 +296,15 @@ static int ali15x3_transaction(struct i2
 	outb_p(0xFF, SMBHSTSTART);
 
 	/* We will always wait for a fraction of a second! */
-	timeout = 0;
+	end_time = jiffies + msecs_to_jiffies(MAX_TIMEOUT);
 	do {
 		msleep(1);
 		temp = inb_p(SMBHSTSTS);
 	} while ((!(temp & (ALI15X3_STS_ERR | ALI15X3_STS_DONE)))
-		 && (timeout++ < MAX_TIMEOUT));
+		 && time_before(jiffies, end_time));
 
 	/* If the SMBus is still busy, we give up */
-	if (timeout >= MAX_TIMEOUT) {
+	if (time_after_eq(jiffies, end_time)) {
 		result = -1;
 		dev_err(&adap->dev, "SMBus Timeout!\n");
 	}
@@ -346,19 +346,19 @@ static s32 ali15x3_access(struct i2c_ada
 {
 	int i, len;
 	int temp;
-	int timeout;
+	unsigned long end_time;
 
 	/* clear all the bits (clear-on-write) */
 	outb_p(0xFF, SMBHSTSTS);
 	/* make sure SMBus is idle */
 	temp = inb_p(SMBHSTSTS);
-	for (timeout = 0;
-	     (timeout < MAX_TIMEOUT) && !(temp & ALI15X3_STS_IDLE);
-	     timeout++) {
+
+	end_time = jiffies + msecs_to_jiffies(MAX_TIMEOUT);
+	while (time_before(jiffies, end_time) && !(temp & ALI15X3_STS_IDLE)) {
 		msleep(1);
 		temp = inb_p(SMBHSTSTS);
 	}
-	if (timeout >= MAX_TIMEOUT) {
+	if (time_after_eq(jiffies, end_time)) {
 		dev_err(&adap->dev, "Idle wait Timeout! STS=0x%02x\n", temp);
 	}
 
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/i2c/busses/i2c-amd756.c linux-2.6.15-rc4/drivers/i2c/busses/i2c-amd756.c
--- linux-2.6.15-rc4-orig/drivers/i2c/busses/i2c-amd756.c	2005-12-03 15:22:32.000000000 +0100
+++ linux-2.6.15-rc4/drivers/i2c/busses/i2c-amd756.c	2005-12-03 16:53:10.000000000 +0100
@@ -113,7 +113,7 @@ static int amd756_transaction(struct i2c
 {
 	int temp;
 	int result = 0;
-	int timeout = 0;
+	unsigned long end_time;
 
 	dev_dbg(&adap->dev, "Transaction (pre): GS=%04x, GE=%04x, ADD=%04x, "
 		"DAT=%04x\n", inw_p(SMB_GLOBAL_STATUS),
@@ -123,30 +123,32 @@ static int amd756_transaction(struct i2c
 	/* Make sure the SMBus host is ready to start transmitting */
 	if ((temp = inw_p(SMB_GLOBAL_STATUS)) & (GS_HST_STS | GS_SMB_STS)) {
 		dev_dbg(&adap->dev, "SMBus busy (%04x). Waiting...\n", temp);
+
+		end_time = jiffies + msecs_to_jiffies(MAX_TIMEOUT);
 		do {
 			msleep(1);
 			temp = inw_p(SMB_GLOBAL_STATUS);
 		} while ((temp & (GS_HST_STS | GS_SMB_STS)) &&
-		         (timeout++ < MAX_TIMEOUT));
+		         time_before(jiffies, end_time));
 		/* If the SMBus is still busy, we give up */
-		if (timeout >= MAX_TIMEOUT) {
+		if (time_after_eq(jiffies, end_time)) {
 			dev_dbg(&adap->dev, "Busy wait timeout (%04x)\n", temp);
 			goto abort;
 		}
-		timeout = 0;
 	}
 
 	/* start the transaction by setting the start bit */
 	outw_p(inw(SMB_GLOBAL_ENABLE) | GE_HOST_STC, SMB_GLOBAL_ENABLE);
 
 	/* We will always wait for a fraction of a second! */
+	end_time = jiffies + msecs_to_jiffies(MAX_TIMEOUT);
 	do {
 		msleep(1);
 		temp = inw_p(SMB_GLOBAL_STATUS);
-	} while ((temp & GS_HST_STS) && (timeout++ < MAX_TIMEOUT));
+	} while ((temp & GS_HST_STS) && time_before(jiffies, end_time));
 
 	/* If the SMBus is still busy, we give up */
-	if (timeout >= MAX_TIMEOUT) {
+	if (time_after_eq(jiffies, end_time)) {
 		dev_dbg(&adap->dev, "Completion timeout!\n");
 		goto abort;
 	}
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/i2c/busses/i2c-i801.c linux-2.6.15-rc4/drivers/i2c/busses/i2c-i801.c
--- linux-2.6.15-rc4-orig/drivers/i2c/busses/i2c-i801.c	2005-12-03 15:22:32.000000000 +0100
+++ linux-2.6.15-rc4/drivers/i2c/busses/i2c-i801.c	2005-12-03 16:53:10.000000000 +0100
@@ -181,7 +181,7 @@ static int i801_transaction(void)
 {
 	int temp;
 	int result = 0;
-	int timeout = 0;
+	unsigned long end_time;
 
 	dev_dbg(&I801_dev->dev, "Transaction (pre): CNT=%02x, CMD=%02x, "
 		"ADD=%02x, DAT0=%02x, DAT1=%02x\n", inb_p(SMBHSTCNT),
@@ -205,13 +205,14 @@ static int i801_transaction(void)
 	outb_p(inb(SMBHSTCNT) | I801_START, SMBHSTCNT);
 
 	/* We will always wait for a fraction of a second! */
+	end_time = jiffies + msecs_to_jiffies(MAX_TIMEOUT);
 	do {
 		msleep(1);
 		temp = inb_p(SMBHSTSTS);
-	} while ((temp & 0x01) && (timeout++ < MAX_TIMEOUT));
+	} while ((temp & 0x01) && time_before(jiffies, end_time));
 
 	/* If the SMBus is still busy, we give up */
-	if (timeout >= MAX_TIMEOUT) {
+	if (time_after_eq(jiffies, end_time)) {
 		dev_dbg(&I801_dev->dev, "SMBus Timeout!\n");
 		result = -1;
 	}
@@ -255,8 +256,8 @@ static int i801_block_transaction(union 
 	int smbcmd;
 	int temp;
 	int result = 0;
-	int timeout;
 	unsigned char hostc, errmask;
+	unsigned long end_time;
 
 	if (command = I2C_SMBUS_I2C_BLOCK_DATA) {
 		if (read_write = I2C_SMBUS_WRITE) {
@@ -331,16 +332,15 @@ static int i801_block_transaction(union 
 			outb_p(inb(SMBHSTCNT) | I801_START, SMBHSTCNT);
 
 		/* We will always wait for a fraction of a second! */
-		timeout = 0;
+		end_time = jiffies + msecs_to_jiffies(MAX_TIMEOUT);
 		do {
 			temp = inb_p(SMBHSTSTS);
 			msleep(1);
-		}
-		    while ((!(temp & 0x80))
-			   && (timeout++ < MAX_TIMEOUT));
+		} while ((!(temp & 0x80))
+			   && time_before(jiffies, end_time));
 
 		/* If the SMBus is still busy, we give up */
-		if (timeout >= MAX_TIMEOUT) {
+		if (time_after_eq(jiffies, end_time)) {
 			result = -1;
 			dev_dbg(&I801_dev->dev, "SMBus Timeout!\n");
 		}
@@ -390,14 +390,14 @@ static int i801_block_transaction(union 
 
 	if (hwpec) {
 		/* wait for INTR bit as advised by Intel */
-		timeout = 0;
+		end_time = jiffies + msecs_to_jiffies(MAX_TIMEOUT);
 		do {
 			temp = inb_p(SMBHSTSTS);
 			msleep(1);
 		} while ((!(temp & 0x02))
-			   && (timeout++ < MAX_TIMEOUT));
+			   && time_before(jiffies, end_time));
 
-		if (timeout >= MAX_TIMEOUT) {
+		if (time_after_eq(jiffies, end_time)) {
 			dev_dbg(&I801_dev->dev, "PEC Timeout!\n");
 		}
 		outb_p(temp, SMBHSTSTS); 
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/i2c/busses/i2c-piix4.c linux-2.6.15-rc4/drivers/i2c/busses/i2c-piix4.c
--- linux-2.6.15-rc4-orig/drivers/i2c/busses/i2c-piix4.c	2005-12-03 15:22:32.000000000 +0100
+++ linux-2.6.15-rc4/drivers/i2c/busses/i2c-piix4.c	2005-12-03 16:53:10.000000000 +0100
@@ -234,7 +234,7 @@ static int piix4_transaction(void)
 {
 	int temp;
 	int result = 0;
-	int timeout = 0;
+	unsigned long end_time;
 
 	dev_dbg(&piix4_adapter.dev, "Transaction (pre): CNT=%02x, CMD=%02x, "
 		"ADD=%02x, DAT0=%02x, DAT1=%02x\n", inb_p(SMBHSTCNT),
@@ -258,13 +258,14 @@ static int piix4_transaction(void)
 	outb_p(inb(SMBHSTCNT) | 0x040, SMBHSTCNT);
 
 	/* We will always wait for a fraction of a second! (See PIIX4 docs errata) */
+	end_time = jiffies + msecs_to_jiffies(MAX_TIMEOUT);
 	do {
 		msleep(1);
 		temp = inb_p(SMBHSTSTS);
-	} while ((temp & 0x01) && (timeout++ < MAX_TIMEOUT));
+	} while ((temp & 0x01) && time_before(jiffies, end_time));
 
 	/* If the SMBus is still busy, we give up */
-	if (timeout >= MAX_TIMEOUT) {
+	if (time_after_eq(jiffies, end_time)) {
 		dev_err(&piix4_adapter.dev, "SMBus Timeout!\n");
 		result = -1;
 	}
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/i2c/busses/i2c-pxa.c linux-2.6.15-rc4/drivers/i2c/busses/i2c-pxa.c
--- linux-2.6.15-rc4-orig/drivers/i2c/busses/i2c-pxa.c	2005-12-03 15:22:32.000000000 +0100
+++ linux-2.6.15-rc4/drivers/i2c/busses/i2c-pxa.c	2005-12-03 16:53:10.000000000 +0100
@@ -191,20 +191,23 @@ static void i2c_pxa_abort(struct pxa_i2c
 
 static int i2c_pxa_wait_bus_not_busy(struct pxa_i2c *i2c)
 {
-	int timeout = DEF_TIMEOUT;
+	int timeout_reached;
+	unsigned long end_time;
 
-	while (timeout-- && ISR & (ISR_IBB | ISR_UB)) {
+	end_time = jiffies + msecs_to_jiffies(DEF_TIMEOUT * 2);
+	while (time_before(jiffies, end_time) && ISR & (ISR_IBB | ISR_UB)) {
 		if ((ISR & ISR_SAD) != 0)
-			timeout += 4;
+			end_time += msecs_to_jiffies(8);
 
 		msleep(2);
 		show_state(i2c);
 	}
+	timeout_reached = time_after_eq(jiffies, end_time);
 
-	if (timeout <= 0)
+	if (timeout_reached)
 		show_state(i2c);
 
-	return timeout <= 0 ? I2C_RETRY : 0;
+	return timeout_reached ? I2C_RETRY : 0;
 }
 
 static int i2c_pxa_wait_master(struct pxa_i2c *i2c)
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/i2c/busses/i2c-s3c2410.c linux-2.6.15-rc4/drivers/i2c/busses/i2c-s3c2410.c
--- linux-2.6.15-rc4-orig/drivers/i2c/busses/i2c-s3c2410.c	2005-12-03 15:22:32.000000000 +0100
+++ linux-2.6.15-rc4/drivers/i2c/busses/i2c-s3c2410.c	2005-12-03 16:53:10.000000000 +0100
@@ -465,9 +465,10 @@ static irqreturn_t s3c24xx_i2c_irq(int i
 static int s3c24xx_i2c_set_master(struct s3c24xx_i2c *i2c)
 {
 	unsigned long iicstat;
-	int timeout = 400;
+	unsigned long end_time;
 
-	while (timeout-- > 0) {
+	end_time = jiffies + msecs_to_jiffies(400);
+	while (time_before(jiffies, end_time)) {
 		iicstat = readl(i2c->regs + S3C2410_IICSTAT);
 		
 		if (!(iicstat & S3C2410_IICSTAT_BUSBUSY))
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/i2c/busses/i2c-sis5595.c linux-2.6.15-rc4/drivers/i2c/busses/i2c-sis5595.c
--- linux-2.6.15-rc4-orig/drivers/i2c/busses/i2c-sis5595.c	2005-12-03 15:22:32.000000000 +0100
+++ linux-2.6.15-rc4/drivers/i2c/busses/i2c-sis5595.c	2005-12-03 16:53:10.000000000 +0100
@@ -225,7 +225,7 @@ static int sis5595_transaction(struct i2
 {
 	int temp;
 	int result = 0;
-	int timeout = 0;
+	unsigned long end_time;
 
 	/* Make sure the SMBus host is ready to start transmitting */
 	temp = sis5595_read(SMB_STS_LO) + (sis5595_read(SMB_STS_HI) << 8);
@@ -245,13 +245,14 @@ static int sis5595_transaction(struct i2
 	sis5595_write(SMB_CTL_LO, sis5595_read(SMB_CTL_LO) | 0x10);
 
 	/* We will always wait for a fraction of a second! */
+	end_time = jiffies + msecs_to_jiffies(MAX_TIMEOUT);
 	do {
 		msleep(1);
 		temp = sis5595_read(SMB_STS_LO);
-	} while (!(temp & 0x40) && (timeout++ < MAX_TIMEOUT));
+	} while (!(temp & 0x40) && time_before(jiffies, end_time));
 
 	/* If the SMBus is still busy, we give up */
-	if (timeout >= MAX_TIMEOUT) {
+	if (time_after_eq(jiffies, end_time)) {
 		dev_dbg(&adap->dev, "SMBus Timeout!\n");
 		result = -1;
 	}
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/i2c/busses/i2c-sis630.c linux-2.6.15-rc4/drivers/i2c/busses/i2c-sis630.c
--- linux-2.6.15-rc4-orig/drivers/i2c/busses/i2c-sis630.c	2005-12-03 15:22:32.000000000 +0100
+++ linux-2.6.15-rc4/drivers/i2c/busses/i2c-sis630.c	2005-12-03 16:53:10.000000000 +0100
@@ -163,19 +163,21 @@ static int sis630_transaction_start(stru
 
 static int sis630_transaction_wait(struct i2c_adapter *adap, int size)
 {
-	int temp, result = 0, timeout = 0;
+	int temp, result = 0;
+	unsigned long end_time;
 
 	/* We will always wait for a fraction of a second! */
+	end_time = jiffies + msecs_to_jiffies(MAX_TIMEOUT);
 	do {
 		msleep(1);
 		temp = sis630_read(SMB_STS);
 		/* check if block transmitted */
 		if (size = SIS630_BLOCK_DATA && (temp & 0x10))
 			break;
-	} while (!(temp & 0x0e) && (timeout++ < MAX_TIMEOUT));
+	} while (!(temp & 0x0e) && time_before(jiffies, end_time));
 
 	/* If the SMBus is still busy, we give up */
-	if (timeout >= MAX_TIMEOUT) {
+	if (time_after_eq(jiffies, end_time)) {
 		dev_dbg(&adap->dev, "SMBus Timeout!\n");
 		result = -1;
 	}
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/i2c/busses/i2c-sis96x.c linux-2.6.15-rc4/drivers/i2c/busses/i2c-sis96x.c
--- linux-2.6.15-rc4-orig/drivers/i2c/busses/i2c-sis96x.c	2005-12-03 15:22:32.000000000 +0100
+++ linux-2.6.15-rc4/drivers/i2c/busses/i2c-sis96x.c	2005-12-03 16:53:10.000000000 +0100
@@ -103,7 +103,7 @@ static int sis96x_transaction(int size)
 {
 	int temp;
 	int result = 0;
-	int timeout = 0;
+	unsigned long end_time;
 
 	dev_dbg(&sis96x_adapter.dev, "SMBus transaction %d\n", size);
 
@@ -136,13 +136,14 @@ static int sis96x_transaction(int size)
 	sis96x_write(SMB_HOST_CNT, 0x10 | (size & 0x07));
 
 	/* We will always wait for a fraction of a second! */
+	end_time = jiffies + msecs_to_jiffies(MAX_TIMEOUT);
 	do {
 		msleep(1);
 		temp = sis96x_read(SMB_STS);
-	} while (!(temp & 0x0e) && (timeout++ < MAX_TIMEOUT));
+	} while (!(temp & 0x0e) && time_before(jiffies, end_time));
 
 	/* If the SMBus is still busy, we give up */
-	if (timeout >= MAX_TIMEOUT) {
+	if (time_after_eq(jiffies, end_time)) {
 		dev_dbg(&sis96x_adapter.dev, "SMBus Timeout! (0x%02x)\n", temp);
 		result = -1;
 	}
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/i2c/busses/i2c-viapro.c linux-2.6.15-rc4/drivers/i2c/busses/i2c-viapro.c
--- linux-2.6.15-rc4-orig/drivers/i2c/busses/i2c-viapro.c	2005-12-03 15:22:32.000000000 +0100
+++ linux-2.6.15-rc4/drivers/i2c/busses/i2c-viapro.c	2005-12-03 16:55:52.000000000 +0100
@@ -135,7 +135,7 @@ static int vt596_transaction(u8 size)
 {
 	int temp;
 	int result = 0;
-	int timeout = 0;
+	unsigned long end_time;
 
 	vt596_dump_regs("Transaction (pre)", size);
 
@@ -156,13 +156,14 @@ static int vt596_transaction(u8 size)
 	outb_p(0x40 | size, SMBHSTCNT);
 
 	/* We will always wait for a fraction of a second */
+	end_time = jiffies + msecs_to_jiffies(MAX_TIMEOUT);
 	do {
 		msleep(1);
 		temp = inb_p(SMBHSTSTS);
-	} while ((temp & 0x01) && (timeout++ < MAX_TIMEOUT));
+	} while ((temp & 0x01) && time_before(jiffies, end_time));
 
 	/* If the SMBus is still busy, we give up */
-	if (timeout >= MAX_TIMEOUT) {
+	if (time_after_eq(jiffies, end_time)) {
 		result = -1;
 		dev_err(&vt596_adapter.dev, "SMBus timeout!\n");
 	}
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
