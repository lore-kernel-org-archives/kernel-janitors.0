From: Amol Lad <amol@verismonetworks.com>
Date: Mon, 11 Sep 2006 08:57:59 +0000
Subject: [KJ] [PATCH] misc_register error return handling
Message-Id: <1157964812.7814.32.camel@amol.verismonetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

Some drivers do not handle failure of misc_register. 

Added return value checks appropriately in defaulting drivers

Tested with:
- allmodconfig
- Manually tweaking Kconfig/Makefiles to make sure that the changed
files compiles without any errors/warnings

Signed-off-by: Amol Lad <amol@verismonetworks.com>
---
 arch/i386/kernel/apm.c             |   25 +++++++++++++++++++------
 arch/um/drivers/mmapper_kern.c     |    6 ++++--
 arch/x86_64/kernel/mce.c           |    7 ++++++-
 drivers/char/watchdog/ep93xx_wdt.c |    4 ++++
 drivers/input/misc/hp_sdc_rtc.c    |    9 ++++++++-
 drivers/macintosh/apm_emu.c        |   10 +++++++++-
 drivers/macintosh/smu.c            |   13 ++++++++++---
 drivers/macintosh/via-pmu.c        |   13 ++++++++++---
 include/linux/utsrelease.h         |    1 +
 9 files changed, 71 insertions(+), 17 deletions(-)
---
diff -uprN -X linux-2.6.18-rc6-orig/Documentation/dontdiff linux-2.6.18-rc6-orig/arch/i386/kernel/apm.c linux-2.6.18-rc6/arch/i386/kernel/apm.c
--- linux-2.6.18-rc6-orig/arch/i386/kernel/apm.c	2006-09-11 11:07:17.000000000 +0530
+++ linux-2.6.18-rc6/arch/i386/kernel/apm.c	2006-09-11 13:49:10.000000000 +0530
@@ -233,6 +233,8 @@
 
 #include "io_ports.h"
 
+#define PFX "apm: "
+
 extern unsigned long get_cmos_time(void);
 extern void machine_real_restart(unsigned char *, int);
 
@@ -2246,6 +2248,12 @@ static int __init apm_init(void)
 		return -ENODEV;
 	}
 
+	ret = misc_register(&apm_device);
+	if (ret != 0) {
+		printk(KERN_ERR PFX "cannot register misc device.\n");
+		return ret;
+	}
+
 	if (allow_ints)
 		apm_info.allow_ints = 1;
 	if (broken_psr)
@@ -2282,17 +2290,20 @@ static int __init apm_init(void)
 
 	if (apm_info.disabled) {
 		printk(KERN_NOTICE "apm: disabled on user request.\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto out_misc;
 	}
 	if ((num_online_cpus() > 1) && !power_off && !smp) {
 		printk(KERN_NOTICE "apm: disabled - APM is not SMP safe.\n");
 		apm_info.disabled = 1;
-		return -ENODEV;
+		ret = -ENODEV;
+		goto out_misc;
 	}
 	if (PM_IS_ACTIVE()) {
 		printk(KERN_NOTICE "apm: overridden by ACPI.\n");
 		apm_info.disabled = 1;
-		return -ENODEV;
+		ret = -ENODEV;
+		goto out_misc;
 	}
 #ifdef CONFIG_PM_LEGACY
 	pm_active = 1;
@@ -2339,7 +2350,8 @@ static int __init apm_init(void)
 	ret = kernel_thread(apm, NULL, CLONE_KERNEL | SIGCHLD);
 	if (ret < 0) {
 		printk(KERN_ERR "apm: disabled - Unable to start kernel thread.\n");
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto out_misc;
 	}
 
 	if (num_online_cpus() > 1 && !smp ) {
@@ -2348,8 +2360,6 @@ static int __init apm_init(void)
 		return 0;
 	}
 
-	misc_register(&apm_device);
-
 	if (HZ != 100)
 		idle_period = (idle_period * HZ) / 100;
 	if (idle_threshold < 100) {
@@ -2359,6 +2369,9 @@ static int __init apm_init(void)
 	}
 
 	return 0;
+out_misc:
+	misc_deregister(&apm_device);
+	return ret;
 }
 
 static void __exit apm_exit(void)
