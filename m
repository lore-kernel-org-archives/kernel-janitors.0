From: james4765@verizon.net
Date: Thu, 28 Oct 2004 15:00:44 +0000
Subject: [KJ] [PATCH 3/9] to arch/sparc64/Kconfig
Message-Id: <20041028150043.2776.92620.93420@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============46007860499332898=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041028150029.2776.69333.50087@localhost.localdomain>
In-Reply-To: <20041028150029.2776.69333.50087@localhost.localdomain>
To: kernel-janitors@lists.osdl.org
Cc: rusty@rustcorp.com.au, linux-kernel@vger.kernel.org, james4765@verizon.net

--===============46007860499332898==

Description: Remove x86-specific help in arch/sparc64/Kconfig.
Apply against 2.6.9.

Signed-off by: James Nelson <james4765@gmail.com>

diff -u ./arch/sparc64/Kconfig.orig ./arch/sparc64/Kconfig
--- ./arch/sparc64/Kconfig.orig	2004-10-16 11:23:24.940665125 -0400
+++ ./arch/sparc64/Kconfig	2004-10-16 11:23:55.089644059 -0400
@@ -79,8 +79,8 @@
 	  terminal (/dev/tty0) will be used as system console. You can change
 	  that with a kernel command line option such as "console=tty3" which
 	  would use the third virtual terminal as system console. (Try "man
-	  bootparam" or see the documentation of your boot loader (lilo or
-	  loadlin) about how to pass options to the kernel at boot time.)
+	  bootparam" or see the documentation of your boot loader (silo)
+	  about how to pass options to the kernel at boot time.)
 
 	  If unsure, say Y.
 

--===============46007860499332898==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============46007860499332898==--
