From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 08 Jul 2005 13:37:31 +0000
Subject: [KJ] [patch 2.6.13-rc1 16/23][RESEND] Audit return code of
Message-Id: <20050708133731.GX4683@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============038237212078465532=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============038237212078465532==
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii

Description:
Audit return of create_proc_* functions.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


Index: 2.6.13-rc1/arch/sh64/kernel/process.c
===================================================================
--- 2.6.13-rc1.orig/arch/sh64/kernel/process.c
+++ 2.6.13-rc1/arch/sh64/kernel/process.c
@@ -953,7 +953,11 @@ asids_proc_info(char *buf, char **start,
 
 static int __init register_proc_asids(void)
 {
-  create_proc_read_entry("asids", 0, NULL, asids_proc_info, NULL);
+	struct proc_dir_entry *ent;
+	ent = create_proc_read_entry("asids", 0, NULL, asids_proc_info, NULL);
+	if (!ent)
+		printk(KERN_WARNING 
+			"process: Unable to create asids /proc entry.\n");
   return 0;
 }
 

--===============038237212078465532==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============038237212078465532==--
