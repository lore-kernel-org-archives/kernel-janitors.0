From: james4765@verizon.net
Date: Thu, 28 Oct 2004 15:00:58 +0000
Subject: [KJ] [PATCH 5/9] to arch/sparc/Kconfig
Message-Id: <20041028150057.2776.70475.54914@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============21740376154434582=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041028150029.2776.69333.50087@localhost.localdomain>
In-Reply-To: <20041028150029.2776.69333.50087@localhost.localdomain>
To: kernel-janitors@lists.osdl.org
Cc: rusty@rustcorp.com.au, linux-kernel@vger.kernel.org, james4765@verizon.net

--===============21740376154434582==

Description: Remove x86-specific help in arch/sparc/Kconfig.
Apply against 2.6.9.

Signed-off by: James Nelson <james4765@gmail.com>

diff -u ./arch/sparc/Kconfig.orig ./arch/sparc/Kconfig
--- ./arch/sparc/Kconfig.orig	2004-10-16 09:53:49.626021592 -0400
+++ ./arch/sparc/Kconfig	2004-10-16 10:18:35.964664772 -0400
@@ -188,10 +188,10 @@
 	  (/dev/tty0) will still be used as the system console by default, but
 	  you can alter that using a kernel command line option such as
 	  "console=ttyS1". (Try "man bootparam" or see the documentation of
-	  your boot loader (lilo or loadlin) about how to pass options to the
-	  kernel at boot time.)
+	  your boot loader (silo) about how to pass options to the kernel at
+	  boot time.)
 
-	  If you don't have a VGA card installed and you say Y here, the
+	  If you don't have a graphics card installed and you say Y here, the
 	  kernel will automatically use the first serial line, /dev/ttyS0, as
 	  system console.
 

--===============21740376154434582==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============21740376154434582==--
