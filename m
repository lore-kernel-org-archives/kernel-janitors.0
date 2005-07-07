From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 07 Jul 2005 15:44:48 +0000
Subject: [KJ] [patch 2.6.13-rc1 14/23] Audit return code of create_proc_*
Message-Id: <20050707154622.451471000@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============67588567360565799=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============67588567360565799==
Content-Disposition: inline; filename=proc_create_arch_sh64_mm_ioremap.c.diff

diff -urpNX dontdiff 2.6.13-rc1.orig/arch/sh64/mm/ioremap.c 2.6.13-rc1/arch/sh64/mm/ioremap.c
--- 2.6.13-rc1.orig/arch/sh64/mm/ioremap.c	2005-06-29 07:57:29.000000000 +0200
+++ 2.6.13-rc1/arch/sh64/mm/ioremap.c	2005-07-05 10:27:41.902596416 +0200
@@ -461,7 +461,11 @@ ioremap_proc_info(char *buf, char **star
 static int __init register_proc_onchip(void)
 {
 #ifdef CONFIG_PROC_FS
-	create_proc_read_entry("io_map",0,0, ioremap_proc_info, &shmedia_iomap);
+	struct proc_dir_entry* ent;
+	ent = create_proc_read_entry("io_map",0,0, 
+		ioremap_proc_info, &shmedia_iomap);
+	if (!ent)
+		printk(KERN_WARNING "ioremap.c: Unable to create /proc entry.\n");
 #endif
 	return 0;
 }

--

--===============67588567360565799==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============67588567360565799==--
