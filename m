From: Domen Puncer <domen@coderock.org>
Date: Sat, 24 Jul 2004 21:18:01 +0000
Subject: [Kernel-janitors] [patch 2.6.8-rc2] replace dprintk with pr_debug
Message-Id: <20040724211801.GA3633@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============37434424308029035=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============37434424308029035==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

Replaced dprintk with pr_debug from kernel.h
Compile tested.


Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/arch/i386/kernel/microcode.c	Wed Jul 14 19:14:45 2004
+++ a/arch/i386/kernel/microcode.c	Sat Jul 24 23:13:06 2004
@@ -69,7 +69,8 @@
  *		Thanks to Stuart Swales for pointing out this bug.
  */
 
-
+//#define DEBUG /* pr_debug */
+#include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/sched.h>
 #include <linux/module.h>
@@ -88,12 +89,6 @@
 MODULE_LICENSE("GPL");
 
 #define MICROCODE_VERSION 	"1.14"
-#define MICRO_DEBUG 		0
-#if MICRO_DEBUG
-#define dprintk(x...) printk(KERN_INFO x)
-#else
-#define dprintk(x...)
-#endif
 
 #define DEFAULT_UCODE_DATASIZE 	(2000) 	  /* 2000 bytes */
 #define MC_HEADER_SIZE		(sizeof (microcode_header_t))  	  /* 48 bytes */
@@ -172,7 +167,7 @@
 	__asm__ __volatile__ ("cpuid" : : : "ax", "bx", "cx", "dx");
 	/* get the current revision from MSR 0x8B */
 	rdmsr(MSR_IA32_UCODE_REV, val[0], uci->rev);
-	dprintk("microcode: collect_cpu_info : sig=0x%x, pf=0x%x, rev=0x%x\n", 
+	pr_debug("microcode: collect_cpu_info : sig=0x%x, pf=0x%x, rev=0x%x\n", 
 			uci->sig, uci->pf, uci->rev);
 }
 
@@ -180,22 +175,22 @@
 {
 	struct ucode_cpu_info *uci = ucode_cpu_info + cpu_num;
 
-	dprintk("Microcode Found.\n");
-	dprintk("   Header Revision 0x%x\n", mc_header->hdrver);
-	dprintk("   Loader Revision 0x%x\n", mc_header->ldrver);
-	dprintk("   Revision 0x%x \n", mc_header->rev);
-	dprintk("   Date %x/%x/%x\n",
+	pr_debug("Microcode Found.\n");
+	pr_debug("   Header Revision 0x%x\n", mc_header->hdrver);
+	pr_debug("   Loader Revision 0x%x\n", mc_header->ldrver);
+	pr_debug("   Revision 0x%x \n", mc_header->rev);
+	pr_debug("   Date %x/%x/%x\n",
 		((mc_header->date >> 24 ) & 0xff),
 		((mc_header->date >> 16 ) & 0xff),
 		(mc_header->date & 0xFFFF));
-	dprintk("   Signature 0x%x\n", sig);
-	dprintk("   Type 0x%x Family 0x%x Model 0x%x Stepping 0x%x\n",
+	pr_debug("   Signature 0x%x\n", sig);
+	pr_debug("   Type 0x%x Family 0x%x Model 0x%x Stepping 0x%x\n",
 		((sig >> 12) & 0x3),
 		((sig >> 8) & 0xf),
 		((sig >> 4) & 0xf),
 		((sig & 0xf)));
-	dprintk("   Processor Flags 0x%x\n", pf);
-	dprintk("   Checksum 0x%x\n", cksum);
+	pr_debug("   Processor Flags 0x%x\n", pf);
+	pr_debug("   Checksum 0x%x\n", cksum);
 
 	if (mc_header->rev < uci->rev) {
 		printk(KERN_ERR "microcode: CPU%d not 'upgrading' to earlier revision"
@@ -209,7 +204,7 @@
 		goto out;
 	}
 
-	dprintk("microcode: CPU%d found a matching microcode update with "
+	pr_debug("microcode: CPU%d found a matching microcode update with "
 		" revision 0x%x (current=0x%x)\n", cpu_num, mc_header->rev, uci->rev);
 	uci->cksum = cksum;
 	uci->pf = pf; /* keep the original mc pf for cksum calculation */

--===============37434424308029035==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============37434424308029035==--
