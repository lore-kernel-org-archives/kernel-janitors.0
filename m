From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 07 Jul 2005 15:44:53 +0000
Subject: [KJ] [patch 2.6.13-rc1 19/23] Audit return code of create_proc_*
Message-Id: <20050707154649.199088000@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============20350741254582871=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============20350741254582871==
Content-Disposition: inline; filename=proc_create_arch_m68k_mac_iop.c.diff

diff -urpNX dontdiff 2.6.13-rc1.orig/arch/m68k/mac/iop.c 2.6.13-rc1/arch/m68k/mac/iop.c
--- 2.6.13-rc1.orig/arch/m68k/mac/iop.c	2005-06-29 07:57:29.000000000 +0200
+++ 2.6.13-rc1/arch/m68k/mac/iop.c	2005-07-05 10:16:48.360949848 +0200
@@ -275,6 +275,7 @@ void __init iop_preinit(void)
 
 void __init iop_init(void)
 {
+	struct proc_dir_entry* proc_entry;
 	int i;
 
 	if (iop_scc_present) {
@@ -303,7 +304,10 @@ void __init iop_init(void)
 
 #if 0	/* Crashing in 2.4 now, not yet sure why.   --jmt */
 #ifdef CONFIG_PROC_FS
-	create_proc_info_entry("mac_iop", 0, &proc_root, iop_get_proc_info);
+	proc_entry = create_proc_info_entry("mac_iop", 0, 
+		&proc_root, iop_get_proc_info);
+	if (!proc_entry)
+		printk(KERN_WARNING "iop: Unable to create /proc entry.\n");
 #endif
 #endif
 }

--

--===============20350741254582871==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============20350741254582871==--
