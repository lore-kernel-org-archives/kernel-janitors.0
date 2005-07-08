From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 08 Jul 2005 13:26:08 +0000
Subject: [KJ] [patch 2.6.13-rc1 11/23][RESEND] Audit return code of
Message-Id: <20050708132607.GS4683@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============8290201508305266=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============8290201508305266==
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii

Description:
Audit return of create_proc_* functions.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

Index: 2.6.13-rc1/arch/sparc/kernel/ioport.c
===================================================================
--- 2.6.13-rc1.orig/arch/sparc/kernel/ioport.c
+++ 2.6.13-rc1/arch/sparc/kernel/ioport.c
@@ -725,7 +725,16 @@ _sparc_find_resource(struct resource *ro
 void register_proc_sparc_ioport(void)
 {
 #ifdef CONFIG_PROC_FS
-	create_proc_read_entry("io_map",0,NULL,_sparc_io_get_info,&sparc_iomap);
-	create_proc_read_entry("dvma_map",0,NULL,_sparc_io_get_info,&_sparc_dvma);
+	struct proc_dir_entry *ent;
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

--===============8290201508305266==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============8290201508305266==--
