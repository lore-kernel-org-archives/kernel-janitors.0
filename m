From: Christophe Lucas <clucas@rotomalug.org>
Date: Tue, 12 Jul 2005 12:05:11 +0000
Subject: [KJ] [patch 2.6.13-rc1 19/23][RESEND] Audit return code of
Message-Id: <20050712120511.GF4712@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============7777578374264662=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============7777578374264662==
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii

Description:
Audit return of create_proc_* functions.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


Index: 2.6.13-rc1/arch/m68k/mac/iop.c
===================================================================
--- 2.6.13-rc1.orig/arch/m68k/mac/iop.c
+++ 2.6.13-rc1/arch/m68k/mac/iop.c
@@ -275,6 +275,7 @@ void __init iop_preinit(void)
 
 void __init iop_init(void)
 {
+	struct proc_dir_entry *proc_entry;
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

--===============7777578374264662==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============7777578374264662==--
