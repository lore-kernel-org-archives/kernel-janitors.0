From: Amol Lad <amol@verismonetworks.com>
Date: Tue, 19 Sep 2006 10:06:49 +0000
Subject: [KJ] [PATCH 1/6] create_proc_entry error handling: arch
Message-Id: <1158659689.28299.73.camel@amol.verismonetworks.com>
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
 alpha/kernel/srm_env.c                    |    8 ++++++--
 arm/mm/alignment.c                        |    4 +++-
 cris/arch-v10/kernel/fasttimer.c          |    2 ++
 cris/arch-v32/kernel/fasttimer.c          |    2 ++
 cris/kernel/profile.c                     |    4 +++-
 frv/kernel/irq.c                          |    6 ++++--
 h8300/kernel/gpio.c                       |    2 ++
 i386/kernel/cpu/mtrr/if.c                 |    4 +++-
 ia64/hp/common/sba_iommu.c                |    2 ++
 ia64/kernel/salinfo.c                     |    8 ++++++--
 ia64/sn/kernel/sn2/sn_proc_fs.c           |    3 ++-
 mips/lasat/picvue_proc.c                  |    8 ++++++--
 mips/tx4938/toshiba_rbtx4938/spi_eeprom.c |    3 ++-
 powerpc/kernel/proc_ppc64.c               |    4 +++-
 powerpc/kernel/rtas-proc.c                |   14 ++++++++++++++
 powerpc/kernel/rtas_flash.c               |    3 ++-
 powerpc/platforms/iseries/lpevents.c      |    2 ++
 powerpc/platforms/iseries/mf.c            |   16 ++++++++++++----
 powerpc/platforms/iseries/proc.c          |    2 ++
 powerpc/platforms/iseries/viopath.c       |    2 ++
 powerpc/platforms/pseries/eeh.c           |    2 ++
 powerpc/platforms/pseries/reconfig.c      |    3 ++-
 sparc/kernel/led.c                        |    4 +++-
 um/drivers/ubd_kern.c                     |    5 ++++-
 24 files changed, 91 insertions(+), 22 deletions(-)
---
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/arch/alpha/kernel/srm_env.c linux-2.6.18-rc7/arch/alpha/kernel/srm_env.c
--- linux-2.6.18-rc7-orig/arch/alpha/kernel/srm_env.c	2006-09-15 15:28:35.000000000 +0530
+++ linux-2.6.18-rc7/arch/alpha/kernel/srm_env.c	2006-09-15 16:40:12.000000000 +0530
@@ -277,8 +277,10 @@ srm_env_init(void)
 	while(entry->name != NULL && entry->id != 0) {
 		entry->proc_entry = create_proc_entry(entry->name,
 				0644, named_dir);
-		if(entry->proc_entry = NULL)
+		if(entry->proc_entry = NULL) {
+			printk(KERN_ERR "Unable to create '%s' proc entry.\n", entry->name);
 			goto cleanup;
+		}
 
 		entry->proc_entry->data		= (void *) entry;
 		entry->proc_entry->owner	= THIS_MODULE;
@@ -297,8 +299,10 @@ srm_env_init(void)
 
 		entry->proc_entry = create_proc_entry(entry->name,
 				0644, numbered_dir);
-		if(entry->proc_entry = NULL)
+		if(entry->proc_entry = NULL) {
+			printk(KERN_ERR "Unable to create '%s' proc entry.\n", entry->name);
 			goto cleanup;
+		}
 
 		entry->id			= var_num;
 		entry->proc_entry->data		= (void *) entry;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/arch/arm/mm/alignment.c linux-2.6.18-rc7/arch/arm/mm/alignment.c
--- linux-2.6.18-rc7-orig/arch/arm/mm/alignment.c	2006-09-15 15:28:35.000000000 +0530
+++ linux-2.6.18-rc7/arch/arm/mm/alignment.c	2006-09-15 16:42:03.000000000 +0530
@@ -790,8 +790,10 @@ static int __init alignment_init(void)
 		return -ENOMEM;
 
 	res = create_proc_entry("alignment", S_IWUSR | S_IRUGO, res);
-	if (!res)
+	if (!res) {
+		printk(KERN_ERR "Unable to create 'alignment' proc entry.\n");
 		return -ENOMEM;
+	}
 
 	res->read_proc = proc_alignment_read;
 	res->write_proc = proc_alignment_write;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/arch/cris/arch-v10/kernel/fasttimer.c linux-2.6.18-rc7/arch/cris/arch-v10/kernel/fasttimer.c
--- linux-2.6.18-rc7-orig/arch/cris/arch-v10/kernel/fasttimer.c	2006-09-15 15:28:35.000000000 +0530
+++ linux-2.6.18-rc7/arch/cris/arch-v10/kernel/fasttimer.c	2006-09-15 16:34:12.000000000 +0530
@@ -963,6 +963,8 @@ void fast_timer_init(void)
 #ifdef CONFIG_PROC_FS
    if ((fasttimer_proc_entry = create_proc_entry( "fasttimer", 0, 0 )))
      fasttimer_proc_entry->read_proc = proc_fasttimer_read;
+   else
+     printk(KERN_WARNING "Unable to create 'fasttimer' proc entry.\n");    
 #endif /* PROC_FS */
     if(request_irq(TIMER1_IRQ_NBR, timer1_handler, 0,
                    "fast timer int", NULL))
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/arch/cris/arch-v32/kernel/fasttimer.c linux-2.6.18-rc7/arch/cris/arch-v32/kernel/fasttimer.c
--- linux-2.6.18-rc7-orig/arch/cris/arch-v32/kernel/fasttimer.c	2006-09-15 15:28:35.000000000 +0530
+++ linux-2.6.18-rc7/arch/cris/arch-v32/kernel/fasttimer.c	2006-09-15 16:35:11.000000000 +0530
@@ -977,6 +977,8 @@ void fast_timer_init(void)
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,2,0)
    if ((fasttimer_proc_entry = create_proc_entry( "fasttimer", 0, 0 )))
      fasttimer_proc_entry->read_proc = proc_fasttimer_read;
