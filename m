From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 07 Jul 2005 15:44:39 +0000
Subject: [KJ] [patch 2.6.13-rc1 05/23] Audit return code of create_proc_*
Message-Id: <20050707154534.740994000@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============1392691434110751=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============1392691434110751==
Content-Disposition: inline; filename=proc_create_drivers_block_cpqarray.c.diff

diff -urpNX dontdiff 2.6.13-rc1.orig/drivers/block/cpqarray.c 2.6.13-rc1/drivers/block/cpqarray.c
--- 2.6.13-rc1.orig/drivers/block/cpqarray.c	2005-06-29 07:57:29.000000000 +0200
+++ 2.6.13-rc1/drivers/block/cpqarray.c	2005-07-05 10:38:04.134002864 +0200
@@ -213,13 +213,18 @@ static struct proc_dir_entry *proc_array
  */
 static void __init ida_procinit(int i)
 {
+	struct proc_dir_entry* ent;
+	
 	if (proc_array == NULL) {
 		proc_array = proc_mkdir("cpqarray", proc_root_driver);
 		if (!proc_array) return;
 	}
 
-	create_proc_read_entry(hba[i]->devname, 0, proc_array,
+	ent = create_proc_read_entry(hba[i]->devname, 0, proc_array,
 			       ida_proc_get_info, hba[i]);
+	if (!ent)
+		printk(KERN_WARNING 
+			"cpqarray: Unable to create /proc entry.\n");
 }
 
 /*

--

--===============1392691434110751==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============1392691434110751==--
