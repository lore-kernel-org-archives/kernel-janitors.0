From: Amol Lad <amol@verismonetworks.com>
Date: Tue, 19 Sep 2006 10:10:59 +0000
Subject: [KJ] [PATCH 4/6] create_proc_entry error handling: kernel+fs
Message-Id: <1158659939.28299.80.camel@amol.verismonetworks.com>
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
 crypto/proc.c         |    2 ++
 fs/afs/proc.c         |   20 +++++++++++++++-----
 fs/jbd/journal.c      |    3 ++-
 fs/jffs/jffs_proc.c   |    8 ++++++--
 fs/jfs/jfs_debug.c    |    3 ++-
 fs/proc/proc_misc.c   |   11 +++++++++++
 fs/proc/proc_tty.c    |    6 +++++-
 fs/reiserfs/procfs.c  |    3 ++-
 kernel/dma.c          |    2 ++
 kernel/irq/proc.c     |    3 ++-
 kernel/kallsyms.c     |    2 ++
 kernel/lockdep_proc.c |    4 ++++
 kernel/profile.c      |    8 ++++++--
 kernel/resource.c     |    6 ++++++
 kernel/sysctl.c       |    4 +++-
 mm/swapfile.c         |    3 +++
 16 files changed, 73 insertions(+), 15 deletions(-)
---
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/crypto/proc.c linux-2.6.18-rc7/crypto/proc.c
--- linux-2.6.18-rc7-orig/crypto/proc.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc7/crypto/proc.c	2006-09-19 12:23:56.000000000 +0530
@@ -109,4 +109,6 @@ void __init crypto_init_proc(void)
 	proc = create_proc_entry("crypto", 0, NULL);
 	if (proc)
 		proc->proc_fops = &proc_crypto_ops;
+	else
+		printk(KERN_WARNING "Unable to create 'crypto' proc entry.\n");
 }
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/fs/afs/proc.c linux-2.6.18-rc7/fs/afs/proc.c
--- linux-2.6.18-rc7-orig/fs/afs/proc.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc7/fs/afs/proc.c	2006-09-18 16:38:07.000000000 +0530
@@ -147,14 +147,18 @@ int afs_proc_init(void)
 	proc_afs->owner = THIS_MODULE;
 
 	p = create_proc_entry("cells", 0, proc_afs);
-	if (!p)
+	if (!p) {
+		printk(KERN_ERR "Unable to create 'cells' proc entry.\n");
 		goto error_proc;
+	}
 	p->proc_fops = &afs_proc_cells_fops;
 	p->owner = THIS_MODULE;
 
 	p = create_proc_entry("rootcell", 0, proc_afs);
-	if (!p)
+	if (!p) {
+		printk(KERN_ERR "Unable to create 'rootcell' proc entry.\n");
 		goto error_cells;
+	}
 	p->proc_fops = &afs_proc_rootcell_fops;
 	p->owner = THIS_MODULE;
 