+   else
+     printk(KERN_WARNING "Unable to create 'fasttimer' proc entry.\n");
 #else
     proc_register_dynamic(&proc_root, &fasttimer_proc_entry);
 #endif
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/arch/cris/kernel/profile.c linux-2.6.18-rc7/arch/cris/kernel/profile.c
--- linux-2.6.18-rc7-orig/arch/cris/kernel/profile.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc7/arch/cris/kernel/profile.c	2006-09-15 17:47:59.000000000 +0530
@@ -65,7 +65,9 @@ __init init_cris_profile(void)
   if (entry) {
     entry->proc_fops = &cris_proc_profile_operations;
     entry->size = SAMPLE_BUFFER_SIZE;
-  }
+  } else 
+    printk(KERN_WARNING "Unable to create 'system_profile' proc entry.\n");
+
   prof_running = 1;
   return 0;
 }
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/arch/frv/kernel/irq.c linux-2.6.18-rc7/arch/frv/kernel/irq.c
--- linux-2.6.18-rc7-orig/arch/frv/kernel/irq.c	2006-09-15 15:28:35.000000000 +0530
+++ linux-2.6.18-rc7/arch/frv/kernel/irq.c	2006-09-15 16:43:13.000000000 +0530
@@ -714,8 +714,10 @@ void init_irq_proc (void)
 
 	/* create /proc/irq/prof_cpu_mask */
 	entry = create_proc_entry("prof_cpu_mask", 0600, root_irq_dir);
-	if (!entry)
-	    return;
+	if (!entry) {
+		printk(KERN_ERR "Unable to create 'prof_cpu_mask' proc entry.\n");
+		return;
+	}
 
 	entry->nlink = 1;
 	entry->data = (void *)&prof_cpu_mask;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/arch/h8300/kernel/gpio.c linux-2.6.18-rc7/arch/h8300/kernel/gpio.c
--- linux-2.6.18-rc7-orig/arch/h8300/kernel/gpio.c	2006-09-15 15:28:35.000000000 +0530
+++ linux-2.6.18-rc7/arch/h8300/kernel/gpio.c	2006-09-15 16:39:13.000000000 +0530
@@ -161,6 +161,8 @@ static __init int register_proc(void)
 	proc_gpio = create_proc_entry("gpio", S_IRUGO, NULL);
 	if (proc_gpio) 
 		proc_gpio->read_proc = gpio_proc_read;
