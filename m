From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 07 Jul 2005 15:44:49 +0000
Subject: [KJ] [patch 2.6.13-rc1 15/23] Audit return code of create_proc_*
Message-Id: <20050707154627.731751000@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============26331353179292805=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============26331353179292805==
Content-Disposition: inline; filename=proc_create_arch_sh64_mm_fault.c.diff

diff -urpNX dontdiff 2.6.13-rc1.orig/arch/sh64/mm/fault.c 2.6.13-rc1/arch/sh64/mm/fault.c
--- 2.6.13-rc1.orig/arch/sh64/mm/fault.c	2005-06-29 07:57:29.000000000 +0200
+++ 2.6.13-rc1/arch/sh64/mm/fault.c	2005-07-05 10:26:44.569312400 +0200
@@ -592,8 +592,11 @@ tlb_proc_info(char *buf, char **start, o
 
 static int __init register_proc_tlb(void)
 {
-  create_proc_read_entry("tlb", 0, NULL, tlb_proc_info, NULL);
-  return 0;
+	struct proc_dir_entry* ent;
+	ent = create_proc_read_entry("tlb", 0, NULL, tlb_proc_info, NULL);
+	if (!ent)
+		printk(KERN_WARNING "fault.c: Unable to create tlb /proc entry.\n");
+	return 0;
 }
 
 __initcall(register_proc_tlb);

--

--===============26331353179292805==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============26331353179292805==--
