From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 07 Jul 2005 15:44:45 +0000
Subject: [KJ] [patch 2.6.13-rc1 11/23] Audit return code of create_proc_*
Message-Id: <20050707154606.555727000@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============3678030812186166=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============3678030812186166==
Content-Disposition: inline;
	filename=proc_create_arch_sparc_kernel_ioport.c.diff

diff -urpNX dontdiff 2.6.13-rc1.orig/arch/sparc/kernel/ioport.c 2.6.13-rc1/arch/sparc/kernel/ioport.c
--- 2.6.13-rc1.orig/arch/sparc/kernel/ioport.c	2005-06-29 07:57:29.000000000 +0200
+++ 2.6.13-rc1/arch/sparc/kernel/ioport.c	2005-07-05 10:31:15.663099880 +0200
@@ -725,7 +725,16 @@ _sparc_find_resource(struct resource *ro
 void register_proc_sparc_ioport(void)
 {
 #ifdef CONFIG_PROC_FS
-	create_proc_read_entry("io_map",0,NULL,_sparc_io_get_info,&sparc_iomap);
-	create_proc_read_entry("dvma_map",0,NULL,_sparc_io_get_info,&_sparc_dvma);
+	struct proc_dir_entry* ent;
+	ent = create_proc_read_entry("io_map",0,NULL,
+		_sparc_io_get_info,&sparc_iomap);
+	if (!ent)
+		printk(KERN_WARNING 
+			"ioport.c: Unable to create io_map /proc entry.\n");
+	ent = create_proc_read_entry("dvma_map",0,NULL,
+		_sparc_io_get_info,&_sparc_dvma);
+	if (!ent)
+		printk(KERN_WARNING 
+			"ioport.c: Unable to create dvma_map /proc entry.\n");
 #endif
 }

--

--===============3678030812186166==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============3678030812186166==--