+	else
+		printk(KERN_ERR "Unable to create 'gpio' proc entry.\n");
 	return proc_gpio != NULL;
 }
 
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/arch/i386/kernel/cpu/mtrr/if.c linux-2.6.18-rc7/arch/i386/kernel/cpu/mtrr/if.c
--- linux-2.6.18-rc7-orig/arch/i386/kernel/cpu/mtrr/if.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc7/arch/i386/kernel/cpu/mtrr/if.c	2006-09-15 17:48:36.000000000 +0530
@@ -396,7 +396,9 @@ static int __init mtrr_if_init(void)
 	if (proc_root_mtrr) {
 		proc_root_mtrr->owner = THIS_MODULE;
 		proc_root_mtrr->proc_fops = &mtrr_fops;
-	}
+	} else
+		printk(KERN_WARNING "Unable to create 'mtrr' proc entry.\n");
+
 	return 0;
 }
 
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/arch/ia64/hp/common/sba_iommu.c linux-2.6.18-rc7/arch/ia64/hp/common/sba_iommu.c
--- linux-2.6.18-rc7-orig/arch/ia64/hp/common/sba_iommu.c	2006-09-15 15:28:35.000000000 +0530
+++ linux-2.6.18-rc7/arch/ia64/hp/common/sba_iommu.c	2006-09-15 16:45:31.000000000 +0530
@@ -1904,6 +1904,8 @@ ioc_proc_init(void)
 	entry = create_proc_entry(ioc_list->name, 0, dir);
 	if (entry)
 		entry->proc_fops = &ioc_fops;
+	else
+		printk(KERN_WARNING "Unable to create '%s' proc entry.\n",ioc_list->name);
 }
 #endif
 
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/arch/ia64/kernel/salinfo.c linux-2.6.18-rc7/arch/ia64/kernel/salinfo.c
--- linux-2.6.18-rc7-orig/arch/ia64/kernel/salinfo.c	2006-09-15 15:28:35.000000000 +0530
+++ linux-2.6.18-rc7/arch/ia64/kernel/salinfo.c	2006-09-15 16:46:30.000000000 +0530
@@ -646,15 +646,19 @@ salinfo_init(void)
 			continue;
 
 		entry = create_proc_entry("event", S_IRUSR, dir);
-		if (!entry)
+		if (!entry) {
+			printk(KERN_WARNING "Unable to create 'event' proc entry.\n");
 			continue;
+		}
 		entry->data = data;
 		entry->proc_fops = &salinfo_event_fops;
 		*sdir++ = entry;
 
 		entry = create_proc_entry("data", S_IRUSR | S_IWUSR, dir);
-		if (!entry)
+		if (!entry) {
+			printk(KERN_WARNING "Unable to create 'data' proc entry.\n");
 			continue;
+		}
 		entry->data = data;
 		entry->proc_fops = &salinfo_data_fops;
 		*sdir++ = entry;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/arch/ia64/sn/kernel/sn2/sn_proc_fs.c linux-2.6.18-rc7/arch/ia64/sn/kernel/sn2/sn_proc_fs.c
--- linux-2.6.18-rc7-orig/arch/ia64/sn/kernel/sn2/sn_proc_fs.c	2006-09-15 15:28:35.000000000 +0530
+++ linux-2.6.18-rc7/arch/ia64/sn/kernel/sn2/sn_proc_fs.c	2006-09-15 17:49:21.000000000 +0530
@@ -109,7 +109,8 @@ static struct proc_dir_entry
 			f->write = write;
 			e->proc_fops = f;
 		}
-	}
+	} else
+		printk(KERN_WARNING "Unable to create '%s' proc entry.\n",name);
 
 	return e;
 }
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/arch/mips/lasat/picvue_proc.c linux-2.6.18-rc7/arch/mips/lasat/picvue_proc.c
--- linux-2.6.18-rc7-orig/arch/mips/lasat/picvue_proc.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc7/arch/mips/lasat/picvue_proc.c	2006-09-15 16:49:03.000000000 +0530
@@ -160,15 +160,19 @@ static int __init pvc_proc_init(void)
 	}
 	for (i=0; i<PVC_NLINES; i++) {
 		proc_entry = create_proc_entry(pvc_linename[i], 0644, pvc_display_dir);
-		if (proc_entry = NULL)
+		if (proc_entry = NULL) {
+			printk(KERN_ERR "Unable to create '%s' proc entry.\n",pvc_linename[i]);
 			goto error;
+		}
 		proc_entry->read_proc = pvc_proc_read_line;
 		proc_entry->write_proc = pvc_proc_write_line;
 		proc_entry->data = &pvc_linedata[i];
 	}
 	proc_entry = create_proc_entry("scroll", 0644, pvc_display_dir);
