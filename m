From: Domen Puncer <domen@coderock.org>
Date: Wed, 24 Nov 2004 20:25:39 +0000
Subject: [KJ] [patch] mips: AU1[0X]00_USB_DEVICE typo
Message-Id: <20041124202539.GB16797@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============18850793088394679=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============18850793088394679==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

AU1000_USB_DEVICE appears 3 times.
AU1X00_USB_DEVICE appears 44 times, and is nowhere defined.
One ifdef starts with "X" version, and ends with "0", so it's quite
obvious these is supposed to be one option.

Makes you wonder if anybody uses these devices.

Signed-off-by: Domen Puncer <domen@coderock.org>

diff -pruNX dontdiff c/arch/mips/Kconfig str2/arch/mips/Kconfig
--- c/arch/mips/Kconfig	2004-10-19 13:52:47.000000000 +0200
+++ str2/arch/mips/Kconfig	2004-11-24 20:17:32.000000000 +0100
@@ -959,7 +959,7 @@ config SYSCLK_100
 
 endchoice
 
-config AU1000_USB_DEVICE
+config AU1X00_USB_DEVICE
 	bool
 	depends on MIPS_PB1500 || MIPS_PB1100 || MIPS_PB1000
 	default n
diff -pruNX dontdiff c/arch/mips/au1000/mtx-1/board_setup.c str2/arch/mips/au1000/mtx-1/board_setup.c
--- c/arch/mips/au1000/mtx-1/board_setup.c	2004-03-11 12:12:24.000000000 +0100
+++ str2/arch/mips/au1000/mtx-1/board_setup.c	2004-11-24 20:18:10.000000000 +0100
@@ -60,7 +60,7 @@ void __init board_setup(void)
 	// enable USB power switch
 	au_writel( au_readl(GPIO2_DIR) | 0x10, GPIO2_DIR );
 	au_writel( 0x100000, GPIO2_OUTPUT );
-#endif // defined (CONFIG_USB_OHCI) || defined (CONFIG_AU1000_USB_DEVICE)
+#endif // defined (CONFIG_USB_OHCI) || defined (CONFIG_AU1X00_USB_DEVICE)
 
 #ifdef CONFIG_PCI
 #if defined(__MIPSEB__)
diff -pruNX dontdiff c/arch/mips/configs/pb1500_defconfig str2/arch/mips/configs/pb1500_defconfig
--- c/arch/mips/configs/pb1500_defconfig	2004-08-17 11:44:56.000000000 +0200
+++ str2/arch/mips/configs/pb1500_defconfig	2004-11-24 20:18:39.000000000 +0100
@@ -99,7 +99,7 @@ CONFIG_RWSEM_GENERIC_SPINLOCK=y
 CONFIG_HAVE_DEC_LOCK=y
 CONFIG_DMA_NONCOHERENT=y
 CONFIG_CPU_LITTLE_ENDIAN=y
-# CONFIG_AU1000_USB_DEVICE is not set
+# CONFIG_AU1X00_USB_DEVICE is not set
 CONFIG_MIPS_L1_CACHE_SHIFT=5
 # CONFIG_FB is not set
 

--===============18850793088394679==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============18850793088394679==--
