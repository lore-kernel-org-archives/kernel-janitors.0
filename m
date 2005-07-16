From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Sat, 16 Jul 2005 07:11:49 +0000
Subject: [KJ] [PATCH] drivers/net/eth16i.c : Use of the time_after() macro
Message-Id: <42D8B335.5000905@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------040808090304060805030307"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------040808090304060805030307
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



--------------040808090304060805030307
Content-Type: text/x-patch;
 name="eth16i.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="eth16i.patch"

Use of the time_after() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/eth16i.c	2005-07-13 17:52:19.000000000 -0300
+++ linux-kj/drivers/net/eth16i.c	2005-07-16 00:03:25.892435088 -0300
@@ -161,6 +161,7 @@
 #include <linux/etherdevice.h>
 #include <linux/skbuff.h>
 #include <linux/bitops.h>
+#include <linux/jiffies.h>
 
 #include <asm/system.h>		  
 #include <asm/io.h>		  
@@ -754,7 +755,7 @@
 
 static int eth16i_send_probe_packet(int ioaddr, unsigned char *b, int l)
 {
-	int starttime;
+	unsigned long starttime;
 
 	outb(0xff, ioaddr + TX_STATUS_REG);
 
@@ -765,7 +766,7 @@
 	outb(TX_START | 1, ioaddr + TRANSMIT_START_REG); 
 
 	while( (inb(ioaddr + TX_STATUS_REG) & 0x80) == 0) {
-		if( (jiffies - starttime) > TX_TIMEOUT) {
+		if((time_after(jiffies, starttime + TX_TIMEOUT))) {
 			return -1;
 		}
 	}
@@ -775,18 +776,19 @@
 
 static int eth16i_receive_probe_packet(int ioaddr)
 {
-	int starttime;
+	unsigned long starttime;
 
 	starttime = jiffies;
 
 	while((inb(ioaddr + TX_STATUS_REG) & 0x20) == 0) {
-		if( (jiffies - starttime) > TX_TIMEOUT) {
+		if(time_after(jiffies, starttime + TX_TIMEOUT)) {
 
 			if(eth16i_debug > 1)
 				printk(KERN_DEBUG "Timeout occurred waiting transmit packet received\n");
 			starttime = jiffies;
 			while((inb(ioaddr + RX_STATUS_REG) & 0x80) == 0) {
-				if( (jiffies - starttime) > TX_TIMEOUT) {
+				if(time_after(jiffies,
+						starttime + TX_TIMEOUT)) {
 					if(eth16i_debug > 1)
 						printk(KERN_DEBUG "Timeout occurred waiting receive packet\n");
 					return -1;

--------------040808090304060805030307
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------040808090304060805030307--
