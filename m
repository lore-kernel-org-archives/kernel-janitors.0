From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Sun, 18 Dec 2005 22:55:33 +0000
Subject: [KJ] [Patch 4/5] Cleanup LINUX_VERSION_CODE in drivers/net
Message-Id: <1134946533.7394.11.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============7496296653689094=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============7496296653689094==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this removes LINUX_VERSION_CODE checks in tokenring/lanstreamer.h

Signed-of-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-rc5-git5/drivers/net/tokenring/lanstreamer.h.orig	2005-12-18 23:48:20.000000000 +0100
+++ linux-2.6.15-rc5-git5/drivers/net/tokenring/lanstreamer.h	2005-12-18 23:49:26.000000000 +0100
@@ -62,18 +62,6 @@
 
 #include <linux/version.h>
 
-#if STREAMER_IOCTL && (LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0))
-#include <asm/ioctl.h>
-#define IOCTL_PRINT_RX_BUFS   SIOCDEVPRIVATE
-#define IOCTL_PRINT_TX_BUFS   SIOCDEVPRIVATE+1
-#define IOCTL_RX_CMD          SIOCDEVPRIVATE+2
-#define IOCTL_TX_CMD          SIOCDEVPRIVATE+3
-#define IOCTL_PRINT_REGISTERS SIOCDEVPRIVATE+4
-#define IOCTL_PRINT_BDAS      SIOCDEVPRIVATE+5
-#define IOCTL_SPIN_LOCK_TEST  SIOCDEVPRIVATE+6
-#define IOCTL_SISR_MASK       SIOCDEVPRIVATE+7
-#endif
-
 /* MAX_INTR - the maximum number of times we can loop
  * inside the interrupt function before returning
  * control to the OS (maximum value is 256)



--===============7496296653689094==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============7496296653689094==--
