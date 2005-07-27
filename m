From: Christophe Lucas <clucas@rotomalug.org>
Date: Wed, 27 Jul 2005 13:01:15 +0000
Subject: [KJ] [PATCH][RFC] procfs_failure && possible uses
Message-Id: <20050727130115.GE5089@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============38884364872248156=="
List-Id: <kernel-janitors.vger.kernel.org>
To: akpm@osdl.org, linux-kernel@vger.kernel.org
Cc: kernel-janitors@lists.osdl.org, domen@coderock.org, wharms@bfs.de

--===============38884364872248156==
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii

description:
audit return code of create_proc_* function is a entry in janitors
TODO list. Audit this return and printk() when it fails, spams log of
system without compiled proc support. So this patch can correct it.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


 arch/arm/kernel/apm.c   |    7 ++++---
 arch/arm/kernel/ecard.c |   12 ++++++++++--
 include/linux/proc_fs.h |    5 +++++
 3 files changed, 19 insertions(+), 5 deletions(-)

Index: linux-2.6.13-rc3-mm2/include/linux/proc_fs.h
===================================================================
--- linux-2.6.13-rc3-mm2.orig/include/linux/proc_fs.h
+++ linux-2.6.13-rc3-mm2/include/linux/proc_fs.h
@@ -83,6 +83,9 @@ struct vmcore {
 
 #ifdef CONFIG_PROC_FS
 
+#define procfs_failure(fmt,arg...) \
+	printk(KERN_WARNING fmt,##arg)
+
 extern struct proc_dir_entry proc_root;
 extern struct proc_dir_entry *proc_root_fs;
 extern struct proc_dir_entry *proc_net;
@@ -198,6 +201,8 @@ static inline void proc_net_remove(const
 
 #else
 
+#define procfs_failure(fmt,arg...) do { } while(0)
+
 #define proc_root_driver NULL
 #define proc_net NULL
 #define proc_bus NULL
Index: linux-2.6.13-rc3-mm2/arch/arm/kernel/ecard.c
===================================================================
--- linux-2.6.13-rc3-mm2.orig/arch/arm/kernel/ecard.c
+++ linux-2.6.13-rc3-mm2/arch/arm/kernel/ecard.c
@@ -776,9 +776,17 @@ static struct proc_dir_entry *proc_bus_e
 
 static void ecard_proc_init(void)
 {
+	struct proc_dir_entry *proc_entry;
+
 	proc_bus_ecard_dir = proc_mkdir("ecard", proc_bus);
-	create_proc_info_entry("devices", 0, proc_bus_ecard_dir,
-		get_ecard_dev_info);
+	if (!proc_bus_ecard_dir)
+		procfs_failure("ecard: Unable to create proc dir entry.\n");
+	else {
+		proc_entry = create_proc_info_entry("devices", 0, 
+				proc_bus_ecard_dir, get_ecard_dev_info);
+		if (!proc_entry)
+			procfs_failure("ecard: Unable to create proc entry.\n");
+	}
 }
 
 #define ec_set_resource(ec,nr,st,sz)				\
Index: linux-2.6.13-rc3-mm2/arch/arm/kernel/apm.c
===================================================================
--- linux-2.6.13-rc3-mm2.orig/arch/arm/kernel/apm.c
+++ linux-2.6.13-rc3-mm2/arch/arm/kernel/apm.c
@@ -515,6 +515,7 @@ static int kapmd(void *arg)
 static int __init apm_init(void)
 {
 	int ret;
+	struct proc_dir_entry *proc_entry;
 
 	if (apm_disabled) {
 		printk(KERN_NOTICE "apm: disabled on user request.\n");
@@ -534,9 +535,9 @@ static int __init apm_init(void)
 		return ret;
 	}
 
-#ifdef CONFIG_PROC_FS
-	create_proc_info_entry("apm", 0, NULL, apm_get_info);
-#endif
+	proc_entry = create_proc_info_entry("apm", 0, NULL, apm_get_info);
+	if (!proc_entry)
+		procfs_failure("apm: Unable to create apm proc entry.\n");
 
 	ret = misc_register(&apm_device);
 	if (ret != 0) {

--===============38884364872248156==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============38884364872248156==--