-	if (proc_entry = NULL)
+	if (proc_entry = NULL) {
+		printk(KERN_ERR "Unable to create 'scroll' proc entry.\n");
 		goto error;
+	}
 	proc_entry->write_proc = pvc_proc_write_scroll;
 	proc_entry->read_proc = pvc_proc_read_scroll;
 
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/arch/mips/tx4938/toshiba_rbtx4938/spi_eeprom.c linux-2.6.18-rc7/arch/mips/tx4938/toshiba_rbtx4938/spi_eeprom.c
--- linux-2.6.18-rc7-orig/arch/mips/tx4938/toshiba_rbtx4938/spi_eeprom.c	2006-09-15 15:28:36.000000000 +0530
+++ linux-2.6.18-rc7/arch/mips/tx4938/toshiba_rbtx4938/spi_eeprom.c	2006-09-15 17:49:47.000000000 +0530
@@ -213,6 +213,7 @@ __init void spi_eeprom_proc_create(struc
 		entry->read_proc = spi_eeprom_read_proc;
 		entry->write_proc = spi_eeprom_write_proc;
 		entry->data = (void *)chipid;
-	}
+	} else
+		printk(KERN_WARNING "Unable to create '%s' proc entry.\n",name);
 }
 #endif /* CONFIG_PROC_FS */
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/arch/powerpc/kernel/proc_ppc64.c linux-2.6.18-rc7/arch/powerpc/kernel/proc_ppc64.c
--- linux-2.6.18-rc7-orig/arch/powerpc/kernel/proc_ppc64.c	2006-09-15 15:28:36.000000000 +0530
+++ linux-2.6.18-rc7/arch/powerpc/kernel/proc_ppc64.c	2006-09-15 16:54:56.000000000 +0530
@@ -69,8 +69,10 @@ static int __init proc_ppc64_init(void)
 	struct proc_dir_entry *pde;
 
 	pde = create_proc_entry("ppc64/systemcfg", S_IFREG|S_IRUGO, NULL);
-	if (!pde)
+	if (!pde) {
+		printk(KERN_ERR "Unable to create 'ppc64/systemcfg' proc entry.\n");
 		return 1;
+	}
 	pde->nlink = 1;
 	pde->data = vdso_data;
 	pde->size = PAGE_SIZE;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/arch/powerpc/kernel/rtas_flash.c linux-2.6.18-rc7/arch/powerpc/kernel/rtas_flash.c
--- linux-2.6.18-rc7-orig/arch/powerpc/kernel/rtas_flash.c	2006-09-15 15:28:36.000000000 +0530
+++ linux-2.6.18-rc7/arch/powerpc/kernel/rtas_flash.c	2006-09-15 17:50:18.000000000 +0530
@@ -700,7 +700,8 @@ static struct proc_dir_entry *create_fla
 		ent->nlink = 1;
 		ent->proc_fops = fops;
 		ent->owner = THIS_MODULE;
-	}
+	} else
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n",filename);
 
 	return ent;
 }
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/arch/powerpc/kernel/rtas-proc.c linux-2.6.18-rc7/arch/powerpc/kernel/rtas-proc.c
--- linux-2.6.18-rc7-orig/arch/powerpc/kernel/rtas-proc.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc7/arch/powerpc/kernel/rtas-proc.c	2006-09-15 16:57:02.000000000 +0530
@@ -267,31 +267,45 @@ static int __init proc_rtas_init(void)
 	entry = create_proc_entry("ppc64/rtas/progress", S_IRUGO|S_IWUSR, NULL);
 	if (entry)
 		entry->proc_fops = &ppc_rtas_progress_operations;
+	else
+		printk(KERN_WARNING "Unable to create 'ppc64/rtas/progress' proc entry.\n");
 
 	entry = create_proc_entry("ppc64/rtas/clock", S_IRUGO|S_IWUSR, NULL);
 	if (entry)
 		entry->proc_fops = &ppc_rtas_clock_operations;
+	else
+		printk(KERN_WARNING "Unable to create 'ppc64/rtas/clock' proc entry.\n");
 
 	entry = create_proc_entry("ppc64/rtas/poweron", S_IWUSR|S_IRUGO, NULL);
 	if (entry)
 		entry->proc_fops = &ppc_rtas_poweron_operations;
+	else
+		printk(KERN_WARNING "Unable to create 'ppc64/rtas/poweron' proc entry.\n");
 
 	entry = create_proc_entry("ppc64/rtas/sensors", S_IRUGO, NULL);
 	if (entry)
 		entry->proc_fops = &ppc_rtas_sensors_operations;
