From: Amol Lad <amol@verismonetworks.com>
Date: Tue, 19 Sep 2006 10:08:01 +0000
Subject: [KJ] [PATCH 2/6] create_proc_entry error handling: drivers
Message-Id: <1158659761.28299.75.camel@amol.verismonetworks.com>
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
 acpi/ac.c                       |    5 ++--
 acpi/battery.c                  |   15 ++++++++-----
 acpi/button.c                   |   10 +++++---
 acpi/ec.c                       |    5 ++--
 acpi/event.c                    |    1
 acpi/fan.c                      |    5 ++--
 acpi/hotkey.c                   |    1
 acpi/power.c                    |    5 ++--
 acpi/processor_core.c           |   15 ++++++++-----
 acpi/processor_idle.c           |    5 ++--
 acpi/processor_perflib.c        |    3 +-
 acpi/sleep/proc.c               |    6 +++++
 acpi/system.c                   |   13 ++++++++---
 acpi/thermal.c                  |   25 +++++++++++++---------
 acpi/video.c                    |   45 ++++++++++++++++++++++++----------------
 block/pktcdvd.c                 |    4 ++-
 cdrom/viocd.c                   |    3 +-
 char/i8k.c                      |    4 ++-
 char/ipmi/ipmi_msghandler.c     |    1
 char/misc.c                     |    2 +
 char/rtc.c                      |    1
 char/viotape.c                  |    3 +-
 ide/ide-proc.c                  |    7 +++++-
 input/input.c                   |    8 +++++--
 isdn/capi/capi.c                |    5 +++-
 isdn/capi/capidrv.c             |    5 +++-
 isdn/capi/kcapi.c               |    3 +-
 isdn/capi/kcapi_proc.c          |    2 +
 isdn/divert/divert_procfs.c     |    1
 isdn/hardware/eicon/diva_didd.c |    3 +-
 isdn/hardware/eicon/divasi.c    |    4 ++-
 isdn/hardware/eicon/divasproc.c |   15 +++++++++----
 isdn/hysdn/hysdn_procconf.c     |    3 +-
 isdn/hysdn/hysdn_proclog.c      |    3 +-
 34 files changed, 159 insertions(+), 77 deletions(-)
