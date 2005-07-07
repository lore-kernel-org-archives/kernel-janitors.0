From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 07 Jul 2005 15:44:55 +0000
Subject: [KJ] [patch 2.6.13-rc1 21/23] Audit return code of create_proc_*
Message-Id: <20050707154659.756815000@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============19545804134868261=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============19545804134868261==
Content-Disposition: inline; filename=proc_create_arch_arm_kernel_ecard.c.diff

diff -urpNX dontdiff 2.6.13-rc1.orig/arch/arm/kernel/ecard.c 2.6.13-rc1/arch/arm/kernel/ecard.c
--- 2.6.13-rc1.orig/arch/arm/kernel/ecard.c	2005-06-29 07:57:29.000000000 +0200
+++ 2.6.13-rc1/arch/arm/kernel/ecard.c	2005-07-05 09:22:13.000000000 +0200
@@ -776,9 +776,16 @@ static struct proc_dir_entry *proc_bus_e
 
 static void ecard_proc_init(void)
 {
+	struct proc_dir_entry* proc_entry;
+
 	proc_bus_ecard_dir = proc_mkdir("ecard", proc_bus);
-	create_proc_info_entry("devices", 0, proc_bus_ecard_dir,
+	if (proc_bus_ecard_dir == NULL)
+		printk(KERN_WARNING 
+			"ecard: Unable to create proc dir entry.\n");
+	proc_entry = create_proc_info_entry("devices", 0, proc_bus_ecard_dir,
 		get_ecard_dev_info);
+	if (proc_entry == NULL) 
+		printk(KERN_WARNING "ecard: Unable to create proc entry.\n");
 }
 
 #define ec_set_resource(ec,nr,st,sz)				\

--

--===============19545804134868261==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============19545804134868261==--
