From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 08 Jul 2005 13:32:10 +0000
Subject: [KJ] [patch 2.6.13-rc1 14/23][RESEND] Audit return code of
Message-Id: <20050708133210.GV4683@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============60087414400408767=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============60087414400408767==
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii

Description:
Audit return of create_proc_* functions.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


Index: 2.6.13-rc1/arch/sh64/mm/ioremap.c
===================================================================
--- 2.6.13-rc1.orig/arch/sh64/mm/ioremap.c
+++ 2.6.13-rc1/arch/sh64/mm/ioremap.c
@@ -461,7 +461,11 @@ ioremap_proc_info(char *buf, char **star
 static int __init register_proc_onchip(void)
 {
 #ifdef CONFIG_PROC_FS
-	create_proc_read_entry("io_map",0,0, ioremap_proc_info, &shmedia_iomap);
+	struct proc_dir_entry *ent;
+	ent = create_proc_read_entry("io_map",0,0, 
+		ioremap_proc_info, &shmedia_iomap);
+	if (!ent)
+		printk(KERN_WARNING "ioremap.c: Unable to create /proc entry.\n");
 #endif
 	return 0;
 }

--===============60087414400408767==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============60087414400408767==--
