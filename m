From: Michael Veeck <michael.veeck@gmx.net>
Date: Sun, 15 Aug 2004 11:44:41 +0000
Subject: [Kernel-janitors] [PATCH] minmax-removal arch/sh/boards/bigsur/io.c
Message-Id: <411F4CA9.5010404@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------040005010508090401030906"
List-Id: <kernel-janitors.vger.kernel.org>
References: <411F4C54.4090609@gmx.net>
In-Reply-To: <411F4C54.4090609@gmx.net>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------040005010508090401030906
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.8.1) removes unnecessary min/max macros and changes
calls to use kernel.h macros instead.

Since I dont have the hardware those patches are not tested.

Best regards
Veeck

Signed-off-by: Michael Veeck <michael.veeck@gmx.net>





--------------040005010508090401030906
Content-Type: text/plain;
 name="minmax-arch-sh-boards.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="minmax-arch-sh-boards.patch"

--- linux-2.6.8-old/arch/sh/boards/bigsur/io.c	2004-08-14 11:48:56.000000000 +0200
+++ linux-2.6.8-new/arch/sh/boards/bigsur/io.c	2004-08-15 13:23:10.392891576 +0200
@@ -37,10 +37,6 @@ static u8 bigsur_iomap_lo_shift[BIGSUR_I
 static u32 bigsur_iomap_hi[BIGSUR_IOMAP_HI_NMAP];
 static u8 bigsur_iomap_hi_shift[BIGSUR_IOMAP_HI_NMAP];
 
-#ifndef MAX
-#define MAX(a,b)    ((a)>(b)?(a):(b))
-#endif
-
 void bigsur_port_map(u32 baseport, u32 nports, u32 addr, u8 shift)
 {
 	u32 port, endport = baseport + nports;
@@ -57,7 +53,7 @@ void bigsur_port_map(u32 baseport, u32 n
 	    	addr += (1<<(BIGSUR_IOMAP_LO_SHIFT));
 	}
 
-	for (port = MAX(baseport, BIGSUR_IOMAP_LO_THRESH) ;
+	for (port = max(baseport, BIGSUR_IOMAP_LO_THRESH);
 	     port < endport && port < BIGSUR_IOMAP_HI_THRESH ;
 	     port += (1<<BIGSUR_IOMAP_HI_SHIFT)) {
 	    	pr_debug("    maphi[0x%x] = 0x%08x\n", port, addr);
@@ -80,7 +76,7 @@ void bigsur_port_unmap(u32 baseport, u32
 		bigsur_iomap_lo[port>>BIGSUR_IOMAP_LO_SHIFT] = 0;
 	}
 
-	for (port = MAX(baseport, BIGSUR_IOMAP_LO_THRESH) ;
+	for (port = max(baseport, BIGSUR_IOMAP_LO_THRESH);
 	     port < endport && port < BIGSUR_IOMAP_HI_THRESH ;
 	     port += (1<<BIGSUR_IOMAP_HI_SHIFT)) {
 		bigsur_iomap_hi[port>>BIGSUR_IOMAP_HI_SHIFT] = 0;

--------------040005010508090401030906
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------040005010508090401030906--
