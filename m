From: Daniele Pizzoni <auouo@tin.it>
Date: Sun, 17 Oct 2004 16:14:20 +0000
Subject: [KJ] [PATCH 8/8] replacing/fixing printk with pr_debug/pr_info in
Message-Id: <1098032701.3023.134.camel@pdp11.tsho.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============28272919236742355=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors <kernel-janitors@lists.osdl.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>

--===============28272919236742355==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Replace custom macro Dprintk with pr_debug from kernel.h.

Signed-off-by: Daniele Pizzoni <auouo@tin.it>

Index: linux-2.6.9-rc4/include/asm-i386/mach-default/smpboot_hooks.h
===================================================================
--- linux-2.6.9-rc4.orig/include/asm-i386/mach-default/smpboot_hooks.h	2004-08-14 07:36:44.000000000 +0200
+++ linux-2.6.9-rc4/include/asm-i386/mach-default/smpboot_hooks.h	2004-10-17 17:01:24.044525072 +0200
@@ -10,11 +10,11 @@ static inline void smpboot_setup_warm_re
 {
 	CMOS_WRITE(0xa, 0xf);
 	local_flush_tlb();
-	Dprintk("1.\n");
+	pr_debug("1.\n");
 	*((volatile unsigned short *) TRAMPOLINE_HIGH) = start_eip >> 4;
-	Dprintk("2.\n");
+	pr_debug("2.\n");
 	*((volatile unsigned short *) TRAMPOLINE_LOW) = start_eip & 0xf;
-	Dprintk("3.\n");
+	pr_debug("3.\n");
 }
 
 static inline void smpboot_restore_warm_reset_vector(void)



--===============28272919236742355==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============28272919236742355==--
