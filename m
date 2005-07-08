From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 08 Jul 2005 10:24:28 +0000
Subject: [KJ] [patch 2.6.13-rc1 05/23][RESEND] Audit return code of
Message-Id: <20050708102428.GN4683@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============20951206161716129=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============20951206161716129==
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii

Description:
Audit return of create_proc_* functions.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

Index: 2.6.13-rc1/drivers/block/cpqarray.c
===================================================================
--- 2.6.13-rc1.orig/drivers/block/cpqarray.c
+++ 2.6.13-rc1/drivers/block/cpqarray.c
@@ -213,13 +213,18 @@ static struct proc_dir_entry *proc_array
  */
 static void __init ida_procinit(int i)
 {
+	struct proc_dir_entry *ent;
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

--===============20951206161716129==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============20951206161716129==--
