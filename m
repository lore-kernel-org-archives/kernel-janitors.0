From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Feb 2012 09:29:31 +0000
Subject: [patch] acpi: check for allocation errors in dock_link_device()
Message-Id: <20120214092931.GA18662@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shaohua Li <shaohua.li@intel.com>, Matthew Garrett <mjg@redhat.com>
Cc: Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, kernel-janitors@vger.kernel.org

This is error checking pedantry to keep the static checkers happy.  In
the original code the kmalloc() wasn't checked for allocation failures.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/acpi/dock.c b/drivers/acpi/dock.c
index b5e4142..38e8212 100644
--- a/drivers/acpi/dock.c
+++ b/drivers/acpi/dock.c
@@ -281,21 +281,22 @@ EXPORT_SYMBOL_GPL(is_dock_device);
  */
 struct device **dock_link_device(acpi_handle handle)
 {
-	struct device *dev = acpi_get_physical_device(handle);
+	struct device *dev;
 	struct dock_station *dock_station;
 	int ret, dock = 0;
 	struct device **devices;
 
-	devices = kmalloc(dock_station_count * sizeof(struct device *),
-			  GFP_KERNEL);
-
+	dev = acpi_get_physical_device(handle);
 	if (!dev)
 		return NULL;
+	if (is_dock(handle))
+		goto out_put;
+
+	devices = kmalloc(dock_station_count * sizeof(struct device *),
+			  GFP_KERNEL);
+	if (!devices)
+		goto out_put;
 
-	if (is_dock(handle)) {
-		put_device(dev);
-		return NULL;
-	}
 
 	list_for_each_entry(dock_station, &dock_stations, sibling) {
 		if (find_dock_dependent_device(dock_station, handle)) {
@@ -311,6 +312,10 @@ struct device **dock_link_device(acpi_handle handle)
 
 	devices[dock] = NULL;
 	return devices;
+
+out_put:
+	put_device(dev);
+	return NULL;
 }
 EXPORT_SYMBOL_GPL(dock_link_device);
 
@@ -320,20 +325,21 @@ EXPORT_SYMBOL_GPL(dock_link_device);
  */
 struct device **dock_unlink_device(acpi_handle handle)
 {
-	struct device *dev = acpi_get_physical_device(handle);
+	struct device *dev;
 	struct dock_station *dock_station;
 	int dock = 0;
-	struct device **devices -		kmalloc(dock_station_count * sizeof(struct device *),
-			GFP_KERNEL);
+	struct device **devices;
 
+	dev = acpi_get_physical_device(handle);
 	if (!dev)
 		return NULL;
+	if (is_dock(handle))
+		goto out_put;
 
-	if (is_dock(handle)) {
-		put_device(dev);
-		return NULL;
-	}
+	devices = kmalloc(dock_station_count * sizeof(struct device *),
+			GFP_KERNEL);
+	if (!devices)
+		goto out_put;
 
 	list_for_each_entry(dock_station, &dock_stations, sibling) {
 		if (find_dock_dependent_device(dock_station, handle)) {
@@ -350,6 +356,10 @@ struct device **dock_unlink_device(acpi_handle handle)
 	put_device(dev);
 	devices[dock] = NULL;
 	return devices;
+
+out_put:
+	put_device(dev);
+	return NULL;
 }
 EXPORT_SYMBOL_GPL(dock_unlink_device);
 
