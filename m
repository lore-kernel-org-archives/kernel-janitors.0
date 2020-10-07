From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 07 Oct 2020 07:51:48 +0000
Subject: [PATCH] hwmon: (acpi_power_meter) clean up freeing code
Message-Id: <20201007075148.GB2529578@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org

This code works okay but Smatch flagged it as a double free.  I've
changed three things to make it more clear.  1)  Remove the call to
free_capabilities() in acpi_power_meter_add().  This call is a no-op
because the capabilities have not been allocated yet.  2)  Set "*str" to
NULL in free_capabilities() so that way the function can be called twice
in a row without leading to a double free.  3)  Call free_capabilities()
in read_capabilities() instead of open coding the free.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/hwmon/acpi_power_meter.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
index a270b975e90b..848718ab7312 100644
--- a/drivers/hwmon/acpi_power_meter.c
+++ b/drivers/hwmon/acpi_power_meter.c
@@ -725,8 +725,10 @@ static void free_capabilities(struct acpi_power_meter_resource *resource)
 	int i;
 
 	str = &resource->model_number;
-	for (i = 0; i < 3; i++, str++)
+	for (i = 0; i < 3; i++, str++) {
 		kfree(*str);
+		*str = NULL;
+	}
 }
 
 static int read_capabilities(struct acpi_power_meter_resource *resource)
@@ -801,9 +803,7 @@ static int read_capabilities(struct acpi_power_meter_resource *resource)
 	dev_info(&resource->acpi_dev->dev, "Found ACPI power meter.\n");
 	goto end;
 error:
-	str = &resource->model_number;
-	for (i = 0; i < 3; i++, str++)
-		kfree(*str);
+	free_capabilities(resource);
 end:
 	kfree(buffer.pointer);
 	return res;
@@ -874,7 +874,6 @@ static int acpi_power_meter_add(struct acpi_device *device)
 	strcpy(acpi_device_class(device), ACPI_POWER_METER_CLASS);
 	device->driver_data = resource;
 
-	free_capabilities(resource);
 	res = read_capabilities(resource);
 	if (res)
 		goto exit_free;
-- 
2.28.0