@@ -430,22 +434,28 @@ int afs_proc_cell_setup(struct afs_cell 
 		return -ENOMEM;
 
 	p = create_proc_entry("servers", 0, cell->proc_dir);
-	if (!p)
+	if (!p) {
+		printk(KERN_ERR "Unable to create 'servers' proc entry.\n");
 		goto error_proc;
+	}
 	p->proc_fops = &afs_proc_cell_servers_fops;
 	p->owner = THIS_MODULE;
 	p->data = cell;
 
 	p = create_proc_entry("vlservers", 0, cell->proc_dir);
-	if (!p)
+	if (!p) {
+		printk(KERN_ERR "Unable to create 'vlservers' proc entry.\n");
 		goto error_servers;
+	}
 	p->proc_fops = &afs_proc_cell_vlservers_fops;
 	p->owner = THIS_MODULE;
 	p->data = cell;
 
 	p = create_proc_entry("volumes", 0, cell->proc_dir);
-	if (!p)
+	if (!p) {
+		printk(KERN_ERR "Unable to create 'volumes' proc entry.\n");
 		goto error_vlservers;
+	}
 	p->proc_fops = &afs_proc_cell_volumes_fops;
 	p->owner = THIS_MODULE;
 	p->data = cell;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/fs/jbd/journal.c linux-2.6.18-rc7/fs/jbd/journal.c
--- linux-2.6.18-rc7-orig/fs/jbd/journal.c	2006-09-15 15:28:46.000000000 +0530
+++ linux-2.6.18-rc7/fs/jbd/journal.c	2006-09-18 16:38:49.000000000 +0530
@@ -1980,7 +1980,8 @@ static void __init create_jbd_proc_entry
 		/* Why is this so hard? */
 		proc_jbd_debug->read_proc = read_jbd_debug;
 		proc_jbd_debug->write_proc = write_jbd_debug;
-	}
+	} else
+		printk(KERN_WARNING "Unable to create '%s' proc entry.\n", JBD_PROC_NAME);
 }
 
 static void __exit remove_jbd_proc_entry(void)
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/fs/jffs/jffs_proc.c linux-2.6.18-rc7/fs/jffs/jffs_proc.c
--- linux-2.6.18-rc7-orig/fs/jffs/jffs_proc.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc7/fs/jffs/jffs_proc.c	2006-09-18 16:39:43.000000000 +0530
@@ -87,15 +87,19 @@ int jffs_register_jffs_proc_dir(int mtd,
 
 	/* Create entry for 'info' file */
 	part_info = create_proc_entry ("info", 0, part_root);
-	if (!part_info)
+	if (!part_info) {
+		printk(KERN_ERR "Unable to create 'info' proc entry.\n");
 		goto out2;
+	}
 	part_info->read_proc = jffs_proc_info_read;
 	part_info->data = (void *) c;
 
 	/* Create entry for 'layout' file */
 	part_layout = create_proc_entry ("layout", 0, part_root);
-	if (!part_layout)
+	if (!part_layout) {
+		printk(KERN_ERR "Unable to create 'layout' proc entry.\n");
 		goto out3;
+	}
 	part_layout->read_proc = jffs_proc_layout_read;
 	part_layout->data = (void *) c;
 
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/fs/jfs/jfs_debug.c linux-2.6.18-rc7/fs/jfs/jfs_debug.c
--- linux-2.6.18-rc7-orig/fs/jfs/jfs_debug.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc7/fs/jfs/jfs_debug.c	2006-09-18 16:40:31.000000000 +0530
@@ -126,7 +126,8 @@ void jfs_proc_init(void)
 		if ((p = create_proc_entry(Entries[i].name, 0, base))) {
 			p->read_proc = Entries[i].read_fn;
 			p->write_proc = Entries[i].write_fn;
-		}
+		} else
+			printk(KERN_WARNING "Unable to create '%s' proc entry.\n", Entries[i].name);
 	}
 }
 
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/fs/proc/proc_misc.c linux-2.6.18-rc7/fs/proc/proc_misc.c
--- linux-2.6.18-rc7-orig/fs/proc/proc_misc.c	2006-09-15 15:28:47.000000000 +0530
+++ linux-2.6.18-rc7/fs/proc/proc_misc.c	2006-09-18 16:44:06.000000000 +0530
@@ -650,6 +650,8 @@ void create_seq_entry(char *name, mode_t
 	entry = create_proc_entry(name, mode, NULL);
 	if (entry)
 		entry->proc_fops = f;
+	else
+		printk(KERN_WARNING "Unable to create '%s' proc entry.\n", name);
 }
 
 void __init proc_misc_init(void)
@@ -684,6 +686,9 @@ void __init proc_misc_init(void)
 	entry = create_proc_entry("kmsg", S_IRUSR, &proc_root);
 	if (entry)
 		entry->proc_fops = &proc_kmsg_operations;
+	else
+		printk(KERN_WARNING "Unable to create 'kmsg' proc entry.\n");
+
 	create_seq_entry("devices", 0, &proc_devinfo_operations);
 	create_seq_entry("cpuinfo", 0, &proc_cpuinfo_operations);
 	create_seq_entry("partitions", 0, &proc_partitions_operations);
@@ -712,15 +717,21 @@ void __init proc_misc_init(void)
 		proc_root_kcore->size  				(size_t)high_memory - PAGE_OFFSET + PAGE_SIZE;
 	}
+	else
+		printk(KERN_WARNING "Unable to create 'kcore' proc entry.\n");
 #endif
 #ifdef CONFIG_PROC_VMCORE
 	proc_vmcore = create_proc_entry("vmcore", S_IRUSR, NULL);
 	if (proc_vmcore)
 		proc_vmcore->proc_fops = &proc_vmcore_operations;
+	else
+		printk(KERN_WARNING "Unable to create 'vmcore' proc entry.\n");
 #endif
 #ifdef CONFIG_MAGIC_SYSRQ
 	entry = create_proc_entry("sysrq-trigger", S_IWUSR, NULL);
 	if (entry)
 		entry->proc_fops = &proc_sysrq_trigger_operations;