+	else
+		printk(KERN_WARNING "Unable to create 'ppc64/rtas/sensors' proc entry.\n");
 
 	entry = create_proc_entry("ppc64/rtas/frequency", S_IWUSR|S_IRUGO,
 				  NULL);
 	if (entry)
 		entry->proc_fops = &ppc_rtas_tone_freq_operations;
+	else
+		printk(KERN_WARNING "Unable to create 'ppc64/rtas/frequency' proc entry.\n");
 
 	entry = create_proc_entry("ppc64/rtas/volume", S_IWUSR|S_IRUGO, NULL);
 	if (entry)
 		entry->proc_fops = &ppc_rtas_tone_volume_operations;
+	else
+		printk(KERN_WARNING "Unable to create 'ppc64/rtas/volume' proc entry.\n");
 
 	entry = create_proc_entry("ppc64/rtas/rmo_buffer", S_IRUSR, NULL);
 	if (entry)
 		entry->proc_fops = &ppc_rtas_rmo_buf_ops;
+	else
+		printk(KERN_WARNING "Unable to create 'ppc64/rtas/rmo_buffer' proc entry.\n");
 
 	return 0;
 }
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/arch/powerpc/platforms/iseries/lpevents.c linux-2.6.18-rc7/arch/powerpc/platforms/iseries/lpevents.c
--- linux-2.6.18-rc7-orig/arch/powerpc/platforms/iseries/lpevents.c	2006-09-15 15:28:36.000000000 +0530
+++ linux-2.6.18-rc7/arch/powerpc/platforms/iseries/lpevents.c	2006-09-15 17:00:37.000000000 +0530
@@ -321,6 +321,8 @@ static int __init proc_lpevents_init(voi
 	e = create_proc_entry("iSeries/lpevents", S_IFREG|S_IRUGO, NULL);
 	if (e)
 		e->proc_fops = &proc_lpevents_operations;
+	else
+		printk(KERN_WARNING "Unable to create 'iSeries/lpevents' proc entry.\n");
 
 	return 0;
 }
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/arch/powerpc/platforms/iseries/mf.c linux-2.6.18-rc7/arch/powerpc/platforms/iseries/mf.c
--- linux-2.6.18-rc7-orig/arch/powerpc/platforms/iseries/mf.c	2006-09-15 15:28:36.000000000 +0530
+++ linux-2.6.18-rc7/arch/powerpc/platforms/iseries/mf.c	2006-09-15 17:00:02.000000000 +0530
@@ -1247,8 +1247,10 @@ static int __init mf_proc_init(void)
 			return 1;
 
 		ent = create_proc_entry("cmdline", S_IFREG|S_IRUSR|S_IWUSR, mf);
-		if (!ent)
+		if (!ent) {
+			printk(KERN_ERR "Unable to create 'cmdline' proc entry.\n");
 			return 1;
+		}
 		ent->nlink = 1;
 		ent->data = (void *)(long)i;
 		ent->read_proc = proc_mf_dump_cmdline;
@@ -1258,24 +1260,30 @@ static int __init mf_proc_init(void)
 			continue;
 
 		ent = create_proc_entry("vmlinux", S_IFREG|S_IWUSR, mf);
-		if (!ent)
+		if (!ent) {
+			printk(KERN_ERR "Unable to create 'vmlinux' proc entry.\n");
 			return 1;
+		}
 		ent->nlink = 1;
 		ent->data = (void *)(long)i;
 		ent->proc_fops = &proc_vmlinux_operations;
 	}
 
 	ent = create_proc_entry("side", S_IFREG|S_IRUSR|S_IWUSR, mf_proc_root);
-	if (!ent)
+	if (!ent) {
+		printk(KERN_ERR "Unable to create 'side' proc entry.\n");
 		return 1;
+	}
 	ent->nlink = 1;
 	ent->data = (void *)0;
 	ent->read_proc = proc_mf_dump_side;
 	ent->write_proc = proc_mf_change_side;
 
 	ent = create_proc_entry("src", S_IFREG|S_IRUSR|S_IWUSR, mf_proc_root);
-	if (!ent)
+	if (!ent) {
+		printk(KERN_ERR "Unable to create 'src' proc entry.\n");
 		return 1;
+	}
 	ent->nlink = 1;
 	ent->data = (void *)0;
 	ent->read_proc = proc_mf_dump_src;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/arch/powerpc/platforms/iseries/proc.c linux-2.6.18-rc7/arch/powerpc/platforms/iseries/proc.c
