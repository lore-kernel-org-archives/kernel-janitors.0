From: james4765@verizon.net
Date: Thu, 28 Oct 2004 15:01:19 +0000
Subject: [KJ] [PATCH 8/9] to arch/sparc/Kconfig
Message-Id: <20041028150118.2776.11985.87844@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============11995069606858921=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041028150029.2776.69333.50087@localhost.localdomain>
In-Reply-To: <20041028150029.2776.69333.50087@localhost.localdomain>
To: kernel-janitors@lists.osdl.org
Cc: rusty@rustcorp.com.au, linux-kernel@vger.kernel.org, james4765@verizon.net

--===============11995069606858921==

Description: Make config choice for OpenPROM more obvious in arch/sparc/Kconfig.
Apply against 2.6.9.

Signed-off by: James Nelson <james4765@gmail.com>

diff -u ./arch/sparc/Kconfig.orig ./arch/sparc/Kconfig
--- arch/sparc/Kconfig.orig	2004-10-16 09:53:49.626021592 -0400
+++ arch/sparc/Kconfig	2004-10-18 18:38:05.125374024 -0400
@@ -248,7 +248,10 @@
 	  -t openpromfs none /proc/openprom".
 
 	  To compile the /proc/openprom support as a module, choose M here: the
-	  module will be called openpromfs.  If unsure, choose M.
+	  module will be called openpromfs.
+
+	  Only choose N if you know in advance that you will not need to modify
+	  OpenPROM settings on the running system.
 
 source "fs/Kconfig.binfmt"
 

--===============11995069606858921==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============11995069606858921==--
