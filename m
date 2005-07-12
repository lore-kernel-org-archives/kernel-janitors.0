From: Christophe Lucas <clucas@rotomalug.org>
Date: Tue, 12 Jul 2005 16:57:11 +0000
Subject: [KJ] [patch 2.6.13-rc1 21/23][RESEND] Audit return code of
Message-Id: <20050712165711.GM4712@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============079907626694005529=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050712120758.GG4712@rhum.iomeda.fr>
In-Reply-To: <20050712120758.GG4712@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============079907626694005529==
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii

Description:
Audit return of create_proc_* functions.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

Index: 2.6.13-rc1/arch/arm/kernel/ecard.c
===================================================================
--- 2.6.13-rc1.orig/arch/arm/kernel/ecard.c
+++ 2.6.13-rc1/arch/arm/kernel/ecard.c
@@ -776,9 +776,19 @@ static struct proc_dir_entry *proc_bus_e
 
 static void ecard_proc_init(void)
 {
+	struct proc_dir_entry *proc_entry;
+
 	proc_bus_ecard_dir = proc_mkdir("ecard", proc_bus);
-	create_proc_info_entry("devices", 0, proc_bus_ecard_dir,
-		get_ecard_dev_info);
+	if (proc_bus_ecard_dir == NULL)
+		printk(KERN_WARNING 
+			"ecard: Unable to create proc dir entry.\n");
+	else {
+		proc_entry = create_proc_info_entry("devices", 0, 
+			proc_bus_ecard_dir, get_ecard_dev_info);
+		if (proc_entry == NULL) 
+			printk(KERN_WARNING 
+				"ecard: Unable to create proc entry.\n");
+	}
 }
 
 #define ec_set_resource(ec,nr,st,sz)				\

--===============079907626694005529==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============079907626694005529==--
