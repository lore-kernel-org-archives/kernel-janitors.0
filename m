From: Michael Veeck <michael.veeck@gmx.net>
Date: Sun, 15 Aug 2004 11:44:54 +0000
Subject: [Kernel-janitors] [PATCH] minmax-removal
Message-Id: <411F4CB6.1030401@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------090508050908010304050000"
List-Id: <kernel-janitors.vger.kernel.org>
References: <411F4C54.4090609@gmx.net>
In-Reply-To: <411F4C54.4090609@gmx.net>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------090508050908010304050000
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.8.1) removes unnecessary min/max macros and changes
calls to use kernel.h macros instead.

Since I dont have the hardware those patches are not tested.

Best regards
Veeck

Signed-off-by: Michael Veeck <michael.veeck@gmx.net>





--------------090508050908010304050000
Content-Type: text/plain;
 name="minmax-arch-sh-cchips.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="minmax-arch-sh-cchips.patch"

--- linux-2.6.8-old/arch/sh/cchips/hd6446x/hd64465/io.c	2004-08-14 11:48:56.000000000 +0200
+++ linux-2.6.8-new/arch/sh/cchips/hd6446x/hd64465/io.c	2004-08-15 13:22:12.517689944 +0200
@@ -48,10 +48,6 @@ static unsigned char	hd64465_iomap_lo_sh
 static unsigned long	hd64465_iomap_hi[HD64465_IOMAP_HI_NMAP];
 static unsigned char	hd64465_iomap_hi_shift[HD64465_IOMAP_HI_NMAP];
 
-#ifndef MAX
-#define MAX(a,b)    ((a)>(b)?(a):(b))
-#endif
-
 #define PORT2ADDR(x) (sh_mv.mv_isa_port2addr(x))
 
 void hd64465_port_map(unsigned short baseport, unsigned int nports,
@@ -71,7 +67,7 @@ void hd64465_port_map(unsigned short bas
 	    addr += (1<<(HD64465_IOMAP_LO_SHIFT));
 	}
 
-	for (port = MAX(baseport, HD64465_IOMAP_LO_THRESH) ;
+	for (port = max_t(unsigned int, baseport, HD64465_IOMAP_LO_THRESH);
 	     port < endport && port < HD64465_IOMAP_HI_THRESH ;
 	     port += (1<<HD64465_IOMAP_HI_SHIFT)) {
 	    DPRINTK("    maphi[0x%x] = 0x%08lx\n", port, addr);
@@ -95,7 +91,7 @@ void hd64465_port_unmap(unsigned short b
     	    hd64465_iomap_lo[port>>HD64465_IOMAP_LO_SHIFT] = 0;
 	}
 
-	for (port = MAX(baseport, HD64465_IOMAP_LO_THRESH) ;
+	for (port = max_t(unsigned int, baseport, HD64465_IOMAP_LO_THRESH);
 	     port < endport && port < HD64465_IOMAP_HI_THRESH ;
 	     port += (1<<HD64465_IOMAP_HI_SHIFT)) {
     	    hd64465_iomap_hi[port>>HD64465_IOMAP_HI_SHIFT] = 0;

--------------090508050908010304050000
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------090508050908010304050000--
