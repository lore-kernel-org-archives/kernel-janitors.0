From: Christophe Lucas <clucas@rotomalug.org>
Date: Mon, 15 May 2006 10:19:11 +0000
Subject: [KJ] [PATCH] printk : arch/arm/mach-ixp2000/ixdp2800.c
Message-Id: <20060515101911.GI12726@rotomalug.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============50356114441121447=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============50356114441121447==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk should include appropriate KERN_* constant (of course
only at beginning of lines).

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


Index: linux-2.6.16.16/arch/arm/mach-ixp2000/ixdp2800.c
===================================================================
--- linux-2.6.16.16.orig/arch/arm/mach-ixp2000/ixdp2800.c	2006-05-11 03:56:24.000000000 +0200
+++ linux-2.6.16.16/arch/arm/mach-ixp2000/ixdp2800.c	2006-05-15 11:58:06.000000000 +0200
@@ -101,7 +101,7 @@
 
 void __init ixdp2800_pci_preinit(void)
 {
-	printk("ixdp2x00_pci_preinit called\n");
+	printk(KERN_DEBUG "ixdp2x00_pci_preinit called\n");
 
 	*IXP2000_PCI_ADDR_EXT = 0x0001e000;
 

--===============50356114441121447==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============50356114441121447==--
