From: Marcin Slusarz <marcin.slusarz@gmail.com>
Date: Sun, 04 Dec 2005 00:14:35 +0000
Subject: [KJ] [PATCH 4/21] polling loops: change exit condition to
Message-Id: <439234EB.9090601@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

there were bug in drivers/char/sx.c - loop might took 50s instead of 5 seconds as comment say!
who is responsible for those files?

Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/char/dsp56k.c linux-2.6.15-rc4/drivers/char/dsp56k.c
--- linux-2.6.15-rc4-orig/drivers/char/dsp56k.c	2005-12-03 15:22:32.000000000 +0100
+++ linux-2.6.15-rc4/drivers/char/dsp56k.c	2005-12-03 16:53:10.000000000 +0100
@@ -60,11 +60,13 @@
 
 #define handshake(count, maxio, timeout, ENABLE, f) \
 { \
-	long i, t, m; \
+	long i, m; \
+	unsigned long end_time; \
 	while (count > 0) { \
 		m = min_t(unsigned long, count, maxio); \
 		for (i = 0; i < m; i++) { \
-			for (t = 0; t < timeout && !ENABLE; t++) \
+			end_time = jiffies + msecs_to_jiffies((timeout) * 20); \
+			while (time_before(jiffies, end_time) && !ENABLE) { \
 				msleep(20); \
 			if(!ENABLE) \
 				return -EIO; \
@@ -77,8 +79,8 @@
 
 #define tx_wait(n) \
 { \
-	int t; \
-	for(t = 0; t < n && !DSP56K_TRANSMIT; t++) \
+	unsigned long end_time = jiffies + msecs_to_jiffies((n) * 10); \
+	while (time_before(jiffies, end_time) && !DSP56K_TRANSMIT) \
 		msleep(10); \
 	if(!DSP56K_TRANSMIT) { \
 		return -EIO; \
@@ -87,8 +89,8 @@
 
 #define rx_wait(n) \
 { \
-	int t; \
-	for(t = 0; t < n && !DSP56K_RECEIVE; t++) \
+	unsigned long end_time = jiffies + msecs_to_jiffies((n) * 10); \
+	while (time_before(jiffies, end_time) && !DSP56K_RECEIVE) \
 		msleep(10); \
 	if(!DSP56K_RECEIVE) { \
 		return -EIO; \
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/char/pcmcia/synclink_cs.c linux-2.6.15-rc4/drivers/char/pcmcia/synclink_cs.c
--- linux-2.6.15-rc4-orig/drivers/char/pcmcia/synclink_cs.c	2005-12-03 15:22:32.000000000 +0100
+++ linux-2.6.15-rc4/drivers/char/pcmcia/synclink_cs.c	2005-12-03 16:53:10.000000000 +0100
@@ -4100,8 +4100,8 @@ BOOLEAN irq_test(MGSLPC_INFO *info)
 
 	spin_unlock_irqrestore(&info->lock,flags);
 
-	end_time0;
-	while(end_time-- && !info->irq_occurred) {
+	end_time = jiffies + msecs_to_jiffies(1000);
+	while (time_before(jiffies, end_time) && !info->irq_occurred) {
 		msleep_interruptible(10);
 	}
 	
SONY VAIO CONTROL DEVICE DRIVER
P:	Stelian Pop
M:	stelian@popies.net
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/char/sonypi.c linux-2.6.15-rc4/drivers/char/sonypi.c
--- linux-2.6.15-rc4-orig/drivers/char/sonypi.c	2005-12-03 15:22:32.000000000 +0100
+++ linux-2.6.15-rc4/drivers/char/sonypi.c	2005-12-03 16:53:10.000000000 +0100
@@ -720,7 +720,8 @@ static void sonypi_camera_off(void)
 /* Turns the camera on */
 static void sonypi_camera_on(void)
 {
-	int i, j;
+	int j;
+	unsigned long end_time;
 
 	if (sonypi_device.camera_power)
 		return;
@@ -731,12 +732,13 @@ static void sonypi_camera_on(void)
 			msleep(10);
 		sonypi_call1(0x93);
 
-		for (i = 400; i > 0; i--) {
+		end_time = jiffies + msecs_to_jiffies(4000);
+		while (time_before(jiffies, end_time)) {
 			if (sonypi_camera_ready())
 				break;
 			msleep(10);
 		}
-		if (i)
+		if (time_before(jiffies, end_time))
 			break;
 	}
 

P:	Roger Wolff
M:	R.E.Wolff@BitWizard.nl
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/char/sx.c linux-2.6.15-rc4/drivers/char/sx.c
--- linux-2.6.15-rc4-orig/drivers/char/sx.c	2005-11-20 16:53:15.000000000 +0100
+++ linux-2.6.15-rc4/drivers/char/sx.c	2005-12-03 16:53:10.000000000 +0100
@@ -1515,8 +1515,7 @@ static int sx_open  (struct tty_struct *
 static void sx_close (void *ptr)
 {
 	struct sx_port *port = ptr; 
-	/* Give the port 5 seconds to close down. */
-	int to = 5 * HZ; 
+	unsigned long start_time, end_time;
 
 	func_enter ();
 
@@ -1524,9 +1523,13 @@ static void sx_close (void *ptr)
 	sx_reconfigure_port(port);	
 	sx_send_command (port, HS_CLOSE, 0, 0);
 
-	while (to-- && (sx_read_channel_byte (port, hi_hstat) != HS_IDLE_CLOSED))
+	/* Give the port 5 seconds to close down. */
+	start_time = jiffies;
+	end_time = start_time + msecs_to_jiffies(5000);
+	while (time_before(jiffies, end_time) && (sx_read_channel_byte (port, hi_hstat) != HS_IDLE_CLOSED))
 		if (msleep_interruptible(10))
 			break;
+	end_time = jiffies;
 	if (sx_read_channel_byte (port, hi_hstat) != HS_IDLE_CLOSED) {
 		if (sx_send_command (port, HS_FORCE_CLOSED, -1, HS_IDLE_CLOSED) != 1) {
 			printk (KERN_ERR 
@@ -1535,8 +1538,8 @@ static void sx_close (void *ptr)
 			sx_dprintk (SX_DEBUG_CLOSE, "sent the force_close command.\n");
 	}
 
-	sx_dprintk (SX_DEBUG_CLOSE, "waited %d jiffies for close. count=%d\n", 
-	            5 * HZ - to - 1, port->gs.count);
+	sx_dprintk (SX_DEBUG_CLOSE, "waited %ld jiffies for close. count=%d\n", 
+	            end_time - start_time, port->gs.count);
 
 	if(port->gs.count) {
 		sx_dprintk(SX_DEBUG_CLOSE, "WARNING port count:%d\n", port->gs.count);
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/char/synclink.c linux-2.6.15-rc4/drivers/char/synclink.c
--- linux-2.6.15-rc4-orig/drivers/char/synclink.c	2005-12-03 15:22:32.000000000 +0100
+++ linux-2.6.15-rc4/drivers/char/synclink.c	2005-12-03 16:53:10.000000000 +0100
@@ -7112,8 +7112,8 @@ static BOOLEAN mgsl_register_test( struc
  */
 static BOOLEAN mgsl_irq_test( struct mgsl_struct *info )
 {
-	unsigned long EndTime;
 	unsigned long flags;
+	unsigned long end_time;
 
 	spin_lock_irqsave(&info->irq_spinlock,flags);
 	usc_reset(info);
@@ -7140,8 +7140,8 @@ static BOOLEAN mgsl_irq_test( struct mgs
 
 	spin_unlock_irqrestore(&info->irq_spinlock,flags);
 
-	EndTime0;
-	while( EndTime-- && !info->irq_occurred ) {
+	end_time = jiffies + msecs_to_jiffies(1000);
+	while (time_before(jiffies, end_time) && !info->irq_occurred) {
 		msleep_interruptible(10);
 	}
 	
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/char/synclinkmp.c linux-2.6.15-rc4/drivers/char/synclinkmp.c
--- linux-2.6.15-rc4-orig/drivers/char/synclinkmp.c	2005-12-03 15:22:32.000000000 +0100
+++ linux-2.6.15-rc4/drivers/char/synclinkmp.c	2005-12-03 16:53:10.000000000 +0100
@@ -5142,8 +5142,8 @@ int register_test(SLMP_INFO *info)
 
 int irq_test(SLMP_INFO *info)
 {
-	unsigned long timeout;
 	unsigned long flags;
+	unsigned long end_time;
 
 	unsigned char timer = (info->port_num & 1) ? TIMER2 : TIMER0;
 
@@ -5177,8 +5177,8 @@ int irq_test(SLMP_INFO *info)
 
 	spin_unlock_irqrestore(&info->lock,flags);
 
-	timeout0;
-	while( timeout-- && !info->irq_occurred ) {
+	end_time = jiffies + msecs_to_jiffies(1000);
+	while (time_before(jiffies, end_time) && !info->irq_occurred) {
 		msleep_interruptible(10);
 	}
 

TPM DEVICE DRIVER
P:	Kylene Hall
M:	kjhall@us.ibm.com
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/char/tpm/tpm_infineon.c linux-2.6.15-rc4/drivers/char/tpm/tpm_infineon.c
--- linux-2.6.15-rc4-orig/drivers/char/tpm/tpm_infineon.c	2005-12-03 15:22:32.000000000 +0100
+++ linux-2.6.15-rc4/drivers/char/tpm/tpm_infineon.c	2005-12-03 16:53:10.000000000 +0100
@@ -135,15 +135,17 @@ static int empty_fifo(struct tpm_chip *c
 static int wait(struct tpm_chip *chip, int wait_for_bit)
 {
 	int status;
-	int i;
-	for (i = 0; i < TPM_MAX_TRIES; i++) {
+	unsigned long end_time;
+
+	end_time = jiffies + msecs_to_jiffies(TPM_MAX_TRIES * TPM_MSLEEP_TIME);
+	while (time_before(jiffies, end_time)) {
 		status = inb(chip->vendor->base + STAT);
 		/* check the status-register if wait_for_bit is set */
 		if (status & 1 << wait_for_bit)
 			break;
 		msleep(TPM_MSLEEP_TIME);
 	}
-	if (i = TPM_MAX_TRIES) {	/* timeout occurs */
+	if (time_after_eq(jiffies, end_time)) {	/* timeout occurs */
 		if (wait_for_bit = STAT_XFE)
 			dev_err(chip->dev, "Timeout in wait(STAT_XFE)\n");
 		if (wait_for_bit = STAT_RDA)
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
