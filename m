From: Domen Puncer <domen@coderock.org>
Date: Fri, 16 Jan 2004 21:03:06 +0000
Subject: [Kernel-janitors] [patch 2.6.1] remove CONFIG_LEDMAN code
Message-Id: <200401162203.06899.domen@coderock.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi.

"config LEDMAN" is in no Kconfig, linux/ledman.h also doesn't exists,
so lets clean this up.


diff -pruNX dontdiff c/arch/m68knommu/defconfig a/arch/m68knommu/defconfig
--- c/arch/m68knommu/defconfig	2003-12-18 03:59:06.000000000 +0100
+++ a/arch/m68knommu/defconfig	2004-01-16 21:36:00.000000000 +0100
@@ -355,7 +355,6 @@ CONFIG_MOUSE_PS2=y
 #
 # CONFIG_VT is not set
 # CONFIG_SERIAL_NONSTANDARD is not set
-# CONFIG_LEDMAN is not set
 # CONFIG_RESETSWITCH is not set
 
 #
diff -pruNX dontdiff c/drivers/serial/mcfserial.c a/drivers/serial/mcfserial.c
--- c/drivers/serial/mcfserial.c	2003-12-18 03:58:48.000000000 +0100
+++ a/drivers/serial/mcfserial.c	2004-01-16 21:57:12.000000000 +0100
@@ -27,9 +27,6 @@
 #include <linux/kernel.h>
 #include <linux/serial.h>
 #include <linux/serialP.h>
-#ifdef CONFIG_LEDMAN
-#include <linux/ledman.h>
-#endif
 #include <linux/console.h>
 #include <linux/version.h>
 #include <linux/init.h>
@@ -308,10 +305,6 @@ static _INLINE_ void receive_chars(struc
 	if (!tty)
 		return;
 
-#if defined(CONFIG_LEDMAN)
-	ledman_cmd(LEDMAN_CMD_SET, info->line ? LEDMAN_COM2_RX : LEDMAN_COM1_RX);
-#endif
-
 	uartp = (volatile unsigned char *) info->addr;
 
 	while ((status = uartp[MCFUART_USR]) & MCFUART_USR_RXREADY) {
@@ -358,10 +351,6 @@ static _INLINE_ void transmit_chars(stru
 {
 	volatile unsigned char	*uartp;
 
-#if defined(CONFIG_LEDMAN)
-	ledman_cmd(LEDMAN_CMD_SET, info->line ? LEDMAN_COM2_TX : LEDMAN_COM1_TX);
-#endif
-
 	uartp = (volatile unsigned char *) info->addr;
 
 	if (info->x_char) {

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
