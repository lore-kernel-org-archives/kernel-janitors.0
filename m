From: Christophe Lucas <clucas@rotomalug.org>
Date: Tue, 12 Jul 2005 12:11:32 +0000
Subject: [KJ] [patch 2.6.13-rc1 23/23][RESEND] Audit return code of
Message-Id: <20050712121132.GH4712@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0023424723635558919=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============0023424723635558919==
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii

Description:
Audit return of create_proc_* functions.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

Index: 2.6.13-rc1/arch/arm26/kernel/ecard.c
===================================================================
--- 2.6.13-rc1.orig/arch/arm26/kernel/ecard.c
+++ 2.6.13-rc1/arch/arm26/kernel/ecard.c
@@ -522,9 +522,16 @@ static struct proc_dir_entry *proc_bus_e
 
 static void ecard_proc_init(void)
 {
+	struct proc_dir_entry *proc_entry;
 	proc_bus_ecard_dir = proc_mkdir("ecard", proc_bus);
-	create_proc_info_entry("devices", 0, proc_bus_ecard_dir,
-		get_ecard_dev_info);
+	if (!proc_bus_ecard_dir)
+		printk(KERN_WARNING "Unable to create proc dir entry.\n");
+	else {
+		proc_entry = create_proc_info_entry("devices", 0,
+			proc_bus_ecard_dir, get_ecard_dev_info);
+		if (!proc_entry)
+			printk(KERN_WARNING "ecard: Unable to create proc entry\n");
+	}
 }
 
 #define ec_set_resource(ec,nr,st,sz,flg)			\

--===============0023424723635558919==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0023424723635558919==--
