From: Christophe Lucas <clucas@rotomalug.org>
Date: Mon, 15 May 2006 14:37:42 +0000
Subject: [KJ] =?iso-8859-1?q?=5BPATCH=5D=A0printk?=
Message-Id: <20060515143742.GS12726@rotomalug.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============94162476404394191=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============94162476404394191==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk should include appropriate KERN_* constant (of course
only at beginning of lines).

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


Index: linux-2.6.16.16/arch/arm/mach-omap1/clock.c
===================================================================
--- linux-2.6.16.16.orig/arch/arm/mach-omap1/clock.c	2006-05-11 03:56:24.000000000 +0200
+++ linux-2.6.16.16/arch/arm/mach-omap1/clock.c	2006-05-15 12:28:56.000000000 +0200
@@ -702,7 +702,7 @@
 		ck_ref.rate = 19200000;
 #endif
 
-	printk("Clocks: ARM_SYSST: 0x%04x DPLL_CTL: 0x%04x ARM_CKCTL: 0x%04x\n",
+	printk(KERN_INFO "Clocks: ARM_SYSST: 0x%04x DPLL_CTL: 0x%04x ARM_CKCTL: 0x%04x\n",
 	       omap_readw(ARM_SYSST), omap_readw(DPLL_CTL),
 	       omap_readw(ARM_CKCTL));
 

--===============94162476404394191==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============94162476404394191==--
