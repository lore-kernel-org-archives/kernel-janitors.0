From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Tue, 28 Feb 2006 13:54:02 +0000
Subject: [KJ] [Patch] kzalloc() conversion in drivers/acpi
Message-Id: <1141134842.16095.2.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============84033780390306556=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140815848.26064.4.camel@alice>
In-Reply-To: <1140815848.26064.4.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============84033780390306556==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch converts drivers/acpi to kzalloc usage.
Compile tested with allyes config.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc4-mm2/drivers/acpi/utils.c.orig	2006-02-28 14:38:06.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/acpi/utils.c	2006-02-28 14:38:31.000000000 +0100
@@ -264,11 +264,10 @@ acpi_evaluate_integer(acpi_handle handle
 	if (!data)
 		return_ACPI_STATUS(AE_BAD_PARAMETER);
 
-	element = kmalloc(sizeof(union acpi_object), GFP_KERNEL);
+	element = kzalloc(sizeof(union acpi_object), GFP_KERNEL);
 	if (!element)
 		return_ACPI_STATUS(AE_NO_MEMORY);
 
-	memset(element, 0, sizeof(union acpi_object));
 	buffer.length = sizeof(union acpi_object);
 	buffer.pointer = element;
 	status = acpi_evaluate_object(handle, pathname, arguments, &buffer);
@@ -322,12 +321,11 @@ acpi_evaluate_string(acpi_handle handle,
 		return_ACPI_STATUS(AE_BAD_DATA);
 	}
 
-	*data = kmalloc(element->string.length + 1, GFP_KERNEL);
+	*data = kzalloc(element->string.length + 1, GFP_KERNEL);
 	if (!data) {
 		ACPI_ERROR((AE_INFO, "Memory allocation"));
 		return_VALUE(-ENOMEM);
 	}
-	memset(*data, 0, element->string.length + 1);
 
 	memcpy(*data, element->string.pointer, element->string.length);
 
--- linux-2.6.16-rc4-mm2/drivers/acpi/pci_irq.c.orig	2006-02-28 14:38:40.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/acpi/pci_irq.c	2006-02-28 14:39:12.000000000 +0100
@@ -92,10 +92,9 @@ acpi_pci_irq_add_entry(acpi_handle handl
 	if (!prt)
 		return_VALUE(-EINVAL);
 
-	entry = kmalloc(sizeof(struct acpi_prt_entry), GFP_KERNEL);
+	entry = kzalloc(sizeof(struct acpi_prt_entry), GFP_KERNEL);
 	if (!entry)
 		return_VALUE(-ENOMEM);
-	memset(entry, 0, sizeof(struct acpi_prt_entry));
 
 	entry->id.segment = segment;
 	entry->id.bus = bus;
@@ -165,10 +164,9 @@ int acpi_pci_irq_add_prt(acpi_handle han
 
 	ACPI_FUNCTION_TRACE("acpi_pci_irq_add_prt");
 
-	pathname = (char *)kmalloc(ACPI_PATHNAME_MAX, GFP_KERNEL);
+	pathname = kzalloc(ACPI_PATHNAME_MAX, GFP_KERNEL);
 	if (!pathname)
 		return_VALUE(-ENOMEM);
-	memset(pathname, 0, ACPI_PATHNAME_MAX);
 
 	if (first_time) {
 		acpi_prt.count = 0;
@@ -202,11 +200,9 @@ int acpi_pci_irq_add_prt(acpi_handle han
 		return_VALUE(-ENODEV);
 	}
 
-	prt = kmalloc(buffer.length, GFP_KERNEL);
-	if (!prt) {
+	prt = kzalloc(buffer.length, GFP_KERNEL);
+	if (!prt)
 		return_VALUE(-ENOMEM);
-	}
-	memset(prt, 0, buffer.length);
 	buffer.pointer = prt;
 
 	status = acpi_get_irq_routing_table(handle, &buffer);
--- linux-2.6.16-rc4-mm2/drivers/acpi/asus_acpi.c.orig	2006-02-28 14:39:20.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/acpi/asus_acpi.c	2006-02-28 14:39:41.000000000 +0100
@@ -1132,11 +1132,9 @@ static int __init asus_hotk_add(struct a
 	printk(KERN_NOTICE "Asus Laptop ACPI Extras version %s\n",
 	       ASUS_ACPI_VERSION);
 
-	hotk =
-	    (struct asus_hotk *)kmalloc(sizeof(struct asus_hotk), GFP_KERNEL);
+	hotk = kzalloc(sizeof(struct asus_hotk), GFP_KERNEL);
 	if (!hotk)
 		return -ENOMEM;
-	memset(hotk, 0, sizeof(struct asus_hotk));
 
 	hotk->handle = device->handle;
 	strcpy(acpi_device_name(device), ACPI_HOTK_DEVICE_NAME);
--- linux-2.6.16-rc4-mm2/drivers/acpi/acpi_memhotplug.c.orig	2006-02-28 14:39:50.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/acpi/acpi_memhotplug.c	2006-02-28 14:40:00.000000000 +0100
@@ -342,10 +342,9 @@ static int acpi_memory_device_add(struct
 	if (!device)
 		return_VALUE(-EINVAL);
 
-	mem_device = kmalloc(sizeof(struct acpi_memory_device), GFP_KERNEL);
+	mem_device = kzalloc(sizeof(struct acpi_memory_device), GFP_KERNEL);
 	if (!mem_device)
 		return_VALUE(-ENOMEM);
-	memset(mem_device, 0, sizeof(struct acpi_memory_device));
 
 	mem_device->handle = device->handle;
 	sprintf(acpi_device_name(device), "%s", ACPI_MEMORY_DEVICE_NAME);
--- linux-2.6.16-rc4-mm2/drivers/acpi/scan.c.orig	2006-02-28 14:40:08.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/acpi/scan.c	2006-02-28 14:41:38.000000000 +0100
@@ -982,12 +982,11 @@ acpi_add_single_object(struct acpi_devic
 	if (!child)
 		return_VALUE(-EINVAL);
 
-	device = kmalloc(sizeof(struct acpi_device), GFP_KERNEL);
+	device = kzalloc(sizeof(struct acpi_device), GFP_KERNEL);
 	if (!device) {
 		ACPI_ERROR((AE_INFO, "Memory allocation error"));
 		return_VALUE(-ENOMEM);
 	}
-	memset(device, 0, sizeof(struct acpi_device));
 
 	device->handle = handle;
 	device->parent = parent;
--- linux-2.6.16-rc4-mm2/drivers/acpi/battery.c.orig	2006-02-28 14:41:47.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/acpi/battery.c	2006-02-28 14:42:13.000000000 +0100
@@ -156,12 +156,11 @@ acpi_battery_get_info(struct acpi_batter
 		goto end;
 	}
 
-	data.pointer = kmalloc(data.length, GFP_KERNEL);
+	data.pointer = kzalloc(data.length, GFP_KERNEL);
 	if (!data.pointer) {
 		result = -ENOMEM;
 		goto end;
 	}
-	memset(data.pointer, 0, data.length);
 
 	status = acpi_extract_package(package, &format, &data);
 	if (ACPI_FAILURE(status)) {
@@ -217,12 +216,11 @@ acpi_battery_get_status(struct acpi_batt
 		goto end;
 	}
 
-	data.pointer = kmalloc(data.length, GFP_KERNEL);
+	data.pointer = kzalloc(data.length, GFP_KERNEL);
 	if (!data.pointer) {
 		result = -ENOMEM;
 		goto end;
 	}
-	memset(data.pointer, 0, data.length);
 
 	status = acpi_extract_package(package, &format, &data);
 	if (ACPI_FAILURE(status)) {
@@ -702,10 +700,9 @@ static int acpi_battery_add(struct acpi_
 	if (!device)
 		return_VALUE(-EINVAL);
 
-	battery = kmalloc(sizeof(struct acpi_battery), GFP_KERNEL);
+	battery = kzalloc(sizeof(struct acpi_battery), GFP_KERNEL);
 	if (!battery)
 		return_VALUE(-ENOMEM);
-	memset(battery, 0, sizeof(struct acpi_battery));
 
 	battery->handle = device->handle;
 	strcpy(acpi_device_name(device), ACPI_BATTERY_DEVICE_NAME);
--- linux-2.6.16-rc4-mm2/drivers/acpi/button.c.orig	2006-02-28 14:42:22.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/acpi/button.c	2006-02-28 14:42:29.000000000 +0100
@@ -304,10 +304,9 @@ static int acpi_button_add(struct acpi_d
 	if (!device)
 		return_VALUE(-EINVAL);
 
-	button = kmalloc(sizeof(struct acpi_button), GFP_KERNEL);
+	button = kzalloc(sizeof(struct acpi_button), GFP_KERNEL);
 	if (!button)
 		return_VALUE(-ENOMEM);
-	memset(button, 0, sizeof(struct acpi_button));
 
 	button->device = device;
 	button->handle = device->handle;
--- linux-2.6.16-rc4-mm2/drivers/acpi/ec.c.orig	2006-02-28 14:42:37.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/acpi/ec.c	2006-02-28 14:43:12.000000000 +0100
@@ -996,10 +996,9 @@ static int acpi_ec_poll_add(struct acpi_
 	if (!device)
 		return_VALUE(-EINVAL);
 
-	ec = kmalloc(sizeof(union acpi_ec), GFP_KERNEL);
+	ec = kzalloc(sizeof(union acpi_ec), GFP_KERNEL);
 	if (!ec)
 		return_VALUE(-ENOMEM);
-	memset(ec, 0, sizeof(union acpi_ec));
 
 	ec->common.handle = device->handle;
 	ec->common.uid = -1;
@@ -1066,10 +1065,9 @@ static int acpi_ec_intr_add(struct acpi_
 	if (!device)
 		return_VALUE(-EINVAL);
 
-	ec = kmalloc(sizeof(union acpi_ec), GFP_KERNEL);
+	ec = kzalloc(sizeof(union acpi_ec), GFP_KERNEL);
 	if (!ec)
 		return_VALUE(-ENOMEM);
-	memset(ec, 0, sizeof(union acpi_ec));
 
 	ec->common.handle = device->handle;
 	ec->common.uid = -1;
@@ -1357,12 +1355,11 @@ static int __init acpi_ec_fake_ecdt(void
 
 	printk(KERN_INFO PREFIX "Try to make an fake ECDT\n");
 
-	ec_ecdt = kmalloc(sizeof(union acpi_ec), GFP_KERNEL);
+	ec_ecdt = kzalloc(sizeof(union acpi_ec), GFP_KERNEL);
 	if (!ec_ecdt) {
 		ret = -ENOMEM;
 		goto error;
 	}
-	memset(ec_ecdt, 0, sizeof(union acpi_ec));
 
 	status = acpi_get_devices(ACPI_EC_HID,
 				  acpi_fake_ecdt_callback, NULL, NULL);
@@ -1402,10 +1399,9 @@ static int __init acpi_ec_poll_get_real_
 	/*
 	 * Generate a temporary ec context to use until the namespace is scanned
 	 */
-	ec_ecdt = kmalloc(sizeof(union acpi_ec), GFP_KERNEL);
+	ec_ecdt = kzalloc(sizeof(union acpi_ec), GFP_KERNEL);
 	if (!ec_ecdt)
 		return -ENOMEM;
-	memset(ec_ecdt, 0, sizeof(union acpi_ec));
 
 	ec_ecdt->common.command_addr = ecdt_ptr->ec_control;
 	ec_ecdt->common.status_addr = ecdt_ptr->ec_control;
@@ -1447,10 +1443,9 @@ static int __init acpi_ec_intr_get_real_
 	/*
 	 * Generate a temporary ec context to use until the namespace is scanned
 	 */
-	ec_ecdt = kmalloc(sizeof(union acpi_ec), GFP_KERNEL);
+	ec_ecdt = kzalloc(sizeof(union acpi_ec), GFP_KERNEL);
 	if (!ec_ecdt)
 		return -ENOMEM;
-	memset(ec_ecdt, 0, sizeof(union acpi_ec));
 
 	init_MUTEX(&ec_ecdt->intr.sem);
 	init_waitqueue_head(&ec_ecdt->intr.wait);
--- linux-2.6.16-rc4-mm2/drivers/acpi/pci_link.c.orig	2006-02-28 14:43:20.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/acpi/pci_link.c	2006-02-28 14:43:41.000000000 +0100
@@ -314,11 +314,10 @@ static int acpi_pci_link_set(struct acpi
 	if (!link || !irq)
 		return_VALUE(-EINVAL);
 
-	resource = kmalloc(sizeof(*resource) + 1, GFP_ATOMIC);
+	resource = kzalloc(sizeof(*resource) + 1, GFP_ATOMIC);
 	if (!resource)
 		return_VALUE(-ENOMEM);
 
-	memset(resource, 0, sizeof(*resource) + 1);
 	buffer.length = sizeof(*resource) + 1;
 	buffer.pointer = resource;
 
@@ -730,10 +729,9 @@ static int acpi_pci_link_add(struct acpi
 	if (!device)
 		return_VALUE(-EINVAL);
 
-	link = kmalloc(sizeof(struct acpi_pci_link), GFP_KERNEL);
+	link = kzalloc(sizeof(struct acpi_pci_link), GFP_KERNEL);
 	if (!link)
 		return_VALUE(-ENOMEM);
-	memset(link, 0, sizeof(struct acpi_pci_link));
 
 	link->device = device;
 	link->handle = device->handle;
--- linux-2.6.16-rc4-mm2/drivers/acpi/ac.c.orig	2006-02-28 14:43:52.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/acpi/ac.c	2006-02-28 14:44:00.000000000 +0100
@@ -224,10 +224,9 @@ static int acpi_ac_add(struct acpi_devic
 	if (!device)
 		return_VALUE(-EINVAL);
 
-	ac = kmalloc(sizeof(struct acpi_ac), GFP_KERNEL);
+	ac = kzalloc(sizeof(struct acpi_ac), GFP_KERNEL);
 	if (!ac)
 		return_VALUE(-ENOMEM);
-	memset(ac, 0, sizeof(struct acpi_ac));
 
 	ac->handle = device->handle;
 	strcpy(acpi_device_name(device), ACPI_AC_DEVICE_NAME);
--- linux-2.6.16-rc4-mm2/drivers/acpi/thermal.c.orig	2006-02-28 14:44:06.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/acpi/thermal.c	2006-02-28 14:44:42.000000000 +0100
@@ -933,12 +933,10 @@ acpi_thermal_write_trip_points(struct fi
 
 	ACPI_FUNCTION_TRACE("acpi_thermal_write_trip_points");
 
-	limit_string = kmalloc(ACPI_THERMAL_MAX_LIMIT_STR_LEN, GFP_KERNEL);
+	limit_string = kzalloc(ACPI_THERMAL_MAX_LIMIT_STR_LEN, GFP_KERNEL);
 	if (!limit_string)
 		return_VALUE(-ENOMEM);
 
-	memset(limit_string, 0, ACPI_THERMAL_MAX_LIMIT_STR_LEN);
-
 	active = kmalloc(ACPI_THERMAL_MAX_ACTIVE * sizeof(int), GFP_KERNEL);
 	if (!active)
 		return_VALUE(-ENOMEM);
@@ -1310,10 +1308,9 @@ static int acpi_thermal_add(struct acpi_
 	if (!device)
 		return_VALUE(-EINVAL);
 
-	tz = kmalloc(sizeof(struct acpi_thermal), GFP_KERNEL);
+	tz = kzalloc(sizeof(struct acpi_thermal), GFP_KERNEL);
 	if (!tz)
 		return_VALUE(-ENOMEM);
-	memset(tz, 0, sizeof(struct acpi_thermal));
 
 	tz->handle = device->handle;
 	strcpy(tz->name, device->pnp.bus_id);
--- linux-2.6.16-rc4-mm2/drivers/acpi/ibm_acpi.c.orig	2006-02-28 14:44:50.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/acpi/ibm_acpi.c	2006-02-28 14:45:00.000000000 +0100
@@ -1750,13 +1750,12 @@ static int __init register_driver(struct
 {
 	int ret;
 
-	ibm->driver = kmalloc(sizeof(struct acpi_driver), GFP_KERNEL);
+	ibm->driver = kzalloc(sizeof(struct acpi_driver), GFP_KERNEL);
 	if (!ibm->driver) {
 		printk(IBM_ERR "kmalloc(ibm->driver) failed\n");
 		return -1;
 	}
 
-	memset(ibm->driver, 0, sizeof(struct acpi_driver));
 	sprintf(ibm->driver->name, "%s/%s", IBM_NAME, ibm->name);
 	ibm->driver->ids = ibm->hid;
 	ibm->driver->ops.add = &ibm_device_add;
--- linux-2.6.16-rc4-mm2/drivers/acpi/container.c.orig	2006-02-28 14:45:07.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/acpi/container.c	2006-02-28 14:45:16.000000000 +0100
@@ -98,11 +98,10 @@ static int acpi_container_add(struct acp
 		return_VALUE(-EINVAL);
 	}
 
-	container = kmalloc(sizeof(struct acpi_container), GFP_KERNEL);
+	container = kzalloc(sizeof(struct acpi_container), GFP_KERNEL);
 	if (!container)
 		return_VALUE(-ENOMEM);
 
-	memset(container, 0, sizeof(struct acpi_container));
 	container->handle = device->handle;
 	strcpy(acpi_device_name(device), ACPI_CONTAINER_DEVICE_NAME);
 	strcpy(acpi_device_class(device), ACPI_CONTAINER_CLASS);
--- linux-2.6.16-rc4-mm2/drivers/acpi/hotkey.c.orig	2006-02-28 14:45:22.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/acpi/hotkey.c	2006-02-28 14:46:00.000000000 +0100
@@ -247,10 +247,8 @@ static char *format_result(union acpi_ob
 {
 	char *buf = NULL;
 
-	buf = (char *)kmalloc(RESULT_STR_LEN, GFP_KERNEL);
-	if (buf)
-		memset(buf, 0, RESULT_STR_LEN);
-	else
+	buf = kzalloc(RESULT_STR_LEN, GFP_KERNEL);
+	if (!buf)
 		goto do_fail;
 
 	/* Now, just support integer type */
@@ -791,10 +789,9 @@ static ssize_t hotkey_write_config(struc
 		return_VALUE(-EINVAL);
 	}
 
-	key = kmalloc(sizeof(union acpi_hotkey), GFP_KERNEL);
+	key = kzalloc(sizeof(union acpi_hotkey), GFP_KERNEL);
 	if (!key)
 		goto do_fail;
-	memset(key, 0, sizeof(union acpi_hotkey));
 	if (cmd == 1) {
 		union acpi_hotkey *tmp = NULL;
 		tmp = get_hotkey_by_event(&global_hotkey_list,
--- linux-2.6.16-rc4-mm2/drivers/acpi/pci_root.c.orig	2006-02-28 14:46:16.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/acpi/pci_root.c	2006-02-28 14:46:24.000000000 +0100
@@ -165,10 +165,9 @@ static int acpi_pci_root_add(struct acpi
 	if (!device)
 		return_VALUE(-EINVAL);
 
-	root = kmalloc(sizeof(struct acpi_pci_root), GFP_KERNEL);
+	root = kzalloc(sizeof(struct acpi_pci_root), GFP_KERNEL);
 	if (!root)
 		return_VALUE(-ENOMEM);
-	memset(root, 0, sizeof(struct acpi_pci_root));
 	INIT_LIST_HEAD(&root->node);
 
 	root->handle = device->handle;
--- linux-2.6.16-rc4-mm2/drivers/acpi/power.c.orig	2006-02-28 14:46:31.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/acpi/power.c	2006-02-28 14:46:39.000000000 +0100
@@ -552,10 +552,9 @@ static int acpi_power_add(struct acpi_de
 	if (!device)
 		return_VALUE(-EINVAL);
 
-	resource = kmalloc(sizeof(struct acpi_power_resource), GFP_KERNEL);
+	resource = kzalloc(sizeof(struct acpi_power_resource), GFP_KERNEL);
 	if (!resource)
 		return_VALUE(-ENOMEM);
-	memset(resource, 0, sizeof(struct acpi_power_resource));
 
 	resource->handle = device->handle;
 	strcpy(resource->name, device->pnp.bus_id);
--- linux-2.6.16-rc4-mm2/drivers/acpi/pci_bind.c.orig	2006-02-28 14:46:46.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/acpi/pci_bind.c	2006-02-28 14:47:44.000000000 +0100
@@ -125,19 +125,17 @@ int acpi_pci_bind(struct acpi_device *de
 	if (!device || !device->parent)
 		return_VALUE(-EINVAL);
 
-	pathname = kmalloc(ACPI_PATHNAME_MAX, GFP_KERNEL);
+	pathname = kzalloc(ACPI_PATHNAME_MAX, GFP_KERNEL);
 	if (!pathname)
 		return_VALUE(-ENOMEM);
-	memset(pathname, 0, ACPI_PATHNAME_MAX);
 	buffer.length = ACPI_PATHNAME_MAX;
 	buffer.pointer = pathname;
 
-	data = kmalloc(sizeof(struct acpi_pci_data), GFP_KERNEL);
+	data = kzalloc(sizeof(struct acpi_pci_data), GFP_KERNEL);
 	if (!data) {
 		kfree(pathname);
 		return_VALUE(-ENOMEM);
 	}
-	memset(data, 0, sizeof(struct acpi_pci_data));
 
 	acpi_get_name(device->handle, ACPI_FULL_PATHNAME, &buffer);
 	ACPI_DEBUG_PRINT((ACPI_DB_INFO, "Binding PCI device [%s]...\n",
@@ -285,10 +283,9 @@ int acpi_pci_unbind(struct acpi_device *
 	if (!device || !device->parent)
 		return_VALUE(-EINVAL);
 
-	pathname = (char *)kmalloc(ACPI_PATHNAME_MAX, GFP_KERNEL);
+	pathname = kzalloc(ACPI_PATHNAME_MAX, GFP_KERNEL);
 	if (!pathname)
 		return_VALUE(-ENOMEM);
-	memset(pathname, 0, ACPI_PATHNAME_MAX);
 
 	buffer.length = ACPI_PATHNAME_MAX;
 	buffer.pointer = pathname;
@@ -337,10 +334,9 @@ acpi_pci_bind_root(struct acpi_device *d
 
 	ACPI_FUNCTION_TRACE("acpi_pci_bind_root");
 
-	pathname = (char *)kmalloc(ACPI_PATHNAME_MAX, GFP_KERNEL);
+	pathname = kzalloc(ACPI_PATHNAME_MAX, GFP_KERNEL);
 	if (!pathname)
 		return_VALUE(-ENOMEM);
-	memset(pathname, 0, ACPI_PATHNAME_MAX);
 
 	buffer.length = ACPI_PATHNAME_MAX;
 	buffer.pointer = pathname;
@@ -350,12 +346,11 @@ acpi_pci_bind_root(struct acpi_device *d
 		return_VALUE(-EINVAL);
 	}
 
-	data = kmalloc(sizeof(struct acpi_pci_data), GFP_KERNEL);
+	data = kzalloc(sizeof(struct acpi_pci_data), GFP_KERNEL);
 	if (!data) {
 		kfree(pathname);
 		return_VALUE(-ENOMEM);
 	}
-	memset(data, 0, sizeof(struct acpi_pci_data));
 
 	data->id = *id;
 	data->bus = bus;
--- linux-2.6.16-rc4-mm2/drivers/acpi/fan.c.orig	2006-02-28 14:47:54.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/acpi/fan.c	2006-02-28 14:48:03.000000000 +0100
@@ -187,10 +187,9 @@ static int acpi_fan_add(struct acpi_devi
 	if (!device)
 		return_VALUE(-EINVAL);
 
-	fan = kmalloc(sizeof(struct acpi_fan), GFP_KERNEL);
+	fan = kzalloc(sizeof(struct acpi_fan), GFP_KERNEL);
 	if (!fan)
 		return_VALUE(-ENOMEM);
-	memset(fan, 0, sizeof(struct acpi_fan));
 
 	fan->handle = device->handle;
 	strcpy(acpi_device_name(device), "Fan");
--- linux-2.6.16-rc4-mm2/drivers/acpi/video.c.orig	2006-02-28 14:48:10.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/acpi/video.c	2006-02-28 14:48:52.000000000 +0100
@@ -546,11 +546,10 @@ static void acpi_video_device_find_cap(s
 		int count = 0;
 		union acpi_object *o;
 
-		br = kmalloc(sizeof(*br), GFP_KERNEL);
+		br = kzalloc(sizeof(*br), GFP_KERNEL);
 		if (!br) {
 			printk(KERN_ERR "can't allocate memory\n");
 		} else {
-			memset(br, 0, sizeof(*br));
 			br->levels = kmalloc(obj->package.count *
 					     sizeof *(br->levels), GFP_KERNEL);
 			if (!br->levels)
@@ -1296,12 +1295,10 @@ acpi_video_bus_get_one_device(struct acp
 	    acpi_evaluate_integer(device->handle, "_ADR", NULL, &device_id);
 	if (ACPI_SUCCESS(status)) {
 
-		data = kmalloc(sizeof(struct acpi_video_device), GFP_KERNEL);
+		data = kzalloc(sizeof(struct acpi_video_device), GFP_KERNEL);
 		if (!data)
 			return_VALUE(-ENOMEM);
 
-		memset(data, 0, sizeof(struct acpi_video_device));
-
 		data->handle = device->handle;
 		strcpy(acpi_device_name(device), ACPI_VIDEO_DEVICE_NAME);
 		strcpy(acpi_device_class(device), ACPI_VIDEO_CLASS);
@@ -1737,10 +1734,9 @@ static int acpi_video_bus_add(struct acp
 	if (!device)
 		return_VALUE(-EINVAL);
 
-	video = kmalloc(sizeof(struct acpi_video_bus), GFP_KERNEL);
+	video = kzalloc(sizeof(struct acpi_video_bus), GFP_KERNEL);
 	if (!video)
 		return_VALUE(-ENOMEM);
-	memset(video, 0, sizeof(struct acpi_video_bus));
 
 	video->handle = device->handle;
 	strcpy(acpi_device_name(device), ACPI_VIDEO_BUS_NAME);
--- linux-2.6.16-rc4-mm2/drivers/acpi/processor_core.c.orig	2006-02-28 14:49:00.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/acpi/processor_core.c	2006-02-28 14:49:14.000000000 +0100
@@ -625,10 +625,9 @@ static int acpi_processor_add(struct acp
 	if (!device)
 		return_VALUE(-EINVAL);
 
-	pr = kmalloc(sizeof(struct acpi_processor), GFP_KERNEL);
+	pr = kzalloc(sizeof(struct acpi_processor), GFP_KERNEL);
 	if (!pr)
 		return_VALUE(-ENOMEM);
-	memset(pr, 0, sizeof(struct acpi_processor));
 
 	pr->handle = device->handle;
 	strcpy(acpi_device_name(device), ACPI_PROCESSOR_DEVICE_NAME);




--===============84033780390306556==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============84033780390306556==--
