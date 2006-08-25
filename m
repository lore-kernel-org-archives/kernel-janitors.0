From: ville palo <ville.palo@vi64pa.net>
Date: Fri, 25 Aug 2006 18:47:15 +0000
Subject: [KJ] [PATCH] Added KERN_* constants to printk() functions
Message-Id: <1156531635.25308.11.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Added some missing KERN_* constants to printk() functions.
I hope priorities are ok :)


Signed-off-by Ville Palo <ville.palo@vi64pa.net>

diff --git a/drivers/acpi/container.c b/drivers/acpi/container.c
index 871aa52..295738e 100644
--- a/drivers/acpi/container.c
+++ b/drivers/acpi/container.c
@@ -160,7 +160,7 @@ static void container_notify_cb(acpi_han
 	case ACPI_NOTIFY_BUS_CHECK:
 		/* Fall through */
 	case ACPI_NOTIFY_DEVICE_CHECK:
-		printk("Container driver received %s event\n",
+		printk(KERN_INFO "Container driver received %s event\n",
 		       (type = ACPI_NOTIFY_BUS_CHECK) ?
 		       "ACPI_NOTIFY_BUS_CHECK" : "ACPI_NOTIFY_DEVICE_CHECK");
 		status = acpi_bus_get_device(handle, &device);
@@ -171,7 +171,7 @@ static void container_notify_cb(acpi_han
 					kobject_uevent(&device->kobj,
 						       KOBJ_ONLINE);
 				else
-					printk("Failed to add container\n");
+					printk(KERN_ERR "Failed to add container\n");
 			}
 		} else {
 			if (ACPI_SUCCESS(status)) {
diff --git a/drivers/acpi/hotkey.c b/drivers/acpi/hotkey.c
index 32c9d88..fceebe3 100644
--- a/drivers/acpi/hotkey.c
+++ b/drivers/acpi/hotkey.c
@@ -982,7 +982,7 @@ static int __init hotkey_init(void)
 		return -ENODEV;
 
 	if (acpi_specific_hotkey_enabled) {
-		printk("Using specific hotkey driver\n");
+		printk(KERN_WARNING "Using specific hotkey driver\n");
 		return -ENODEV;
 	}
 
diff --git a/drivers/acpi/pci_link.c b/drivers/acpi/pci_link.c
index 7f3e7e7..c94b72d 100644
--- a/drivers/acpi/pci_link.c
+++ b/drivers/acpi/pci_link.c
@@ -736,7 +736,7 @@ static int acpi_pci_link_add(struct acpi
 	/* query and set link->irq.active */
 	acpi_pci_link_get_current(link);
 
-	printk(PREFIX "%s [%s] (IRQs", acpi_device_name(device),
+	printk(KERN_INFO PREFIX "%s [%s] (IRQs", acpi_device_name(device),
 	       acpi_device_bid(device));
 	for (i = 0; i < link->irq.possible_count; i++) {
 		if (link->irq.active = link->irq.possible[i]) {
diff --git a/drivers/acpi/processor_idle.c b/drivers/acpi/processor_idle.c
diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 5fcb50c..a3dfee9 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -791,7 +791,7 @@ static void acpi_device_set_id(struct ac
 	case ACPI_BUS_TYPE_DEVICE:
 		status = acpi_get_object_info(handle, &buffer);
 		if (ACPI_FAILURE(status)) {
-			printk("%s: Error reading device info\n", __FUNCTION__);
+			printk(KERN_ERR "%s: Error reading device info\n", __FUNCTION__);
 			return;
 		}
 
@@ -875,7 +875,7 @@ static int acpi_device_set_context(struc
 					  acpi_bus_data_handler, device);
 
 		if (ACPI_FAILURE(status)) {
-			printk("Error attaching device data\n");
+			printk(KERN_ERR "Error attaching device data\n");
 			result = -ENODEV;
 		}
 	}
diff --git a/drivers/acpi/sleep/main.c b/drivers/acpi/sleep/main.c
index 62ce87d..241599f 100644
--- a/drivers/acpi/sleep/main.c
+++ b/drivers/acpi/sleep/main.c
@@ -52,7 +52,7 @@ static int acpi_pm_prepare(suspend_state
 	u32 acpi_state = acpi_suspend_states[pm_state];
 
 	if (!sleep_states[acpi_state]) {
-		printk("acpi_pm_prepare does not support %d \n", pm_state);
+		printk(KERN_WARNING "acpi_pm_prepare does not support %d \n", pm_state);
 		return -EPERM;
 	}
 	return acpi_sleep_prepare(acpi_state);
@@ -146,7 +146,7 @@ static int acpi_pm_finish(suspend_state_
 	acpi_set_firmware_waking_vector((acpi_physical_address) 0);
 
 	if (init_8259A_after_S1) {
-		printk("Broken toshiba laptop -> kicking interrupts\n");
+		printk(KERN_WARNING "Broken toshiba laptop -> kicking interrupts\n");
 		init_8259A(0);
 	}
 	return 0;
diff --git a/drivers/acpi/sleep/poweroff.c b/drivers/acpi/sleep/poweroff.c
index 47fb4b3..a7bae31 100644
--- a/drivers/acpi/sleep/poweroff.c
+++ b/drivers/acpi/sleep/poweroff.c
@@ -43,7 +43,7 @@ int acpi_sleep_prepare(u32 acpi_state)
 void acpi_power_off(void)
 {
 	/* acpi_sleep_prepare(ACPI_STATE_S5) should have already been called */
-	printk("%s called\n", __FUNCTION__);
+	printk(KERN_INFO "%s called\n", __FUNCTION__);
 	local_irq_disable();
 	/* Some SMP machines only can poweroff in boot CPU */
 	acpi_enter_sleep_state(ACPI_STATE_S5);


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