diff -uprN -X linux-2.6.18-rc6-orig/Documentation/dontdiff linux-2.6.18-rc6-orig/arch/um/drivers/mmapper_kern.c linux-2.6.18-rc6/arch/um/drivers/mmapper_kern.c
--- linux-2.6.18-rc6-orig/arch/um/drivers/mmapper_kern.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc6/arch/um/drivers/mmapper_kern.c	2006-09-11 13:54:35.000000000 +0530
@@ -103,7 +103,7 @@ static struct miscdevice mmapper_dev = {
 
 static int __init mmapper_init(void)
 {
-	int err;
+	int err = 0;
 
 	printk(KERN_INFO "Mapper v0.1\n");
 
@@ -121,8 +121,10 @@ static int __init mmapper_init(void)
 	}
 
 	p_buf = __pa(v_buf);
-out:
+    
 	return 0;
+out:
+	return err;
 }
 
 static void mmapper_exit(void)
diff -uprN -X linux-2.6.18-rc6-orig/Documentation/dontdiff linux-2.6.18-rc6-orig/arch/x86_64/kernel/mce.c linux-2.6.18-rc6/arch/x86_64/kernel/mce.c
--- linux-2.6.18-rc6-orig/arch/x86_64/kernel/mce.c	2006-09-11 11:07:19.000000000 +0530
+++ linux-2.6.18-rc6/arch/x86_64/kernel/mce.c	2006-09-11 13:53:53.000000000 +0530
@@ -28,6 +28,7 @@
 
 #define MISC_MCELOG_MINOR 227
 #define NR_BANKS 6
+#define PFX "MCE: "
 
 atomic_t mce_entry;
 
@@ -663,7 +664,11 @@ static __init int mce_init_device(void)
 	}
 
 	register_hotcpu_notifier(&mce_cpu_notifier);
-	misc_register(&mce_log_device);
+
+	err = misc_register(&mce_log_device);
+	if (err != 0)
+		printk(KERN_ERR PFX "cannot register misc device.\n");
+
 	return err;
 }
 
diff -uprN -X linux-2.6.18-rc6-orig/Documentation/dontdiff linux-2.6.18-rc6-orig/drivers/char/watchdog/ep93xx_wdt.c linux-2.6.18-rc6/drivers/char/watchdog/ep93xx_wdt.c
--- linux-2.6.18-rc6-orig/drivers/char/watchdog/ep93xx_wdt.c	2006-09-11 11:07:20.000000000 +0530
+++ linux-2.6.18-rc6/drivers/char/watchdog/ep93xx_wdt.c	2006-09-11 13:50:47.000000000 +0530
@@ -215,6 +215,10 @@ static int __init ep93xx_wdt_init(void)
 	int err;
 
 	err = misc_register(&ep93xx_wdt_miscdev);
+	if (err != 0) {
+		printk(KERN_ERR PFX "cannot register misc device.\n");
+		return err;
+	}
 
 	boot_status = __raw_readl(EP93XX_WDT_WATCHDOG) & 0x01 ? 1 : 0;
 
diff -uprN -X linux-2.6.18-rc6-orig/Documentation/dontdiff linux-2.6.18-rc6-orig/drivers/input/misc/hp_sdc_rtc.c linux-2.6.18-rc6/drivers/input/misc/hp_sdc_rtc.c
--- linux-2.6.18-rc6-orig/drivers/input/misc/hp_sdc_rtc.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc6/drivers/input/misc/hp_sdc_rtc.c	2006-09-11 13:50:11.000000000 +0530
@@ -44,6 +44,8 @@
 #include <linux/poll.h>
 #include <linux/rtc.h>
 
+#define PFX "HP i8042 SDC + MSM-58321 RTC: "
+
 MODULE_AUTHOR("Brian S. Julin <bri@calyx.com>");
 MODULE_DESCRIPTION("HP i8042 SDC + MSM-58321 RTC Driver");
 MODULE_LICENSE("Dual BSD/GPL");
@@ -695,7 +697,12 @@ static int __init hp_sdc_rtc_init(void)
 
 	if ((ret = hp_sdc_request_timer_irq(&hp_sdc_rtc_isr)))
 		return ret;
-	misc_register(&hp_sdc_rtc_dev);
+
+	ret = misc_register(&hp_sdc_rtc_dev);
+	if (ret != 0) {
+		printk(KERN_ERR PFX "cannot register misc device.\n");
+		return ret;
+	}
         create_proc_read_entry ("driver/rtc", 0, 0, 
 				hp_sdc_rtc_read_proc, NULL);
 
