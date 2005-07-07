From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 07 Jul 2005 15:44:51 +0000
Subject: [KJ] [patch 2.6.13-rc1 17/23] Audit return code of create_proc_*
Message-Id: <20050707154638.321093000@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============095611250243087476=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============095611250243087476==
Content-Disposition: inline;
	filename=proc_create_arch_ppc_platforms_residual.c.diff

diff -urpNX dontdiff 2.6.13-rc1.orig/arch/ppc/platforms/residual.c 2.6.13-rc1/arch/ppc/platforms/residual.c
--- 2.6.13-rc1.orig/arch/ppc/platforms/residual.c	2005-06-29 07:57:29.000000000 +0200
+++ 2.6.13-rc1/arch/ppc/platforms/residual.c	2005-07-05 10:18:36.331535824 +0200
@@ -1024,9 +1024,13 @@ static int proc_prep_residual_read(char 
 int __init
 proc_prep_residual_init(void)
 {
+	struct proc_dir_entry* ent;
 	if (have_residual_data)
-		create_proc_read_entry("residual", S_IRUGO, NULL,
+		ent = create_proc_read_entry("residual", S_IRUGO, NULL,
 					proc_prep_residual_read, NULL);
+		if (!ent)
+			printk(KERN_WARNING 
+				"residual: Unable to create /proc entry.\n");
 	return 0;
 }
 

--

--===============095611250243087476==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============095611250243087476==--
