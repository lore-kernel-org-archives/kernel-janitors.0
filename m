From: Kristen Carlson <kristenc@cs.pdx.edu>
Date: Wed, 16 Jun 2004 02:57:32 +0000
Subject: [Kernel-janitors] please comment on this patch
Message-Id: <200406160257.i5G2vWLJ023048@sirius.cs.pdx.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============081346947850162055=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============081346947850162055==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

For removing check_region from drivers/char/esp.c

 
--- linux-2.6.6.kc/drivers/char/esp.orig	2004-06-15 11:40:24.643063272 -0700
+++ linux-2.6.6.kc/drivers/char/esp.c	2004-06-15 11:43:27.223306856 -0700
@@ -2369,9 +2369,21 @@ static _INLINE_ int autoconfig(struct es
 	/*
 	 * Check for ESP card
 	 */
+	if (ports && (ports->port == (info->port - 8))) {
+		release_region(*region_start,
+			       info->port - *region_start);
+	} else
+		*region_start = info->port;
+
+	if (!request_region(*region_start,
+		       info->port - *region_start + 8,
+		       "esp serial"))
+	{
+		restore_flags(flags);
+		return -EIO;
+	}
 
-	if (!check_region(info->port, 8) && 
-	    serial_in(info, UART_ESI_BASE) == 0xf3) {
+	if (serial_in(info, UART_ESI_BASE) == 0xf3) {
 		serial_out(info, UART_ESI_CMD1, 0x00);
 		serial_out(info, UART_ESI_CMD1, 0x01);
 
@@ -2387,19 +2399,6 @@ static _INLINE_ int autoconfig(struct es
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
@@ -2410,8 +2409,11 @@ static _INLINE_ int autoconfig(struct es
 			serial_out(info, UART_ESI_CMD1, ESI_WRITE_UART);
 			serial_out(info, UART_ESI_CMD2, UART_MCR);
 			serial_out(info, UART_ESI_CMD2, 0x00);
-		}
-	}
+		} 
+	} 
+	if (!port_detected)
+		release_region(*region_start,
+				info->port - *region_start + 8);
 
 	restore_flags(flags);
 	return (port_detected);


Thanks!
Kristen


-- 
WWXD (What Would Xena Do?) 


--===============081346947850162055==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============081346947850162055==--
