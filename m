From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 05 Aug 2005 15:36:32 +0000
Subject: [KJ] [PATCH] sh64 (mm/fault.c): procfs_failure && create_proc*
Message-Id: <20050805153632.GH5233@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============36267088706106382=="
List-Id: <kernel-janitors.vger.kernel.org>
To: akpm@osdl.org, kernel-janitors@lists.osdl.org
Cc: domen@coderock.org, linux-kernel@vger.kernel.org

--===============36267088706106382==
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii

description:
audit return code of create_proc_* function is a entry in janitors
TODO list. Audit this return and printk() when it fails, can spam a lot
system without compiled proc support. So this patch can audit return
code by means of procfs_failure().

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

diff -urpNX dontdiff linux-2.6.13-rc4-mm1.orig/arch/sh64/mm/fault.c linux-2.6.13-rc4-mm1/arch/sh64/mm/fault.c
--- linux-2.6.13-rc4-mm1.orig/arch/sh64/mm/fault.c	2005-07-29 00:44:44.000000000 +0200
+++ linux-2.6.13-rc4-mm1/arch/sh64/mm/fault.c	2005-08-03 12:35:19.000000000 +0200
@@ -592,8 +592,11 @@ tlb_proc_info(char *buf, char **start, o
 
 static int __init register_proc_tlb(void)
 {
-  create_proc_read_entry("tlb", 0, NULL, tlb_proc_info, NULL);
-  return 0;
+	struct proc_dir_entry* ent;
+	ent = create_proc_read_entry("tlb", 0, NULL, tlb_proc_info, NULL);
+	if (!ent)
+		procfs_failure("fault.c: Unable to create tlb /proc entry.\n");
+	return 0;
 }
 
 __initcall(register_proc_tlb);

--===============36267088706106382==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============36267088706106382==--
