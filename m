From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Thu, 07 Apr 2005 14:24:40 +0000
Subject: [KJ] [PATCH] arch/ppc64: Replace custom MIN macro
Message-Id: <20050407142440.GA776@neon>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68704541963574928=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============68704541963574928==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From the kerneljanitors TODO list:
- min/max macros from kernel.h are safe, a lot of handcrafted MIN/MAX are not.

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

diff -urpN linux-2.6.12-rc2.orig/arch/ppc64/kernel/signal.c linux-2.6.12-rc2/arch/ppc64/kernel/signal.c
--- linux-2.6.12-rc2.orig/arch/ppc64/kernel/signal.c	2005-04-07 16:18:30.287667016 +0200
+++ linux-2.6.12-rc2/arch/ppc64/kernel/signal.c	2005-04-07 16:19:14.159997408 +0200
@@ -42,11 +42,7 @@
 
 #define _BLOCKABLE (~(sigmask(SIGKILL) | sigmask(SIGSTOP)))
 
-#ifndef MIN
-#define MIN(a,b) (((a) < (b)) ? (a) : (b))
-#endif
-
-#define GP_REGS_SIZE	MIN(sizeof(elf_gregset_t), sizeof(struct pt_regs))
+#define GP_REGS_SIZE	min(sizeof(elf_gregset_t), sizeof(struct pt_regs))
 #define FP_REGS_SIZE	sizeof(elf_fpregset_t)
 
 #define TRAMP_TRACEBACK	3

--===============68704541963574928==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68704541963574928==--
