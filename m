From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 04 Aug 2005 15:36:13 +0000
Subject: [KJ] [PATCH] sh64 (mm/ioremap.c): procfs_failure && create_proc*
Message-Id: <20050804153613.GC25500@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============2283156580075516=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050727130115.GE5089@rhum.iomeda.fr>
In-Reply-To: <20050727130115.GE5089@rhum.iomeda.fr>
To: akpm@osdl.org, kernel-janitors@lists.osdl.org
Cc: domen@coderock.org, linux-kernel@vger.kernel.org

--===============2283156580075516==
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii

description:
audit return code of create_proc_* function is a entry in janitors
TODO list. Audit this return and printk() when it fails, can spam a lot
system without compiled proc support. So this patch can audit return
code by means of procfs_failure().

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

diff -urpNX dontdiff linux-2.6.13-rc4-mm1.orig/arch/sh64/mm/ioremap.c linux-2.6.13-rc4-mm1/arch/sh64/mm/ioremap.c
--- linux-2.6.13-rc4-mm1.orig/arch/sh64/mm/ioremap.c	2005-07-29 00:44:44.000000000 +0200
+++ linux-2.6.13-rc4-mm1/arch/sh64/mm/ioremap.c	2005-08-03 12:41:14.000000000 +0200
@@ -460,9 +460,11 @@ ioremap_proc_info(char *buf, char **star
 
 static int __init register_proc_onchip(void)
 {
-#ifdef CONFIG_PROC_FS
-	create_proc_read_entry("io_map",0,0, ioremap_proc_info, &shmedia_iomap);
-#endif
+	struct proc_dir_entry* ent;
+	ent = create_proc_read_entry("io_map",0,0, 
+		ioremap_proc_info, &shmedia_iomap);
+	if (!ent)
+		procfs_failure("ioremap.c: Unable to create /proc entry.\n");
 	return 0;
 }
 

--===============2283156580075516==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============2283156580075516==--
