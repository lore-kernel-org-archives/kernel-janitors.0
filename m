From: james4765@verizon.net
Date: Thu, 28 Oct 2004 15:01:12 +0000
Subject: [KJ] [PATCH 7/9] to arch/sparc/Kconfig
Message-Id: <20041028150111.2776.47585.86377@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============23248767335852305=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041028150029.2776.69333.50087@localhost.localdomain>
In-Reply-To: <20041028150029.2776.69333.50087@localhost.localdomain>
To: kernel-janitors@lists.osdl.org
Cc: rusty@rustcorp.com.au, linux-kernel@vger.kernel.org, james4765@verizon.net

--===============23248767335852305==

Description: Add default for SUN4 in arch/sparc/Kconfig.
Apply against 2.6.9.

Signed-off by: James Nelson <james4765@gmail.com>

diff -u ./arch/sparc/Kconfig.orig ./arch/sparc/Kconfig
--- ./arch/sparc/Kconfig.orig	2004-10-16 09:53:49.626021592 -0400
+++ ./arch/sparc/Kconfig	2004-10-16 10:09:58.304756208 -0400
@@ -222,6 +222,7 @@
 config SUN4
 	bool "Support for SUN4 machines (disables SUN4[CDM] support)"
 	depends on !SMP
+	default n
 	help
 	  Say Y here if, and only if, your machine is a sun4. Note that
 	  a kernel compiled with this option will run only on sun4.

--===============23248767335852305==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============23248767335852305==--