diff -uprN -X linux-2.6.18-rc6-orig/Documentation/dontdiff linux-2.6.18-rc6-orig/drivers/macintosh/apm_emu.c linux-2.6.18-rc6/drivers/macintosh/apm_emu.c
--- linux-2.6.18-rc6-orig/drivers/macintosh/apm_emu.c	2006-09-11 11:07:21.000000000 +0530
+++ linux-2.6.18-rc6/drivers/macintosh/apm_emu.c	2006-09-11 14:01:35.000000000 +0530
@@ -52,6 +52,8 @@
 #define DBG(args...) do { } while (0)
 #endif
 
+#define PFX "apm_emu: "
+
 /*
  * The apm_bios device is one of the misc char devices.
  * This is its minor number.
@@ -519,6 +521,7 @@ static struct miscdevice apm_device = {
 static int __init apm_emu_init(void)
 {
 	struct proc_dir_entry *apm_proc;
+	int ret;
 
 	if (sys_ctrler != SYS_CTRLER_PMU) {
 		printk(KERN_INFO "apm_emu: Requires a machine with a PMU.\n");
@@ -529,7 +532,12 @@ static int __init apm_emu_init(void)
 	if (apm_proc)
 		apm_proc->owner = THIS_MODULE;
 
-	misc_register(&apm_device);
+	ret = misc_register(&apm_device);
+	if (ret != 0) {
+		printk(KERN_ERR PFX "cannot register misc device.\n");
+		remove_proc_entry("apm", NULL);
+		return ret;
+	}
 
 	pmu_register_sleep_notifier(&apm_sleep_notifier);
 
diff -uprN -X linux-2.6.18-rc6-orig/Documentation/dontdiff linux-2.6.18-rc6-orig/drivers/macintosh/smu.c linux-2.6.18-rc6/drivers/macintosh/smu.c
--- linux-2.6.18-rc6-orig/drivers/macintosh/smu.c	2006-09-11 11:07:21.000000000 +0530
+++ linux-2.6.18-rc6/drivers/macintosh/smu.c	2006-09-11 13:52:32.000000000 +0530
@@ -58,6 +58,8 @@
 #define DPRINTK(fmt, args...) do { } while (0)
 #endif
 
+#define PFX "SMU: "
+
 /*
  * This is the command buffer passed to the SMU hardware
  */
@@ -1292,10 +1294,15 @@ static struct miscdevice pmu_device = {
 
 static int smu_device_init(void)
 {
+	int ret = 0;
+    
 	if (!smu)
 		return -ENODEV;
-	if (misc_register(&pmu_device) < 0)
-		printk(KERN_ERR "via-pmu: cannot register misc device.\n");
-	return 0;
+    
+	ret = misc_register(&pmu_device);
+	if (ret != 0)
+		printk(KERN_ERR PFX "cannot register misc device.\n");
+        
+	return ret;
 }
 device_initcall(smu_device_init);
diff -uprN -X linux-2.6.18-rc6-orig/Documentation/dontdiff linux-2.6.18-rc6-orig/drivers/macintosh/via-pmu.c linux-2.6.18-rc6/drivers/macintosh/via-pmu.c
--- linux-2.6.18-rc6-orig/drivers/macintosh/via-pmu.c	2006-09-11 11:07:21.000000000 +0530
+++ linux-2.6.18-rc6/drivers/macintosh/via-pmu.c	2006-09-11 13:51:48.000000000 +0530
@@ -63,6 +63,8 @@
 
 #include "via-pmu-event.h"
 
+#define PFX "pmu: "
+
 /* Some compile options */
 #undef SUSPEND_USES_PMU
 #define DEBUG_SLEEP
@@ -2678,11 +2680,16 @@ static struct miscdevice pmu_device = {
 
 static int pmu_device_init(void)
 {
+	int ret = 0;
+
 	if (!via)
 		return 0;
-	if (misc_register(&pmu_device) < 0)
-		printk(KERN_ERR "via-pmu: cannot register misc device.\n");
-	return 0;
+
+	ret = misc_register(&pmu_device);
+	if (ret != 0)
+		printk(KERN_ERR PFX "cannot register misc device.\n");
+
+	return ret;
 }
 device_initcall(pmu_device_init);
 
diff -uprN -X linux-2.6.18-rc6-orig/Documentation/dontdiff linux-2.6.18-rc6-orig/include/linux/utsrelease.h linux-2.6.18-rc6/include/linux/utsrelease.h
--- linux-2.6.18-rc6-orig/include/linux/utsrelease.h	1970-01-01 05:30:00.000000000 +0530
+++ linux-2.6.18-rc6/include/linux/utsrelease.h	2006-09-09 13:50:09.000000000 +0530
@@ -0,0 +1 @@
+#define UTS_RELEASE "2.6.18-rc6"



_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
