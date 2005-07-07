From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 07 Jul 2005 15:44:54 +0000
Subject: [KJ] [patch 2.6.13-rc1 20/23] Audit return code of create_proc_*
Message-Id: <20050707154654.405158000@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============89560889646362418=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============89560889646362418==
Content-Disposition: inline; filename=proc_create_arch_arm_mach-omap_pm.c.diff

diff -urpNX dontdiff 2.6.13-rc1.orig/arch/arm/mach-omap/pm.c 2.6.13-rc1/arch/arm/mach-omap/pm.c
--- 2.6.13-rc1.orig/arch/arm/mach-omap/pm.c	2005-06-29 07:57:29.000000000 +0200
+++ 2.6.13-rc1/arch/arm/mach-omap/pm.c	2005-07-05 10:07:38.000000000 +0200
@@ -504,6 +504,8 @@ static void omap_pm_init_proc(void)
 	entry = create_proc_read_entry("driver/omap_pm",
 				       S_IWUSR | S_IRUGO, NULL,
 				       omap_pm_read_proc, 0);
+	if (entry == NULL)
+		printk(KERN_WARNING "omap_pm: Unable to create proc entry.\n");
 }
 
 #endif /* DEBUG && CONFIG_PROC_FS */

--

--===============89560889646362418==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============89560889646362418==--