+	else
+		printk(KERN_WARNING "Unable to create 'sysrq-trigger' proc entry.\n");
 #endif
 }
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/fs/proc/proc_tty.c linux-2.6.18-rc7/fs/proc/proc_tty.c
--- linux-2.6.18-rc7-orig/fs/proc/proc_tty.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc7/fs/proc/proc_tty.c	2006-09-18 16:46:08.000000000 +0530
@@ -192,8 +192,10 @@ void proc_tty_register_driver(struct tty
 		return;
 
 	ent = create_proc_entry(driver->driver_name, 0, proc_tty_driver);
-	if (!ent)
+	if (!ent) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n", driver->driver_name);
 		return;
+	}
 	ent->read_proc = driver->read_proc;
 	ent->write_proc = driver->write_proc;
 	ent->owner = driver->owner;
@@ -239,4 +241,6 @@ void __init proc_tty_init(void)
 	entry = create_proc_entry("tty/drivers", 0, NULL);
 	if (entry)
 		entry->proc_fops = &proc_tty_drivers_operations;
+	else
+		printk(KERN_WARNING "Unable to create 'tty/drivers' proc entry.\n");
 }
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/fs/reiserfs/procfs.c linux-2.6.18-rc7/fs/reiserfs/procfs.c
--- linux-2.6.18-rc7-orig/fs/reiserfs/procfs.c	2006-09-15 15:28:47.000000000 +0530
+++ linux-2.6.18-rc7/fs/reiserfs/procfs.c	2006-09-18 16:46:54.000000000 +0530
@@ -487,7 +487,8 @@ static void add_file(struct super_block 
 	if (de) {
 		de->data = func;
 		de->proc_fops = &r_file_operations;
-	}
+	} else
+		printk(KERN_WARNING "Unable to create '%s' proc entry.\n", name);
 }
 
 int reiserfs_proc_info_init(struct super_block *sb)
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/kernel/dma.c linux-2.6.18-rc7/kernel/dma.c
--- linux-2.6.18-rc7-orig/kernel/dma.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc7/kernel/dma.c	2006-09-19 12:26:36.000000000 +0530
@@ -146,6 +146,8 @@ static int __init proc_dma_init(void)
 	e = create_proc_entry("dma", 0, NULL);
 	if (e)
 		e->proc_fops = &proc_dma_operations;
+	else
+		printk(KERN_WARNING "Unable to create 'dma' proc entry.\n");
 
 	return 0;
 }
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/kernel/irq/proc.c linux-2.6.18-rc7/kernel/irq/proc.c
--- linux-2.6.18-rc7-orig/kernel/irq/proc.c	2006-09-15 15:28:50.000000000 +0530
+++ linux-2.6.18-rc7/kernel/irq/proc.c	2006-09-19 12:26:45.000000000 +0530
@@ -139,7 +139,8 @@ void register_irq_proc(unsigned int irq)
 			entry->data = (void *)(long)irq;
 			entry->read_proc = irq_affinity_read_proc;
 			entry->write_proc = irq_affinity_write_proc;
-		}
+		} else
+			printk(KERN_WARNING "Unable to create 'smp_affinity' proc entry.\n");
 	}
 #endif
 }
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/kernel/kallsyms.c linux-2.6.18-rc7/kernel/kallsyms.c
--- linux-2.6.18-rc7-orig/kernel/kallsyms.c	2006-09-15 15:28:50.000000000 +0530
+++ linux-2.6.18-rc7/kernel/kallsyms.c	2006-09-19 12:26:41.000000000 +0530
@@ -414,6 +414,8 @@ static int __init kallsyms_init(void)
 	entry = create_proc_entry("kallsyms", 0444, NULL);
 	if (entry)
 		entry->proc_fops = &kallsyms_operations;
