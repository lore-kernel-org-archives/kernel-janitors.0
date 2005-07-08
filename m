From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 08 Jul 2005 13:34:39 +0000
Subject: [KJ] [patch 2.6.13-rc1 15/23][RESEND] Audit return code of
Message-Id: <20050708133439.GW4683@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============80341600339043939=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============80341600339043939==
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii

Description:
Audit return of create_proc_* functions.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

Index: 2.6.13-rc1/arch/sh64/mm/fault.c
===================================================================
--- 2.6.13-rc1.orig/arch/sh64/mm/fault.c
+++ 2.6.13-rc1/arch/sh64/mm/fault.c
@@ -592,8 +592,11 @@ tlb_proc_info(char *buf, char **start, o
 
 static int __init register_proc_tlb(void)
 {
-  create_proc_read_entry("tlb", 0, NULL, tlb_proc_info, NULL);
-  return 0;
+	struct proc_dir_entry *ent;
+	ent = create_proc_read_entry("tlb", 0, NULL, tlb_proc_info, NULL);
+	if (!ent)
+		printk(KERN_WARNING "fault.c: Unable to create tlb /proc entry.\n");
+	return 0;
 }
 
 __initcall(register_proc_tlb);

--===============80341600339043939==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============80341600339043939==--
