From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 07 Jul 2005 15:44:50 +0000
Subject: [KJ] [patch 2.6.13-rc1 16/23] Audit return code of create_proc_*
Message-Id: <20050707154633.027812000@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============57131249380524007=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============57131249380524007==
Content-Disposition: inline;
	filename=proc_create_arch_sh64_kernel_process.c.diff

diff -urpNX dontdiff 2.6.13-rc1.orig/arch/sh64/kernel/process.c 2.6.13-rc1/arch/sh64/kernel/process.c
--- 2.6.13-rc1.orig/arch/sh64/kernel/process.c	2005-06-29 07:57:29.000000000 +0200
+++ 2.6.13-rc1/arch/sh64/kernel/process.c	2005-07-05 10:25:22.280822152 +0200
@@ -953,7 +953,11 @@ asids_proc_info(char *buf, char **start,
 
 static int __init register_proc_asids(void)
 {
-  create_proc_read_entry("asids", 0, NULL, asids_proc_info, NULL);
+	struct proc_dir_entry* ent;
+	ent = create_proc_read_entry("asids", 0, NULL, asids_proc_info, NULL);
+	if (!ent)
+		printk(KERN_WARNING 
+			"process: Unable to create asids /proc entry.\n");
   return 0;
 }
 

--

--===============57131249380524007==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============57131249380524007==--