--- linux-2.6.18-rc7-orig/arch/powerpc/platforms/iseries/proc.c	2006-09-15 15:28:36.000000000 +0530
+++ linux-2.6.18-rc7/arch/powerpc/platforms/iseries/proc.c	2006-09-15 17:01:33.000000000 +0530
@@ -109,6 +109,8 @@ static int __init iseries_proc_init(void
 	e = create_proc_entry("iSeries/titanTod", S_IFREG|S_IRUGO, NULL);
 	if (e)
 		e->proc_fops = &proc_titantod_operations;
+	else
+		printk(KERN_WARNING "Unable to create 'iSeries/titanTod' proc entry.\n");
 
 	return 0;
 }
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/arch/powerpc/platforms/iseries/viopath.c linux-2.6.18-rc7/arch/powerpc/platforms/iseries/viopath.c
--- linux-2.6.18-rc7-orig/arch/powerpc/platforms/iseries/viopath.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc7/arch/powerpc/platforms/iseries/viopath.c	2006-09-15 17:02:08.000000000 +0530
@@ -179,6 +179,8 @@ static int __init vio_proc_init(void)
 	e = create_proc_entry("iSeries/config", 0, NULL);
 	if (e)
 		e->proc_fops = &proc_viopath_operations;
+	else
+		printk(KERN_WARNING "Unable to create 'iSeries/config' proc entry.\n");
 
         return 0;
 }
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/arch/powerpc/platforms/pseries/eeh.c linux-2.6.18-rc7/arch/powerpc/platforms/pseries/eeh.c
--- linux-2.6.18-rc7-orig/arch/powerpc/platforms/pseries/eeh.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc7/arch/powerpc/platforms/pseries/eeh.c	2006-09-15 17:02:41.000000000 +0530
@@ -1022,6 +1022,8 @@ static int __init eeh_init_proc(void)
 		e = create_proc_entry("ppc64/eeh", 0, NULL);
 		if (e)
 			e->proc_fops = &proc_eeh_operations;
+		else
+			printk(KERN_WARNING "Unable to create 'ppc64/eeh' proc entry.\n");
 	}
 
 	return 0;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/arch/powerpc/platforms/pseries/reconfig.c linux-2.6.18-rc7/arch/powerpc/platforms/pseries/reconfig.c
--- linux-2.6.18-rc7-orig/arch/powerpc/platforms/pseries/reconfig.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc7/arch/powerpc/platforms/pseries/reconfig.c	2006-09-15 17:16:11.000000000 +0530
@@ -518,7 +518,8 @@ static int proc_ppc64_create_ofdt(void)
 		ent->data = NULL;
 		ent->size = 0;
 		ent->proc_fops = &ofdt_fops;
-	}
+	}else
+		printk(KERN_WARNING "Unable to create 'ppc64/ofdt' proc entry.\n");
 
 	return 0;
 }
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/arch/sparc/kernel/led.c linux-2.6.18-rc7/arch/sparc/kernel/led.c
--- linux-2.6.18-rc7-orig/arch/sparc/kernel/led.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc7/arch/sparc/kernel/led.c	2006-09-15 17:17:42.000000000 +0530
@@ -110,8 +110,10 @@ static int __init led_init(void)
 	led_blink_timer.function = led_blink;
 
 	led = create_proc_entry("led", 0, NULL);
-	if (!led)
+	if (!led) {
+		printk(KERN_ERR "Unable to create 'led' proc entry.\n");
 		return -ENOMEM;
+	}
 
 	led->read_proc = led_read_proc; /* reader function */
 	led->write_proc = led_write_proc; /* writer function */
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/arch/um/drivers/ubd_kern.c linux-2.6.18-rc7/arch/um/drivers/ubd_kern.c
--- linux-2.6.18-rc7-orig/arch/um/drivers/ubd_kern.c	2006-09-15 15:28:37.000000000 +0530
+++ linux-2.6.18-rc7/arch/um/drivers/ubd_kern.c	2006-09-15 17:18:36.000000000 +0530
@@ -245,7 +245,10 @@ static void make_ide_entries(char *dev_n
 	if(!dir) return;
 
 	ent = create_proc_entry("media", S_IFREG|S_IRUGO, dir);
-	if(!ent) return;
+	if(!ent) {
+		printk(KERN_ERR "Unable to create 'media' proc entry.\n");
+		return;
+	}
 	ent->nlink = 1;
 	ent->data = NULL;
 	ent->read_proc = proc_ide_read_media;


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