+	else
+		printk(KERN_WARNING "Unable to create 'kallsyms' proc entry.\n");
 	return 0;
 }
 __initcall(kallsyms_init);
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/kernel/lockdep_proc.c linux-2.6.18-rc7/kernel/lockdep_proc.c
--- linux-2.6.18-rc7-orig/kernel/lockdep_proc.c	2006-09-15 15:28:50.000000000 +0530
+++ linux-2.6.18-rc7/kernel/lockdep_proc.c	2006-09-19 12:27:00.000000000 +0530
@@ -333,10 +333,14 @@ static int __init lockdep_proc_init(void
 	entry = create_proc_entry("lockdep", S_IRUSR, NULL);
 	if (entry)
 		entry->proc_fops = &proc_lockdep_operations;
+	else
+		printk(KERN_WARNING "Unable to create 'lockdep' proc entry.\n");
 
 	entry = create_proc_entry("lockdep_stats", S_IRUSR, NULL);
 	if (entry)
 		entry->proc_fops = &proc_lockdep_stats_operations;
+	else
+		printk(KERN_WARNING "Unable to create 'lockdep_stats' proc entry.\n");
 
 	return 0;
 }
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/kernel/profile.c linux-2.6.18-rc7/kernel/profile.c
--- linux-2.6.18-rc7-orig/kernel/profile.c	2006-09-15 15:28:50.000000000 +0530
+++ linux-2.6.18-rc7/kernel/profile.c	2006-09-19 12:26:49.000000000 +0530
@@ -405,8 +405,10 @@ void create_prof_cpu_mask(struct proc_di
 	struct proc_dir_entry *entry;
 
 	/* create /proc/irq/prof_cpu_mask */
-	if (!(entry = create_proc_entry("prof_cpu_mask", 0600, root_irq_dir)))
+	if (!(entry = create_proc_entry("prof_cpu_mask", 0600, root_irq_dir))) {
+		printk(KERN_ERR "Unable to create 'prof_cpu_mask' proc entry.\n");
 		return;
+	}
 	entry->nlink = 1;
 	entry->data = (void *)&prof_cpu_mask;
 	entry->read_proc = prof_cpu_mask_read_proc;
@@ -535,8 +537,10 @@ static int __init create_proc_profile(vo
 		return 0;
 	if (create_hash_tables())
 		return -1;
-	if (!(entry = create_proc_entry("profile", S_IWUSR | S_IRUGO, NULL)))
+	if (!(entry = create_proc_entry("profile", S_IWUSR | S_IRUGO, NULL))) {
+		printk(KERN_ERR "Unable to create 'profile' proc entry.\n");
 		return 0;
+	}
 	entry->proc_fops = &proc_profile_operations;
 	entry->size = (1+prof_len) * sizeof(atomic_t);
 	hotcpu_notifier(profile_cpu_callback, 0);
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/kernel/resource.c linux-2.6.18-rc7/kernel/resource.c
--- linux-2.6.18-rc7-orig/kernel/resource.c	2006-09-15 15:28:50.000000000 +0530
+++ linux-2.6.18-rc7/kernel/resource.c	2006-09-19 14:04:27.000000000 +0530
@@ -136,9 +136,15 @@ static int __init ioresources_init(void)
 	entry = create_proc_entry("ioports", 0, NULL);
 	if (entry)
 		entry->proc_fops = &proc_ioports_operations;
+	else
+		printk(KERN_WARNING "Unable to create 'ioports' proc entry.\n");
+	
 	entry = create_proc_entry("iomem", 0, NULL);
 	if (entry)
 		entry->proc_fops = &proc_iomem_operations;
+	else
+		printk(KERN_WARNING "Unable to create 'iomem' proc entry.\n");
+
 	return 0;
 }
 __initcall(ioresources_init);
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/kernel/sysctl.c linux-2.6.18-rc7/kernel/sysctl.c
--- linux-2.6.18-rc7-orig/kernel/sysctl.c	2006-09-15 15:28:50.000000000 +0530
+++ linux-2.6.18-rc7/kernel/sysctl.c	2006-09-19 14:05:14.000000000 +0530
@@ -1465,8 +1465,10 @@ static void register_proc_table(ctl_tabl
 
 		if (!de) {
 			de = create_proc_entry(table->procname, mode, root);
-			if (!de)
+			if (!de) {
+				printk(KERN_WARNING "Unable to create '%s' proc entry.\n", table->procname);
 				continue;
+			}
 			de->set = set;
 			de->data = (void *) table;
 			if (table->proc_handler)
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/mm/swapfile.c linux-2.6.18-rc7/mm/swapfile.c
--- linux-2.6.18-rc7-orig/mm/swapfile.c	2006-09-15 15:28:51.000000000 +0530
+++ linux-2.6.18-rc7/mm/swapfile.c	2006-09-18 16:56:19.000000000 +0530
@@ -1351,6 +1351,9 @@ static int __init procswaps_init(void)
 	entry = create_proc_entry("swaps", 0, NULL);
 	if (entry)
 		entry->proc_fops = &proc_swaps_operations;
+	else
+		printk(KERN_WARNING "Unable to create 'swaps' proc entry.\n");
+	
 	return 0;
 }
 __initcall(procswaps_init);


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
