From: james4765@verizon.net
Date: Thu, 28 Oct 2004 15:00:30 +0000
Subject: [KJ] [PATCH 1/9] to arch/sh/drivers/pci/Kconfig
Message-Id: <20041028150029.2776.69333.50087@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============79615377221980266=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@lists.osdl.org
Cc: rusty@rustcorp.com.au, linux-kernel@vger.kernel.org, james4765@verizon.net

--===============79615377221980266==

Description: Remove x86-specific help in arch/sh/drivers/pci/Kconfig.
Apply against 2.6.9.

Signed-off by: James Nelson <james4765@gmail.com>

diff -u arch/sh/drivers/pci/Kconfig.orig arch/sh/drivers/pci/Kconfig
--- arch/sh/drivers/pci/Kconfig.orig	2004-10-17 15:22:15.567649627 -0400
+++ arch/sh/drivers/pci/Kconfig	2004-10-17 15:23:00.778611363 -0400
@@ -3,8 +3,7 @@
 	help
 	  Find out whether you have a PCI motherboard. PCI is the name of a
 	  bus system, i.e. the way the CPU talks to the other stuff inside
-	  your box. Other bus systems are ISA, EISA, MicroChannel (MCA) or
-	  VESA. If you have PCI, say Y, otherwise N.
+	  your box. If you have PCI, say Y, otherwise N.
 
 	  The PCI-HOWTO, available from
 	  <http://www.tldp.org/docs.html#howto>, contains valuable

--===============79615377221980266==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============79615377221980266==--
