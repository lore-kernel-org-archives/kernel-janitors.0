From: Kristen Carlson <kristenc@cs.pdx.edu>
Date: Thu, 17 Jun 2004 03:38:25 +0000
Subject: Re: [Kernel-janitors] please comment on this patch
Message-Id: <200406170338.i5H3cPlx016294@sirius.cs.pdx.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============44477116226234914=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200406160257.i5G2vWLJ023048@sirius.cs.pdx.edu>
In-Reply-To: <200406160257.i5G2vWLJ023048@sirius.cs.pdx.edu>
To: kernel-janitors@vger.kernel.org

--===============44477116226234914==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Here's a new patch, please let me know what you think.


--- linux-2.6.6.kc/drivers/char/esp.orig	2004-06-15 11:40:24.000000000 -0700
+++ linux-2.6.6.kc/drivers/char/esp.c	2004-06-16 11:43:59.724569424 -0700
@@ -70,6 +70,7 @@
 
 #define NR_PORTS 64	/* maximum number of ports */
 #define NR_PRIMARY 8	/* maximum number of primary ports */
+#define REGION_SIZE 8   /* size of io region to request */
 
 /* The following variables can be set by giving module options */
 static int irq[NR_PRIMARY];	/* IRQ for each base port */
@@ -2359,19 +2360,21 @@ static _INLINE_ void show_serial_version
  * This routine is called by espserial_init() to initialize a specific serial
  * port.
  */
-static _INLINE_ int autoconfig(struct esp_struct * info, int *region_start)
+static _INLINE_ int autoconfig(struct esp_struct * info)
 {
 	int port_detected = 0;
 	unsigned long flags;
 
+	if (!request_region(info->port, REGION_SIZE, "esp serial"))
+		return -EIO;
+
 	save_flags(flags); cli();
 	
 	/*
 	 * Check for ESP card
 	 */
-
-	if (!check_region(info->port, 8) && 
-	    serial_in(info, UART_ESI_BASE) == 0xf3) {
+	
+	if (serial_in(info, UART_ESI_BASE) == 0xf3) {
 		serial_out(info, UART_ESI_CMD1, 0x00);
 		serial_out(info, UART_ESI_CMD1, 0x01);
 
@@ -2387,19 +2390,6 @@ static _INLINE_ int autoconfig(struct es
 					info->irq = 4;
 			}
 
-			if (ports && (ports->port == (info->port - 8))) {
-				release_region(*region_start,
-					       info->port - *region_start);
-			} else
-				*region_start = info->port;
-
-			if (!request_region(*region_start,
-				       info->port - *region_start + 8,
-				       "esp serial"))
-			{
-				restore_flags(flags);
-				return -EIO;
-			}
 
 			/* put card in enhanced mode */
 			/* this prevents access through */
@@ -2410,8 +2400,10 @@ static _INLINE_ int autoconfig(struct es
 			serial_out(info, UART_ESI_CMD1, ESI_WRITE_UART);
 			serial_out(info, UART_ESI_CMD2, UART_MCR);
 			serial_out(info, UART_ESI_CMD2, 0x00);
-		}
-	}
+		} 
+	} 
+	if (!port_detected)
+		release_region(info->port, REGION_SIZE);
 
 	restore_flags(flags);
 	return (port_detected);
@@ -2445,7 +2437,6 @@ static struct tty_operations esp_ops = {
 int __init espserial_init(void)
 {
 	int i, offset;
-	int region_start;
 	struct esp_struct * info;
 	struct esp_struct *last_primary = 0;
 	int esp[] = {0x100,0x140,0x180,0x200,0x240,0x280,0x300,0x380};
@@ -2531,7 +2522,7 @@ int __init espserial_init(void)
 		info->irq = irq[i];
 		info->line = (i * 8) + (offset / 8);
 
-		if (!autoconfig(info, &region_start)) {
+		if (!autoconfig(info)) {
 			i++;
 			offset = 0;
 			continue;
@@ -2607,7 +2598,6 @@ static void __exit espserial_exit(void) 
 {
 	unsigned long flags;
 	int e1;
-	unsigned int region_start, region_end;
 	struct esp_struct *temp_async;
 	struct esp_pio_buffer *pio_buf;
 
@@ -2622,27 +2612,8 @@ static void __exit espserial_exit(void) 
 
 	while (ports) {
 		if (ports->port) {
-			region_start = region_end = ports->port;
-			temp_async = ports;
-
-			while (temp_async) {
-				if ((region_start - temp_async->port) == 8) {
-					region_start = temp_async->port;
-					temp_async->port = 0;
-					temp_async = ports;
-				} else if ((temp_async->port - region_end)
-					   == 8) {
-					region_end = temp_async->port;
-					temp_async->port = 0;
-					temp_async = ports;
-				} else
-					temp_async = temp_async->next_port;
-			}
-			
-			release_region(region_start,
-				       region_end - region_start + 8);
+			release_region(ports->port, REGION_SIZE);
 		}
-
 		temp_async = ports->next_port;
 		kfree(ports);
 		ports = temp_async;



Thanks!
Kristen


-- 
WWXD (What Would Xena Do?) 


--===============44477116226234914==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============44477116226234914==--
