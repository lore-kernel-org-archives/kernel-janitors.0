From: Daniele Pizzoni <auouo@tin.it>
Date: Sun, 17 Oct 2004 16:14:29 +0000
Subject: [KJ] [PATCH 7/8] replacing/fixing printk with pr_debug/pr_info in
Message-Id: <1098032577.3023.130.camel@pdp11.tsho.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============58896583551145254=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors <kernel-janitors@lists.osdl.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>

--===============58896583551145254==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Strip the custom debug Dprintk macro.

Signed-off-by: Daniele Pizzoni <auouo@tin.it>

Index: linux-2.6.9-rc4/include/asm-i386/apic.h
===================================================================
--- linux-2.6.9-rc4.orig/include/asm-i386/apic.h	2004-10-17 16:57:56.742039840 +0200
+++ linux-2.6.9-rc4/include/asm-i386/apic.h	2004-10-17 17:01:16.869615824 +0200
@@ -7,7 +7,6 @@
 #include <asm/apicdef.h>
 #include <asm/system.h>
 
-#define Dprintk(x...)
 
 /*
  * Debugging macros



--===============58896583551145254==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============58896583551145254==--
