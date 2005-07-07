From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 07 Jul 2005 15:44:46 +0000
Subject: [KJ] [patch 2.6.13-rc1 12/23] Audit return code of create_proc_*
Message-Id: <20050707154611.876940000@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============49374077460469157=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============49374077460469157==
Content-Disposition: inline;
	filename=proc_create_arch_sh_kernel_cpu_sh4_sq.c.diff

diff -urpNX dontdiff 2.6.13-rc1.orig/arch/sh/kernel/cpu/sh4/sq.c 2.6.13-rc1/arch/sh/kernel/cpu/sh4/sq.c
--- 2.6.13-rc1.orig/arch/sh/kernel/cpu/sh4/sq.c	2005-06-29 07:57:29.000000000 +0200
+++ 2.6.13-rc1/arch/sh/kernel/cpu/sh4/sq.c	2005-07-05 10:23:12.092613768 +0200
@@ -423,10 +423,14 @@ static struct miscdevice sq_dev = {
 
 static int __init sq_api_init(void)
 {
+	struct proc_dir_entry* ent;
 	printk(KERN_NOTICE "sq: Registering store queue API.\n");
 
 #ifdef CONFIG_PROC_FS
-	create_proc_read_entry("sq_mapping", 0, 0, sq_mapping_read_proc, 0);
+	ent = create_proc_read_entry("sq_mapping", 0, 0, 
+		sq_mapping_read_proc, 0);
+	if (!ent)
+		printk(KERN_WARNING "sq: Unable to create /proc entry.\n");
 #endif
 
 	return misc_register(&sq_dev);

--

--===============49374077460469157==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============49374077460469157==--
