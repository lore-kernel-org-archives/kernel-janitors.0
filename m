From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 07 Jul 2005 15:44:38 +0000
Subject: [KJ] [patch 2.6.13-rc1 04/23] Audit return code of create_proc_*
Message-Id: <20050707154529.530072000@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============31540628104181456=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============31540628104181456==
Content-Disposition: inline; filename=proc_create_drivers_mca_mca-proc.c.diff

diff -urpNX dontdiff 2.6.13-rc1.orig/drivers/mca/mca-proc.c 2.6.13-rc1/drivers/mca/mca-proc.c
--- 2.6.13-rc1.orig/drivers/mca/mca-proc.c	2005-06-29 07:57:29.000000000 +0200
+++ 2.6.13-rc1/drivers/mca/mca-proc.c	2005-07-05 10:45:49.613239264 +0200
@@ -184,8 +184,14 @@ void __init mca_do_proc_init(void)
 	struct mca_device *mca_dev;
 
 	proc_mca = proc_mkdir("mca", &proc_root);
-	create_proc_read_entry("pos",0,proc_mca,get_mca_info,NULL);
-	create_proc_read_entry("machine",0,proc_mca,get_mca_machine_info,NULL);
+	node = create_proc_read_entry("pos",0,proc_mca,get_mca_info,NULL);
+	if (!node)
+		printk(KERN_WARNING "MCA: Unable to create mca /proc entry.\n");
+	node = create_proc_read_entry("machine",0,proc_mca,
+		get_mca_machine_info,NULL);
+	if (!node)
+		printk(KERN_WARNING 
+			"MCA: Unable to create machine /proc entry.\n");
 
 	/* Initialize /proc/mca entries for existing adapters */
 
@@ -211,7 +217,8 @@ void __init mca_do_proc_init(void)
 					      mca_read_proc, (void *)mca_dev);
 
 		if(node == NULL) {
-			printk("Failed to allocate memory for MCA proc-entries!");
+			printk(KERN_WARNING 
+				"Failed to allocate memory for MCA proc-entries!");
 			return;
 		}
 	}

--

--===============31540628104181456==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============31540628104181456==--