---
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/acpi/ac.c linux-2.6.18-rc7/drivers/acpi/ac.c
--- linux-2.6.18-rc7-orig/drivers/acpi/ac.c	2006-09-15 15:28:37.000000000 +0530
+++ linux-2.6.18-rc7/drivers/acpi/ac.c	2006-09-15 17:41:43.000000000 +0530
@@ -157,9 +157,10 @@ static int acpi_ac_add_fs(struct acpi_de
 	/* 'state' [R] */
 	entry = create_proc_entry(ACPI_AC_FILE_STATE,
 				  S_IRUGO, acpi_device_dir(device));
-	if (!entry)
+	if (!entry) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n", ACPI_AC_FILE_STATE);
 		return -ENODEV;
-	else {
+	} else {
 		entry->proc_fops = &acpi_ac_fops;
 		entry->data = acpi_driver_data(device);
 		entry->owner = THIS_MODULE;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/acpi/battery.c linux-2.6.18-rc7/drivers/acpi/battery.c
--- linux-2.6.18-rc7-orig/drivers/acpi/battery.c	2006-09-15 15:28:37.000000000 +0530
+++ linux-2.6.18-rc7/drivers/acpi/battery.c	2006-09-15 17:46:29.000000000 +0530
@@ -598,9 +598,10 @@ static int acpi_battery_add_fs(struct ac
 	/* 'info' [R] */
 	entry = create_proc_entry(ACPI_BATTERY_FILE_INFO,
 				  S_IRUGO, acpi_device_dir(device));
-	if (!entry)
+	if (!entry) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n",ACPI_BATTERY_FILE_INFO);
 		return -ENODEV;
-	else {
+	} else {
 		entry->proc_fops = &acpi_battery_info_ops;
 		entry->data = acpi_driver_data(device);
 		entry->owner = THIS_MODULE;
@@ -609,9 +610,10 @@ static int acpi_battery_add_fs(struct ac
 	/* 'status' [R] */
 	entry = create_proc_entry(ACPI_BATTERY_FILE_STATUS,
 				  S_IRUGO, acpi_device_dir(device));
-	if (!entry)
+	if (!entry) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n",ACPI_BATTERY_FILE_STATUS);
 		return -ENODEV;
-	else {
+	} else {
 		entry->proc_fops = &acpi_battery_state_ops;
 		entry->data = acpi_driver_data(device);
 		entry->owner = THIS_MODULE;
@@ -621,9 +623,10 @@ static int acpi_battery_add_fs(struct ac
 	entry = create_proc_entry(ACPI_BATTERY_FILE_ALARM,
 				  S_IFREG | S_IRUGO | S_IWUSR,
 				  acpi_device_dir(device));
-	if (!entry)
+	if (!entry) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n",ACPI_BATTERY_FILE_ALARM);
 		return -ENODEV;
-	else {
+	} else {
 		entry->proc_fops = &acpi_battery_alarm_ops;
 		entry->data = acpi_driver_data(device);
 		entry->owner = THIS_MODULE;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/acpi/button.c linux-2.6.18-rc7/drivers/acpi/button.c
--- linux-2.6.18-rc7-orig/drivers/acpi/button.c	2006-09-15 15:28:37.000000000 +0530
+++ linux-2.6.18-rc7/drivers/acpi/button.c	2006-09-15 17:46:52.000000000 +0530
@@ -202,9 +202,10 @@ static int acpi_button_add_fs(struct acp
 	/* 'info' [R] */
 	entry = create_proc_entry(ACPI_BUTTON_FILE_INFO,
 				  S_IRUGO, acpi_device_dir(device));
-	if (!entry)
+	if (!entry) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n",ACPI_BUTTON_FILE_INFO);
 		return -ENODEV;
-	else {
+	} else {
 		entry->proc_fops = &acpi_button_info_fops;
 		entry->data = acpi_driver_data(device);
 		entry->owner = THIS_MODULE;
@@ -214,9 +215,10 @@ static int acpi_button_add_fs(struct acp
 	if (button->type = ACPI_BUTTON_TYPE_LID) {
 		entry = create_proc_entry(ACPI_BUTTON_FILE_STATE,
 					  S_IRUGO, acpi_device_dir(device));
-		if (!entry)
+		if (!entry) {
+			printk(KERN_ERR "Unable to create '%s' proc entry.\n",ACPI_BUTTON_FILE_STATE);
 			return -ENODEV;
-		else {
+		} else {
 			entry->proc_fops = &acpi_button_state_fops;
 			entry->data = acpi_driver_data(device);
 			entry->owner = THIS_MODULE;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/acpi/ec.c linux-2.6.18-rc7/drivers/acpi/ec.c
--- linux-2.6.18-rc7-orig/drivers/acpi/ec.c	2006-09-15 15:28:37.000000000 +0530
+++ linux-2.6.18-rc7/drivers/acpi/ec.c	2006-09-18 11:39:40.000000000 +0530
@@ -951,9 +951,10 @@ static int acpi_ec_add_fs(struct acpi_de
 
 	entry = create_proc_entry(ACPI_EC_FILE_INFO, S_IRUGO,
 				  acpi_device_dir(device));
-	if (!entry)
+	if (!entry) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n", ACPI_EC_FILE_INFO);
 		return -ENODEV;
-	else {
+	} else {
 		entry->proc_fops = &acpi_ec_info_ops;
 		entry->data = acpi_driver_data(device);
 		entry->owner = THIS_MODULE;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/acpi/event.c linux-2.6.18-rc7/drivers/acpi/event.c
--- linux-2.6.18-rc7-orig/drivers/acpi/event.c	2006-09-15 15:28:37.000000000 +0530
+++ linux-2.6.18-rc7/drivers/acpi/event.c	2006-09-18 11:40:21.000000000 +0530
@@ -120,6 +120,7 @@ static int __init acpi_event_init(void)
 	if (entry)
 		entry->proc_fops = &acpi_system_event_ops;
 	else {
+		printk(KERN_ERR "Unable to create 'event' proc entry.\n");
 		error = -ENODEV;
 	}
 	return error;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/acpi/fan.c linux-2.6.18-rc7/drivers/acpi/fan.c
--- linux-2.6.18-rc7-orig/drivers/acpi/fan.c	2006-09-15 15:28:37.000000000 +0530
+++ linux-2.6.18-rc7/drivers/acpi/fan.c	2006-09-18 11:41:20.000000000 +0530
@@ -149,9 +149,10 @@ static int acpi_fan_add_fs(struct acpi_d
 	entry = create_proc_entry(ACPI_FAN_FILE_STATE,
 				  S_IFREG | S_IRUGO | S_IWUSR,
 				  acpi_device_dir(device));
-	if (!entry)
+	if (!entry) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n",ACPI_FAN_FILE_STATE);
 		return -ENODEV;
-	else {
+	} else {
 		entry->proc_fops = &acpi_fan_state_ops;
 		entry->data = acpi_driver_data(device);
 		entry->owner = THIS_MODULE;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/acpi/hotkey.c linux-2.6.18-rc7/drivers/acpi/hotkey.c
--- linux-2.6.18-rc7-orig/drivers/acpi/hotkey.c	2006-09-15 15:28:37.000000000 +0530
+++ linux-2.6.18-rc7/drivers/acpi/hotkey.c	2006-09-18 11:41:53.000000000 +0530
@@ -355,6 +355,7 @@ static int create_polling_proc(union acp
 	proc = create_proc_entry(proc_name, mode, hotkey_proc_dir);
 
 	if (!proc) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n",proc_name);
 		return -ENODEV;
 	} else {
 		proc->proc_fops = &hotkey_polling_fops;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/acpi/power.c linux-2.6.18-rc7/drivers/acpi/power.c
--- linux-2.6.18-rc7-orig/drivers/acpi/power.c	2006-09-15 15:28:37.000000000 +0530
+++ linux-2.6.18-rc7/drivers/acpi/power.c	2006-09-18 11:54:08.000000000 +0530
@@ -496,9 +496,10 @@ static int acpi_power_add_fs(struct acpi
 	/* 'status' [R] */
 	entry = create_proc_entry(ACPI_POWER_FILE_STATUS,
 				  S_IRUGO, acpi_device_dir(device));
-	if (!entry)
+	if (!entry) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n", ACPI_POWER_FILE_STATUS);
 		return -EIO;
-	else {
+	} else {
 		entry->proc_fops = &acpi_power_fops;
 		entry->data = acpi_driver_data(device);
 	}
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/acpi/processor_core.c linux-2.6.18-rc7/drivers/acpi/processor_core.c
--- linux-2.6.18-rc7-orig/drivers/acpi/processor_core.c	2006-09-15 15:28:37.000000000 +0530
+++ linux-2.6.18-rc7/drivers/acpi/processor_core.c	2006-09-18 11:55:56.000000000 +0530
@@ -322,9 +322,10 @@ static int acpi_processor_add_fs(struct 
 	/* 'info' [R] */
 	entry = create_proc_entry(ACPI_PROCESSOR_FILE_INFO,
 				  S_IRUGO, acpi_device_dir(device));
-	if (!entry)
+	if (!entry) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n", ACPI_PROCESSOR_FILE_INFO);
 		return -EIO;
-	else {
+	} else {
 		entry->proc_fops = &acpi_processor_info_fops;
 		entry->data = acpi_driver_data(device);
 		entry->owner = THIS_MODULE;
@@ -334,9 +335,10 @@ static int acpi_processor_add_fs(struct 
 	entry = create_proc_entry(ACPI_PROCESSOR_FILE_THROTTLING,
 				  S_IFREG | S_IRUGO | S_IWUSR,
 				  acpi_device_dir(device));
-	if (!entry)
+	if (!entry) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n", ACPI_PROCESSOR_FILE_THROTTLING);
 		return -EIO;
-	else {
+	} else {
 		entry->proc_fops = &acpi_processor_throttling_fops;
 		entry->data = acpi_driver_data(device);
 		entry->owner = THIS_MODULE;
@@ -346,9 +348,10 @@ static int acpi_processor_add_fs(struct 
 	entry = create_proc_entry(ACPI_PROCESSOR_FILE_LIMIT,
 				  S_IFREG | S_IRUGO | S_IWUSR,
 				  acpi_device_dir(device));
-	if (!entry)
+	if (!entry) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n", ACPI_PROCESSOR_FILE_LIMIT);
 		return -EIO;
-	else {
+	} else {
 		entry->proc_fops = &acpi_processor_limit_fops;
 		entry->data = acpi_driver_data(device);
 		entry->owner = THIS_MODULE;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/acpi/processor_idle.c linux-2.6.18-rc7/drivers/acpi/processor_idle.c
--- linux-2.6.18-rc7-orig/drivers/acpi/processor_idle.c	2006-09-15 15:28:37.000000000 +0530
+++ linux-2.6.18-rc7/drivers/acpi/processor_idle.c	2006-09-18 12:00:47.000000000 +0530
@@ -1131,9 +1131,10 @@ int acpi_processor_power_init(struct acp
 	/* 'power' [R] */
 	entry = create_proc_entry(ACPI_PROCESSOR_FILE_POWER,
 				  S_IRUGO, acpi_device_dir(device));
-	if (!entry)
+	if (!entry) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n", ACPI_PROCESSOR_FILE_POWER);
 		return -EIO;
-	else {
+	} else {
 		entry->proc_fops = &acpi_processor_power_fops;
 		entry->data = acpi_driver_data(device);
 		entry->owner = THIS_MODULE;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/acpi/processor_perflib.c linux-2.6.18-rc7/drivers/acpi/processor_perflib.c
--- linux-2.6.18-rc7-orig/drivers/acpi/processor_perflib.c	2006-09-15 15:28:37.000000000 +0530
+++ linux-2.6.18-rc7/drivers/acpi/processor_perflib.c	2006-09-18 12:07:11.000000000 +0530
@@ -508,7 +508,8 @@ static void acpi_cpufreq_add_file(struct
 		entry->proc_fops = &acpi_processor_perf_fops;
 		entry->data = acpi_driver_data(device);
 		entry->owner = THIS_MODULE;
-	}
+	} else
+		printk(KERN_WARNING "Unable to create '%s' proc entry.\n", ACPI_PROCESSOR_FILE_PERFORMANCE);
 	return;
 }
 
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/acpi/sleep/proc.c linux-2.6.18-rc7/drivers/acpi/sleep/proc.c
--- linux-2.6.18-rc7-orig/drivers/acpi/sleep/proc.c	2006-09-15 15:28:37.000000000 +0530
+++ linux-2.6.18-rc7/drivers/acpi/sleep/proc.c	2006-09-18 12:20:09.000000000 +0530
@@ -482,6 +482,8 @@ static int acpi_sleep_proc_init(void)
 			      acpi_root_dir);
 	if (entry)
 		entry->proc_fops = &acpi_system_sleep_fops;
+	else
+		printk(KERN_WARNING "Unable to create 'sleep' proc entry.\n");
 #endif
 
 	/* 'alarm' [R/W] */
@@ -490,6 +492,8 @@ static int acpi_sleep_proc_init(void)
 			      acpi_root_dir);
 	if (entry)
 		entry->proc_fops = &acpi_system_alarm_fops;
+	else
+		printk(KERN_WARNING "Unable to create 'alarm' proc entry.\n");
 
 	/* 'wakeup device' [R/W] */
 	entry @@ -497,6 +501,8 @@ static int acpi_sleep_proc_init(void)
 			      acpi_root_dir);
 	if (entry)
 		entry->proc_fops = &acpi_system_wakeup_device_fops;
+	else
+		printk(KERN_WARNING "Unable to create 'wakeup' proc entry.\n");
 
 	acpi_install_fixed_event_handler(ACPI_EVENT_RTC, rtc_handler, NULL);
 	return 0;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/acpi/system.c linux-2.6.18-rc7/drivers/acpi/system.c
--- linux-2.6.18-rc7-orig/drivers/acpi/system.c	2006-09-15 15:28:37.000000000 +0530
+++ linux-2.6.18-rc7/drivers/acpi/system.c	2006-09-18 12:10:57.000000000 +0530
@@ -131,9 +131,10 @@ static int __init acpi_system_init(void)
 	/* 'info' [R] */
 	name = ACPI_SYSTEM_FILE_INFO;
 	entry = create_proc_entry(name, S_IRUGO, acpi_root_dir);
-	if (!entry)
+	if (!entry) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n", name);
 		goto Error;
-	else {
+	} else {
 		entry->proc_fops = &acpi_system_info_ops;
 	}
 
@@ -142,16 +143,20 @@ static int __init acpi_system_init(void)
 	entry = create_proc_entry(name, S_IRUSR, acpi_root_dir);
 	if (entry)
 		entry->proc_fops = &acpi_system_dsdt_ops;
-	else
+	else {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n", name);
 		goto Error;
+	}
 
 	/* 'fadt' [R] */
 	name = ACPI_SYSTEM_FILE_FADT;
 	entry = create_proc_entry(name, S_IRUSR, acpi_root_dir);
 	if (entry)
 		entry->proc_fops = &acpi_system_fadt_ops;
-	else
+	else{
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n", name);
 		goto Error;
+	}
 
       Done:
 	return error;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/acpi/thermal.c linux-2.6.18-rc7/drivers/acpi/thermal.c
--- linux-2.6.18-rc7-orig/drivers/acpi/thermal.c	2006-09-15 15:28:37.000000000 +0530
+++ linux-2.6.18-rc7/drivers/acpi/thermal.c	2006-09-18 12:19:34.000000000 +0530
@@ -1085,9 +1085,10 @@ static int acpi_thermal_add_fs(struct ac
 	/* 'state' [R] */
 	entry = create_proc_entry(ACPI_THERMAL_FILE_STATE,
 				  S_IRUGO, acpi_device_dir(device));
-	if (!entry)
+	if (!entry) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n", ACPI_THERMAL_FILE_STATE);
 		return -ENODEV;
-	else {
+	} else {
 		entry->proc_fops = &acpi_thermal_state_fops;
 		entry->data = acpi_driver_data(device);
 		entry->owner = THIS_MODULE;
@@ -1096,9 +1097,10 @@ static int acpi_thermal_add_fs(struct ac
 	/* 'temperature' [R] */
 	entry = create_proc_entry(ACPI_THERMAL_FILE_TEMPERATURE,
 				  S_IRUGO, acpi_device_dir(device));
-	if (!entry)
+	if (!entry) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n", ACPI_THERMAL_FILE_TEMPERATURE);
 		return -ENODEV;
-	else {
+	} else {
 		entry->proc_fops = &acpi_thermal_temp_fops;
 		entry->data = acpi_driver_data(device);
 		entry->owner = THIS_MODULE;
@@ -1108,9 +1110,10 @@ static int acpi_thermal_add_fs(struct ac
 	entry = create_proc_entry(ACPI_THERMAL_FILE_TRIP_POINTS,
 				  S_IFREG | S_IRUGO | S_IWUSR,
 				  acpi_device_dir(device));
-	if (!entry)
+	if (!entry) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n", ACPI_THERMAL_FILE_TRIP_POINTS);
 		return -ENODEV;
-	else {
+	} else {
 		entry->proc_fops = &acpi_thermal_trip_fops;
 		entry->data = acpi_driver_data(device);
 		entry->owner = THIS_MODULE;
@@ -1120,9 +1123,10 @@ static int acpi_thermal_add_fs(struct ac
 	entry = create_proc_entry(ACPI_THERMAL_FILE_COOLING_MODE,
 				  S_IFREG | S_IRUGO | S_IWUSR,
 				  acpi_device_dir(device));
-	if (!entry)
+	if (!entry) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n", ACPI_THERMAL_FILE_COOLING_MODE);
 		return -ENODEV;
-	else {
+	} else {
 		entry->proc_fops = &acpi_thermal_cooling_fops;
 		entry->data = acpi_driver_data(device);
 		entry->owner = THIS_MODULE;
@@ -1132,9 +1136,10 @@ static int acpi_thermal_add_fs(struct ac
 	entry = create_proc_entry(ACPI_THERMAL_FILE_POLLING_FREQ,
 				  S_IFREG | S_IRUGO | S_IWUSR,
 				  acpi_device_dir(device));
-	if (!entry)
+	if (!entry) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n", ACPI_THERMAL_FILE_POLLING_FREQ);
 		return -ENODEV;
-	else {
+	} else {
 		entry->proc_fops = &acpi_thermal_polling_fops;
 		entry->data = acpi_driver_data(device);
 		entry->owner = THIS_MODULE;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/acpi/video.c linux-2.6.18-rc7/drivers/acpi/video.c
--- linux-2.6.18-rc7-orig/drivers/acpi/video.c	2006-09-15 15:28:37.000000000 +0530
+++ linux-2.6.18-rc7/drivers/acpi/video.c	2006-09-18 12:27:40.000000000 +0530
@@ -880,9 +880,10 @@ static int acpi_video_device_add_fs(stru
 
 	/* 'info' [R] */
 	entry = create_proc_entry("info", S_IRUGO, acpi_device_dir(device));
-	if (!entry)
+	if (!entry) {
+		printk(KERN_ERR "Unable to create 'info' proc entry.\n");
 		return -ENODEV;
-	else {
+	} else {
 		entry->proc_fops = &acpi_video_device_info_fops;
 		entry->data = acpi_driver_data(device);
 		entry->owner = THIS_MODULE;
@@ -892,9 +893,10 @@ static int acpi_video_device_add_fs(stru
 	entry  	    create_proc_entry("state", S_IFREG | S_IRUGO | S_IWUSR,
 			      acpi_device_dir(device));
-	if (!entry)
+	if (!entry) {
+		printk(KERN_ERR "Unable to create 'state' proc entry.\n");
 		return -ENODEV;
-	else {
+	} else {
 		acpi_video_device_state_fops.write = acpi_video_device_write_state;
 		entry->proc_fops = &acpi_video_device_state_fops;
 		entry->data = acpi_driver_data(device);
@@ -905,9 +907,10 @@ static int acpi_video_device_add_fs(stru
 	entry  	    create_proc_entry("brightness", S_IFREG | S_IRUGO | S_IWUSR,
 			      acpi_device_dir(device));
-	if (!entry)
+	if (!entry) {
+		printk(KERN_ERR "Unable to create 'brightness' proc entry.\n");
 		return -ENODEV;
-	else {
+	} else {
 		acpi_video_device_brightness_fops.write = acpi_video_device_write_brightness;
 		entry->proc_fops = &acpi_video_device_brightness_fops;
 		entry->data = acpi_driver_data(device);
@@ -916,9 +919,10 @@ static int acpi_video_device_add_fs(stru
 
 	/* 'EDID' [R] */
 	entry = create_proc_entry("EDID", S_IRUGO, acpi_device_dir(device));
-	if (!entry)
+	if (!entry) {
+		printk(KERN_ERR "Unable to create 'EDID' proc entry.\n");
 		return -ENODEV;
-	else {
+	} else {
 		entry->proc_fops = &acpi_video_device_EDID_fops;
 		entry->data = acpi_driver_data(device);
 		entry->owner = THIS_MODULE;
@@ -1163,9 +1167,10 @@ static int acpi_video_bus_add_fs(struct 
 
 	/* 'info' [R] */
 	entry = create_proc_entry("info", S_IRUGO, acpi_device_dir(device));
-	if (!entry)
+	if (!entry) {
+		printk(KERN_ERR "Unable to create 'info' proc entry.\n");
 		return -ENODEV;
-	else {
+	} else {
 		entry->proc_fops = &acpi_video_bus_info_fops;
 		entry->data = acpi_driver_data(device);
 		entry->owner = THIS_MODULE;
@@ -1173,9 +1178,10 @@ static int acpi_video_bus_add_fs(struct 
 
 	/* 'ROM' [R] */
 	entry = create_proc_entry("ROM", S_IRUGO, acpi_device_dir(device));
-	if (!entry)
+	if (!entry) {
+		printk(KERN_ERR "Unable to create 'ROM' proc entry.\n");
 		return -ENODEV;
-	else {
+	} else {
 		entry->proc_fops = &acpi_video_bus_ROM_fops;
 		entry->data = acpi_driver_data(device);
 		entry->owner = THIS_MODULE;
@@ -1184,9 +1190,10 @@ static int acpi_video_bus_add_fs(struct 
 	/* 'POST_info' [R] */
 	entry  	    create_proc_entry("POST_info", S_IRUGO, acpi_device_dir(device));
-	if (!entry)
+	if (!entry) {
+		printk(KERN_ERR "Unable to create 'POST_info' proc entry.\n");
 		return -ENODEV;
-	else {
+	} else {
 		entry->proc_fops = &acpi_video_bus_POST_info_fops;
 		entry->data = acpi_driver_data(device);
 		entry->owner = THIS_MODULE;
@@ -1196,9 +1203,10 @@ static int acpi_video_bus_add_fs(struct 
 	entry  	    create_proc_entry("POST", S_IFREG | S_IRUGO | S_IRUSR,
 			      acpi_device_dir(device));
-	if (!entry)
+	if (!entry) {
+		printk(KERN_ERR "Unable to create 'POST' proc entry.\n");
 		return -ENODEV;
-	else {
+	} else {
 		acpi_video_bus_POST_fops.write = acpi_video_bus_write_POST;
 		entry->proc_fops = &acpi_video_bus_POST_fops;
 		entry->data = acpi_driver_data(device);
@@ -1209,9 +1217,10 @@ static int acpi_video_bus_add_fs(struct 
 	entry  	    create_proc_entry("DOS", S_IFREG | S_IRUGO | S_IRUSR,
 			      acpi_device_dir(device));
-	if (!entry)
+	if (!entry) {
+		printk(KERN_ERR "Unable to create 'DOS' proc entry.\n");
 		return -ENODEV;
-	else {
+	} else {
 		acpi_video_bus_DOS_fops.write = acpi_video_bus_write_DOS;
 		entry->proc_fops = &acpi_video_bus_DOS_fops;
 		entry->data = acpi_driver_data(device);
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/cdrom/viocd.c linux-2.6.18-rc7/drivers/cdrom/viocd.c
--- linux-2.6.18-rc7-orig/drivers/cdrom/viocd.c	2006-09-15 15:28:38.000000000 +0530
+++ linux-2.6.18-rc7/drivers/cdrom/viocd.c	2006-09-19 12:24:42.000000000 +0530
@@ -788,7 +788,8 @@ static int __init viocd_init(void)
 	if (e) {
 		e->owner = THIS_MODULE;
 		e->proc_fops = &proc_viocd_operations;
-	}
+	} else
+		printk(KERN_WARNING "Unable to create 'iSeries/viocd' proc entry.\n");
 
 	return 0;
 
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/ide/ide-proc.c linux-2.6.18-rc7/drivers/ide/ide-proc.c
--- linux-2.6.18-rc7-orig/drivers/ide/ide-proc.c	2006-09-15 15:28:38.000000000 +0530
+++ linux-2.6.18-rc7/drivers/ide/ide-proc.c	2006-09-18 12:47:41.000000000 +0530
@@ -403,7 +403,10 @@ void ide_add_proc_entries(struct proc_di
 		return;
 	while (p->name != NULL) {
 		ent = create_proc_entry(p->name, p->mode, dir);
-		if (!ent) return;
+		if (!ent) {
+			printk(KERN_ERR "Unable to create '%s' proc entry.\n", p->name);
+			return;
+		}
 		ent->nlink = 1;
 		ent->data = data;
 		ent->read_proc = p->read_proc;
@@ -554,6 +557,8 @@ void proc_ide_create(void)
 	entry = create_proc_entry("drivers", 0, proc_ide_root);
 	if (entry)
 		entry->proc_fops = &ide_drivers_operations;
+	else
+		printk(KERN_WARNING "Unable to create 'drivers' proc entry.\n");
 }
 
 void proc_ide_destroy(void)
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/block/pktcdvd.c linux-2.6.18-rc7/drivers/block/pktcdvd.c
--- linux-2.6.18-rc7-orig/drivers/block/pktcdvd.c	2006-09-15 15:28:38.000000000 +0530
+++ linux-2.6.18-rc7/drivers/block/pktcdvd.c	2006-09-18 12:38:30.000000000 +0530
@@ -2363,7 +2363,9 @@ static int pkt_new_dev(struct pktcdvd_de
 	if (proc) {
 		proc->data = pd;
 		proc->proc_fops = &pkt_proc_fops;
-	}
+	} else
+		printk(KERN_WARNING "pktcdvd: Unable to create '%s' proc entry.\n", pd->name);
+
 	DPRINTK("pktcdvd: writer %s mapped to %s\n", pd->name, bdevname(bdev, b));
 	return 0;
 
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/char/i8k.c linux-2.6.18-rc7/drivers/char/i8k.c
--- linux-2.6.18-rc7-orig/drivers/char/i8k.c	2006-09-15 15:28:38.000000000 +0530
+++ linux-2.6.18-rc7/drivers/char/i8k.c	2006-09-18 12:41:30.000000000 +0530
@@ -513,8 +513,10 @@ static int __init i8k_init(void)
 
 	/* Register the proc entry */
 	proc_i8k = create_proc_entry("i8k", 0, NULL);
-	if (!proc_i8k)
+	if (!proc_i8k) {
+		printk(KERN_ERR "Unable to create 'i8k' proc entry.\n");
 		return -ENOENT;
+	}
 
 	proc_i8k->proc_fops = &i8k_fops;
 	proc_i8k->owner = THIS_MODULE;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/char/ipmi/ipmi_msghandler.c linux-2.6.18-rc7/drivers/char/ipmi/ipmi_msghandler.c
--- linux-2.6.18-rc7-orig/drivers/char/ipmi/ipmi_msghandler.c	2006-09-15 15:28:38.000000000 +0530
+++ linux-2.6.18-rc7/drivers/char/ipmi/ipmi_msghandler.c	2006-09-18 12:43:00.000000000 +0530
@@ -1672,6 +1672,7 @@ int ipmi_smi_add_proc_entry(ipmi_smi_t s
 
 	file = create_proc_entry(name, 0, smi->proc_dir);
 	if (!file) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n", name);
 		kfree(entry->name);
 		kfree(entry);
 		rv = -ENOMEM;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/char/misc.c linux-2.6.18-rc7/drivers/char/misc.c
--- linux-2.6.18-rc7-orig/drivers/char/misc.c	2006-09-15 15:28:38.000000000 +0530
+++ linux-2.6.18-rc7/drivers/char/misc.c	2006-09-18 12:43:46.000000000 +0530
@@ -283,6 +283,8 @@ static int __init misc_init(void)
 	ent = create_proc_entry("misc", 0, NULL);
 	if (ent)
 		ent->proc_fops = &misc_proc_fops;
+	else
+		printk(KERN_WARNING "Unable to create 'misc' proc entry.\n");
 #endif
 	misc_class = class_create(THIS_MODULE, "misc");
 	if (IS_ERR(misc_class))
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/char/rtc.c linux-2.6.18-rc7/drivers/char/rtc.c
--- linux-2.6.18-rc7-orig/drivers/char/rtc.c	2006-09-15 15:28:38.000000000 +0530
+++ linux-2.6.18-rc7/drivers/char/rtc.c	2006-09-18 12:44:47.000000000 +0530
@@ -1018,6 +1018,7 @@ no_irq:
 
 	ent = create_proc_entry("driver/rtc", 0, NULL);
 	if (!ent) {
+		printk(KERN_ERR "Unable to create 'driver/rtc' proc entry.\n");
 #ifdef RTC_IRQ
 		free_irq(RTC_IRQ, NULL);
 #endif
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/char/viotape.c linux-2.6.18-rc7/drivers/char/viotape.c
--- linux-2.6.18-rc7-orig/drivers/char/viotape.c	2006-09-15 15:28:38.000000000 +0530
+++ linux-2.6.18-rc7/drivers/char/viotape.c	2006-09-18 12:45:30.000000000 +0530
@@ -1056,7 +1056,8 @@ int __init viotap_init(void)
 	if (e) {
 		e->owner = THIS_MODULE;
 		e->proc_fops = &proc_viotape_operations;
-	}
+	} else
+		printk(KERN_WARNING "Unable to create 'iSeries/viotape' proc entry.\n");
 
 	return 0;
 
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/input/input.c linux-2.6.18-rc7/drivers/input/input.c
--- linux-2.6.18-rc7-orig/drivers/input/input.c	2006-09-15 15:28:39.000000000 +0530
+++ linux-2.6.18-rc7/drivers/input/input.c	2006-09-18 12:49:30.000000000 +0530
@@ -547,15 +547,19 @@ static int __init input_proc_init(void)
 	proc_bus_input_dir->owner = THIS_MODULE;
 
 	entry = create_proc_entry("devices", 0, proc_bus_input_dir);
-	if (!entry)
+	if (!entry) {
+		printk(KERN_ERR "Unable to create 'devices' proc entry.\n");
 		goto fail1;
+	}
 
 	entry->owner = THIS_MODULE;
 	entry->proc_fops = &input_devices_fileops;
 
 	entry = create_proc_entry("handlers", 0, proc_bus_input_dir);
-	if (!entry)
+	if (!entry) {
+		printk(KERN_ERR "Unable to create 'handlers' proc entry.\n");
 		goto fail2;
+	}
 
 	entry->owner = THIS_MODULE;
 	entry->proc_fops = &input_handlers_fileops;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/isdn/capi/capi.c linux-2.6.18-rc7/drivers/isdn/capi/capi.c
--- linux-2.6.18-rc7-orig/drivers/isdn/capi/capi.c	2006-09-15 15:28:39.000000000 +0530
+++ linux-2.6.18-rc7/drivers/isdn/capi/capi.c	2006-09-18 12:50:49.000000000 +0530
@@ -1465,7 +1465,10 @@ static void __init proc_init(void)
     for (i=0; i < nelem; i++) {
         struct procfsentries *p = procfsentries + i;
 	p->procent = create_proc_entry(p->name, p->mode, NULL);
-	if (p->procent) p->procent->read_proc = p->read_proc;
+	if (p->procent) 
+		p->procent->read_proc = p->read_proc;
+	else
+		printk(KERN_WARNING "Unable to create '%s' proc entry.\n", p->name);
     }
 }
 
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/isdn/capi/capidrv.c linux-2.6.18-rc7/drivers/isdn/capi/capidrv.c
--- linux-2.6.18-rc7-orig/drivers/isdn/capi/capidrv.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc7/drivers/isdn/capi/capidrv.c	2006-09-18 12:52:51.000000000 +0530
@@ -2226,7 +2226,10 @@ static void __init proc_init(void)
     for (i=0; i < nelem; i++) {
         struct procfsentries *p = procfsentries + i;
 	p->procent = create_proc_entry(p->name, p->mode, NULL);
-	if (p->procent) p->procent->read_proc = p->read_proc;
+	if (p->procent) 
+		p->procent->read_proc = p->read_proc;
+	else
+		printk(KERN_WARNING "Unable to create '%s' proc entry.\n", p->name);
     }
 }
 
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/isdn/capi/kcapi.c linux-2.6.18-rc7/drivers/isdn/capi/kcapi.c
--- linux-2.6.18-rc7-orig/drivers/isdn/capi/kcapi.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc7/drivers/isdn/capi/kcapi.c	2006-09-18 12:53:37.000000000 +0530
@@ -427,7 +427,8 @@ attach_capi_ctr(struct capi_ctr *card)
 		(int (*)(char *,char **,off_t,int,int *,void *))
 			card->ctr_read_proc;
 	   card->procent->data = card;
-	}
+	} else
+		printk(KERN_WARNING "Unable to create '%s' proc entry.\n", card->procfn);
 
 	ncards++;
 	printk(KERN_NOTICE "kcapi: Controller %d: %s attached\n",
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/isdn/capi/kcapi_proc.c linux-2.6.18-rc7/drivers/isdn/capi/kcapi_proc.c
--- linux-2.6.18-rc7-orig/drivers/isdn/capi/kcapi_proc.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc7/drivers/isdn/capi/kcapi_proc.c	2006-09-18 12:56:13.000000000 +0530
@@ -239,6 +239,8 @@ create_seq_entry(char *name, mode_t mode
 	entry = create_proc_entry(name, mode, NULL);
 	if (entry)
 		entry->proc_fops = f;
+	else
+		printk(KERN_WARNING "Unable to create '%s' proc entry.\n", name);
 }
 
 // ---------------------------------------------------------------------------
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/isdn/divert/divert_procfs.c linux-2.6.18-rc7/drivers/isdn/divert/divert_procfs.c
--- linux-2.6.18-rc7-orig/drivers/isdn/divert/divert_procfs.c	2006-09-15 15:28:39.000000000 +0530
+++ linux-2.6.18-rc7/drivers/isdn/divert/divert_procfs.c	2006-09-18 12:57:00.000000000 +0530
@@ -290,6 +290,7 @@ divert_dev_init(void)
 		return (-1);
 	isdn_divert_entry = create_proc_entry("divert", S_IFREG | S_IRUGO, isdn_proc_entry);
 	if (!isdn_divert_entry) {
+		printk(KERN_ERR "Unable to create 'divert' proc entry.\n");
 		remove_proc_entry("net/isdn", NULL);
 		return (-1);
 	}
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/isdn/hardware/eicon/diva_didd.c linux-2.6.18-rc7/drivers/isdn/hardware/eicon/diva_didd.c
--- linux-2.6.18-rc7-orig/drivers/isdn/hardware/eicon/diva_didd.c	2006-09-15 15:28:39.000000000 +0530
+++ linux-2.6.18-rc7/drivers/isdn/hardware/eicon/diva_didd.c	2006-09-18 12:58:31.000000000 +0530
@@ -93,7 +93,8 @@ static int DIVA_INIT_FUNCTION create_pro
 		     create_proc_entry(DRIVERLNAME, S_IFREG | S_IRUGO,
 				       proc_net_eicon))) {
 			proc_didd->read_proc = proc_read;
-		}
+		} else
+			printk(KERN_WARNING "Unable to create '%s' proc entry.\n", DRIVERLNAME);
 		return (1);
 	}
 	return (0);
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/isdn/hardware/eicon/divasi.c linux-2.6.18-rc7/drivers/isdn/hardware/eicon/divasi.c
--- linux-2.6.18-rc7-orig/drivers/isdn/hardware/eicon/divasi.c	2006-09-15 15:28:39.000000000 +0530
+++ linux-2.6.18-rc7/drivers/isdn/hardware/eicon/divasi.c	2006-09-18 12:59:18.000000000 +0530
@@ -114,8 +114,10 @@ static int DIVA_INIT_FUNCTION create_um_
 	um_idi_proc_entry = create_proc_entry(DRIVERLNAME,
 					      S_IFREG | S_IRUGO | S_IWUSR,
 					      proc_net_eicon);
-	if (!um_idi_proc_entry)
+	if (!um_idi_proc_entry) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n", DRIVERLNAME);
 		return (0);
+	}
 
 	um_idi_proc_entry->read_proc = um_idi_proc_read;
 	um_idi_proc_entry->owner = THIS_MODULE;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/isdn/hardware/eicon/divasproc.c linux-2.6.18-rc7/drivers/isdn/hardware/eicon/divasproc.c
--- linux-2.6.18-rc7-orig/drivers/isdn/hardware/eicon/divasproc.c	2006-09-15 15:28:39.000000000 +0530
+++ linux-2.6.18-rc7/drivers/isdn/hardware/eicon/divasproc.c	2006-09-18 13:01:14.000000000 +0530
@@ -128,8 +128,10 @@ int create_divas_proc(void)
 	divas_proc_entry = create_proc_entry(divas_proc_name,
 					     S_IFREG | S_IRUGO,
 					     proc_net_eicon);
-	if (!divas_proc_entry)
+	if (!divas_proc_entry) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n", divas_proc_name);
 		return (0);
+	}
 
 	divas_proc_entry->proc_fops = &divas_fops;
 	divas_proc_entry->owner = THIS_MODULE;
@@ -385,8 +387,10 @@ int create_adapter_proc(diva_os_xdi_adap
 	a->proc_adapter_dir = (void *) de;
 
 	if (!(pe -	     create_proc_entry(info_proc_name, S_IFREG | S_IRUGO | S_IWUSR, de)))
+	     create_proc_entry(info_proc_name, S_IFREG | S_IRUGO | S_IWUSR, de))) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n", info_proc_name);
 		return (0);
+	}
 	a->proc_info = (void *) pe;
 	pe->write_proc = info_write;
 	pe->read_proc = info_read;
@@ -398,14 +402,17 @@ int create_adapter_proc(diva_os_xdi_adap
 		pe->write_proc = write_grp_opt;
 		pe->read_proc = read_grp_opt;
 		pe->data = a;
-	}
+	} else
+		printk(KERN_WARNING "Unable to create '%s' proc entry.\n", grp_opt_proc_name);
+					   
 	if ((pe = create_proc_entry(d_l1_down_proc_name,
 			       S_IFREG | S_IRUGO | S_IWUSR, de))) {
 		a->proc_d_l1_down = (void *) pe;
 		pe->write_proc = write_d_l1_down;
 		pe->read_proc = read_d_l1_down;
 		pe->data = a;
-	}
+	} else
+		printk(KERN_WARNING "Unable to create '%s' proc entry.\n", d_l1_down_proc_name);
 
 	DBG_TRC(("proc entry %s created", tmp));
 
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/isdn/hysdn/hysdn_procconf.c linux-2.6.18-rc7/drivers/isdn/hysdn/hysdn_procconf.c
--- linux-2.6.18-rc7-orig/drivers/isdn/hysdn/hysdn_procconf.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc7/drivers/isdn/hysdn/hysdn_procconf.c	2006-09-18 13:02:49.000000000 +0530
@@ -407,7 +407,8 @@ hysdn_procconf_init(void)
 			((struct proc_dir_entry *) card->procconf)->proc_fops = &conf_fops;
 			((struct proc_dir_entry *) card->procconf)->owner = THIS_MODULE;
 			hysdn_proclog_init(card);	/* init the log file entry */
-		}
+		} else
+			printk(KERN_WARNING "Unable to create '%s' proc entry.\n", conf_name);
 		card = card->next;	/* next entry */
 	}
 
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/isdn/hysdn/hysdn_proclog.c linux-2.6.18-rc7/drivers/isdn/hysdn/hysdn_proclog.c
--- linux-2.6.18-rc7-orig/drivers/isdn/hysdn/hysdn_proclog.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc7/drivers/isdn/hysdn/hysdn_proclog.c	2006-09-18 13:03:30.000000000 +0530
@@ -414,7 +414,8 @@ hysdn_proclog_init(hysdn_card * card)
 		if ((pd->log = create_proc_entry(pd->log_name, S_IFREG | S_IRUGO | S_IWUSR, hysdn_proc_entry)) != NULL) {
 		        pd->log->proc_fops = &log_fops; 
 		        pd->log->owner = THIS_MODULE;
-		}
+		} else
+			printk(KERN_WARNING "Unable to create '%s' proc entry.\n", pd->log_name);
 
 		init_waitqueue_head(&(pd->rd_queue));
 


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
