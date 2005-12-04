From: Marcin Slusarz <marcin.slusarz@gmail.com>
Date: Sun, 04 Dec 2005 00:24:21 +0000
Subject: [KJ] [PATCH 20/21] polling loops: change exit condition to
Message-Id: <43923735.4060604@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

who is responsible for those files?

Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/serial/icom.c linux-2.6.15-rc4/drivers/serial/icom.c
--- linux-2.6.15-rc4-orig/drivers/serial/icom.c	2005-11-20 16:53:29.000000000 +0100
+++ linux-2.6.15-rc4/drivers/serial/icom.c	2005-12-03 16:53:10.000000000 +0100
@@ -350,6 +350,7 @@ static void load_code(struct icom_port *
 	unsigned char *new_page = NULL;
 	unsigned char cable_id = NO_CABLE;
 	struct pci_dev *dev = icom_port->adapter->pci_dev;
+	unsigned long end_time;
 
 	/* Clear out any pending interrupts */
 	writew(0x3FFF, icom_port->int_reg);
@@ -461,13 +462,14 @@ static void load_code(struct icom_port *
 	writeb(START_DOWNLOAD, &icom_port->dram->sync);
 
 	/* Wait max 1 Sec for data download and processor to start */
-	for (index = 0; index < 10; index++) {
+	end_time = jiffies + msecs_to_jiffies(1000);
+	while (time_before(jiffies, end_time)) {
 		msleep(100);
 		if (readb(&icom_port->dram->misc_flags) & ICOM_HDW_ACTIVE)
 			break;
 	}
 
-	if (index = 10)
+	if (time_after_eq(jiffies, end_time))
 		status = -1;
 
 	/*
@@ -1015,11 +1017,13 @@ static void icom_send_xchar(struct uart_
 	unsigned char xdata;
 	int index;
 	unsigned long flags;
+	unsigned long end_time;
 
 	trace(ICOM_PORT, "SEND_XCHAR", ch);
 
 	/* wait .1 sec to send char */
-	for (index = 0; index < 10; index++) {
+	end_time = jiffies + msecs_to_jiffies(100);
+	while (time_before(jiffies, end_time)) {
 		spin_lock_irqsave(&port->lock, flags);
 		xdata = readb(&ICOM_PORT->dram->xchar);
 		if (xdata = 0x00) {
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
