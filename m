From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Sat, 16 Jul 2005 07:05:58 +0000
Subject: [KJ] [PATCH] drivers/net/cs89x0.c : Use of time_after(),
Message-Id: <42D8B1D6.2090302@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------010505090604030303050501"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------010505090604030303050501
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



--------------010505090604030303050501
Content-Type: text/x-patch;
 name="cs89x0.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="cs89x0.patch"

Use of time_after(), time_after_eq() and time_before() macros, define at
linux/jiffies.h, which deal with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/cs89x0.c	2005-07-13 17:52:18.000000000 -0300
+++ linux-kj/drivers/net/cs89x0.c	2005-07-15 21:55:17.376267208 -0300
@@ -93,6 +93,7 @@
    or override something. */
 #include <linux/config.h>
 #include <linux/module.h>
+#include <linux/jiffies.h>
 
 /*
  * Set this to zero to disable DMA code
@@ -363,12 +364,12 @@
 static int __init
 wait_eeprom_ready(struct net_device *dev)
 {
-	int timeout = jiffies;
+	unsigned long timeout = jiffies;
 	/* check to see if the EEPROM is ready, a timeout is used -
 	   just in case EEPROM is ready when SI_BUSY in the
 	   PP_SelfST is clear */
 	while(readreg(dev, PP_SelfST) & SI_BUSY)
-		if (jiffies - timeout >= 40)
+		if (time_after_eq(jiffies, timeout + 40))
 			return -1;
 	return 0;
 }
@@ -936,7 +937,7 @@
 	struct net_local *lp = netdev_priv(dev);
 	int ioaddr = dev->base_addr;
 #endif
-	int reset_start_time;
+	unsigned long reset_start_time;
 
 	writereg(dev, PP_SelfCTL, readreg(dev, PP_SelfCTL) | POWER_ON_RESET);
 
@@ -958,7 +959,8 @@
 
 	/* Wait until the chip is reset */
 	reset_start_time = jiffies;
-	while( (readreg(dev, PP_SelfST) & INIT_DONE) == 0 && jiffies - reset_start_time < 2)
+	while( (readreg(dev, PP_SelfST) & INIT_DONE) == 0 &&
+		       time_before(jiffies, reset_start_time + 2))
 		;
 }
 
@@ -968,7 +970,7 @@
 {
 	struct net_local *lp = netdev_priv(dev);
 	unsigned int selfcontrol;
-	int timenow = jiffies;
+	unsigned long timenow = jiffies;
 	/* control the DC to DC convertor in the SelfControl register.  
 	   Note: This is hooked up to a general purpose pin, might not
 	   always be a DC to DC convertor. */
@@ -981,7 +983,7 @@
 	writereg(dev, PP_SelfCTL, selfcontrol);
 
 	/* Wait for the DC/DC converter to power up - 500ms */
-	while (jiffies - timenow < HZ)
+	while (time_before(jiffies, timenow + HZ))
 		;
 }
 
@@ -995,7 +997,7 @@
 detect_tp(struct net_device *dev)
 {
 	struct net_local *lp = netdev_priv(dev);
-	int timenow = jiffies;
+	unsigned long timenow = jiffies;
 	int fdx;
 
 	if (net_debug > 1) printk("%s: Attempting TP\n", dev->name);
@@ -1009,7 +1011,7 @@
 	control_dc_dc(dev, 0);
 
         /* Delay for the hardware to work out if the TP cable is present - 150ms */
-	for (timenow = jiffies; jiffies - timenow < 15; )
+	for (timenow = jiffies; time_before(jiffies, timenow + 15); )
                 ;
 	if ((readreg(dev, PP_LineST) & LINK_OK) == 0)
 		return DETECTED_NONE;
@@ -1051,7 +1053,7 @@
 		if ((lp->auto_neg_cnf & AUTO_NEG_BITS) == AUTO_NEG_ENABLE) {
 			printk(KERN_INFO "%s: negotiating duplex...\n",dev->name);
 			while (readreg(dev, PP_AutoNegST) & AUTO_NEG_BUSY) {
-				if (jiffies - timenow > 4000) {
+				if (time_after(jiffies, timenow + 4000)) {
 					printk(KERN_ERR "**** Full / half duplex auto-negotiation timed out ****\n");
 					break;
 				}
@@ -1073,7 +1075,7 @@
 				 0, 46, /* A 46 in network order */
 				 0, 0, /* DSAP=0 & SSAP=0 fields */
 				 0xf3, 0 /* Control (Test Req + P bit set) */ };
-	long timenow = jiffies;
+	unsigned long timenow = jiffies;
 
 	writereg(dev, PP_LineCTL, readreg(dev, PP_LineCTL) | SERIAL_TX_ON);
 
@@ -1084,10 +1086,10 @@
         writeword(dev, TX_LEN_PORT, ETH_ZLEN);
 
 	/* Test to see if the chip has allocated memory for the packet */
-	while (jiffies - timenow < 5)
+	while (time_before(jiffies, timenow + 5))
 		if (readreg(dev, PP_BusST) & READY_FOR_TX_NOW)
 			break;
-	if (jiffies - timenow >= 5)
+	if (time_after_eq(jiffies, timenow + 5))
 		return 0;	/* this shouldn't happen */
 
 	/* Write the contents of the packet */
@@ -1095,7 +1097,7 @@
 
 	if (net_debug > 1) printk("Sending test packet ");
 	/* wait a couple of jiffies for packet to be received */
-	for (timenow = jiffies; jiffies - timenow < 3; )
+	for (timenow = jiffies; time_before(jiffies, timenow + 3); )
                 ;
         if ((readreg(dev, PP_TxEvent) & TX_SEND_OK_BITS) == TX_OK) {
                 if (net_debug > 1) printk("succeeded\n");

--------------010505090604030303050501
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------010505090604030303050501--
