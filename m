From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 07 Jul 2005 15:44:56 +0000
Subject: [KJ] [patch 2.6.13-rc1 22/23] Audit return code of create_proc_*
Message-Id: <20050707154705.302486000@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============88726332572640931=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============88726332572640931==
Content-Disposition: inline; filename=proc_create_arch_arm_kernel_apm.c.diff

diff -urpNX dontdiff 2.6.13-rc1.orig/arch/arm/kernel/apm.c 2.6.13-rc1/arch/arm/kernel/apm.c
--- 2.6.13-rc1.orig/arch/arm/kernel/apm.c	2005-06-29 07:57:29.000000000 +0200
+++ 2.6.13-rc1/arch/arm/kernel/apm.c	2005-07-05 09:19:06.000000000 +0200
@@ -514,6 +514,7 @@ static int kapmd(void *arg)
 
 static int __init apm_init(void)
 {
+	struct proc_dir_entry *proc_entry;
 	int ret;
 
 	if (apm_disabled) {
@@ -535,7 +536,9 @@ static int __init apm_init(void)
 	}
 
 #ifdef CONFIG_PROC_FS
-	create_proc_info_entry("apm", 0, NULL, apm_get_info);
+	proc_entry = create_proc_info_entry("apm", 0, NULL, apm_get_info);
+	if (proc_entry == NULL) 
+		printk(KERN_WARNING "apm: Unable to create apm proc entry.\n");
 #endif
 
 	ret = misc_register(&apm_device);

--

--===============88726332572640931==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============88726332572640931==--
