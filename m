From: james4765@verizon.net
Date: Thu, 28 Oct 2004 15:00:51 +0000
Subject: [KJ] [PATCH 4/9] to arch/sparc/Kconfig
Message-Id: <20041028150050.2776.32667.73956@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============35101836223605831=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041028150029.2776.69333.50087@localhost.localdomain>
In-Reply-To: <20041028150029.2776.69333.50087@localhost.localdomain>
To: kernel-janitors@lists.osdl.org
Cc: rusty@rustcorp.com.au, linux-kernel@vger.kernel.org, james4765@verizon.net

--===============35101836223605831==

Description: Remove x86-specific help in arch/sparc/Kconfig.
Apply against 2.6.9.

Signed-off by: James Nelson <james4765@gmail.com>

diff -u ./arch/sparc/Kconfig.orig ./arch/sparc/Kconfig
--- ./arch/sparc/Kconfig.orig	2004-10-16 09:53:49.626021592 -0400
+++ ./arch/sparc/Kconfig	2004-10-16 10:15:30.184460399 -0400
@@ -281,9 +281,9 @@
 
 	  If you have several parallel ports, you can specify which ports to
 	  use with the "lp" kernel command line option.  (Try "man bootparam"
-	  or see the documentation of your boot loader (lilo or loadlin) about
-	  how to pass options to the kernel at boot time.)  The syntax of the
-	  "lp" command line option can be found in <file:drivers/char/lp.c>.
+	  or see the documentation of your boot loader (silo) about how to pass
+	  options to the kernel at boot time.)  The syntax of the "lp" command
+	  line option can be found in <file:drivers/char/lp.c>.
 
 	  If you have more than 8 printers, you need to increase the LP_NO
 	  macro in lp.c and the PARPORT_MAX macro in parport.h.

--===============35101836223605831==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============35101836223605831==--
