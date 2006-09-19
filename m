From: Amol Lad <amol@verismonetworks.com>
Date: Tue, 19 Sep 2006 10:14:34 +0000
Subject: [KJ] [PATCH 6/6] create_proc_entry error handling: sound
Message-Id: <1158660154.28299.86.camel@amol.verismonetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Added appropriate KERN_ERR/KERN_WARNING messages whenever
create_proc_entry fails.

Tested using allmodconfig configuration and also by changing
Makefiles/Kconfig to make sure all files are compiled

Signed-off-by: Amol Lad <amol@verismonetworks.com>
---
 include/linux/utsrelease.h |    1 +
 ipc/util.c                 |    1 +
 sound/core/info.c          |    7 ++++++-
 sound/core/memalloc.c      |    3 ++-
 sound/oss/trident.c        |    3 ++-
 5 files changed, 12 insertions(+), 3 deletions(-)
---
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/ipc/util.c linux-2.6.18-rc7/ipc/util.c
--- linux-2.6.18-rc7-orig/ipc/util.c	2006-09-15 15:28:50.000000000 +0530
+++ linux-2.6.18-rc7/ipc/util.c	2006-09-18 16:47:36.000000000 +0530
@@ -131,6 +131,7 @@ void __init ipc_init_proc_interface(cons
 		pde->data = iface;
 		pde->proc_fops = &sysvipc_proc_fops;
 	} else {
+		printk(KERN_WARNING "Unable to create '%s' proc entry.\n", path);
 		kfree(iface);
 	}
 }
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/sound/core/info.c linux-2.6.18-rc7/sound/core/info.c
--- linux-2.6.18-rc7-orig/sound/core/info.c	2006-09-15 15:28:53.000000000 +0530
+++ linux-2.6.18-rc7/sound/core/info.c	2006-09-19 10:59:19.000000000 +0530
@@ -534,6 +534,9 @@ static struct proc_dir_entry *snd_create
 	p = create_proc_entry(name, mode, parent);
 	if (p)
 		snd_info_entry_prepare(p);
+	else
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n", name);
+
 	return p;
 }
 
@@ -542,8 +545,10 @@ int __init snd_info_init(void)
 	struct proc_dir_entry *p;
 
 	p = snd_create_proc_entry("asound", S_IFDIR | S_IRUGO | S_IXUGO, &proc_root);
-	if (p = NULL)
+	if (p = NULL) {
+		printk(KERN_ERR "Unable to create 'asound' proc entry.\n");
 		return -ENOMEM;
+	}
 	snd_proc_root = p;
 #ifdef CONFIG_SND_OSSEMUL
 	{
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/sound/core/memalloc.c linux-2.6.18-rc7/sound/core/memalloc.c
--- linux-2.6.18-rc7-orig/sound/core/memalloc.c	2006-09-15 15:28:53.000000000 +0530
+++ linux-2.6.18-rc7/sound/core/memalloc.c	2006-09-19 11:00:01.000000000 +0530
@@ -618,7 +618,8 @@ static int __init snd_mem_init(void)
 #ifdef CONFIG_PCI
 		snd_mem_proc->write_proc = snd_mem_proc_write;
 #endif
-	}
+	} else
+		printk(KERN_WARNING "Unable to create '%s' proc entry.\n", SND_MEM_PROC_FILE);
 #endif
 	return 0;
 }
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/sound/oss/trident.c linux-2.6.18-rc7/sound/oss/trident.c
--- linux-2.6.18-rc7-orig/sound/oss/trident.c	2006-09-15 15:28:53.000000000 +0530
+++ linux-2.6.18-rc7/sound/oss/trident.c	2006-09-19 11:00:59.000000000 +0530
@@ -4436,7 +4436,8 @@ trident_probe(struct pci_dev *pci_dev, c
 			if (res) {
 				res->write_proc = ali_write_proc;
 				res->data = card;
-			}
+			} else
+				printk(KERN_WARNING "Unable to create 'ALi5451' proc entry.\n");
 		}
 
 		/* Add H/W Volume Control By Matt Wu Jul. 06, 2001 */
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/include/linux/utsrelease.h linux-2.6.18-rc7/include/linux/utsrelease.h
--- linux-2.6.18-rc7-orig/include/linux/utsrelease.h	1970-01-01 05:30:00.000000000 +0530
+++ linux-2.6.18-rc7/include/linux/utsrelease.h	2006-09-15 16:14:01.000000000 +0530
@@ -0,0 +1 @@
+#define UTS_RELEASE "2.6.18-rc7"


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
