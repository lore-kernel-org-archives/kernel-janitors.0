From: james4765@verizon.net
Date: Thu, 28 Oct 2004 15:01:25 +0000
Subject: [KJ] [PATCH 9/9] to kernel/power/Kconfig
Message-Id: <20041028150125.2776.85757.89489@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============44174379946242759=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041028150029.2776.69333.50087@localhost.localdomain>
In-Reply-To: <20041028150029.2776.69333.50087@localhost.localdomain>
To: kernel-janitors@lists.osdl.org
Cc: rusty@rustcorp.com.au, linux-kernel@vger.kernel.org, james4765@verizon.net

--===============44174379946242759==

Description: Fix a couple of misspellings in kernel/power/Kconfig.
Apply against 2.6.9.

Signed-off-by:  James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.9-original/kernel/power/Kconfig linux-2.6.9/kernel/power/Kconfig
--- linux-2.6.9-original/kernel/power/Kconfig	2004-10-18 17:54:55.000000000 -0400
+++ linux-2.6.9/kernel/power/Kconfig	2004-10-28 10:53:02.583350353 -0400
@@ -29,7 +29,7 @@
 	bool "Software Suspend (EXPERIMENTAL)"
 	depends on EXPERIMENTAL && PM && SWAP
 	---help---
-	  Enable the possibilty of suspendig machine. It doesn't need APM.
+	  Enable the possibility of suspending machine. It doesn't need APM.
 	  You may suspend your machine by 'swsusp' or 'shutdown -z <time>' 
 	  (patch for sysvinit needed). 
 

--===============44174379946242759==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============44174379946242759==--
