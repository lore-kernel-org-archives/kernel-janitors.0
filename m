From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 06 Jun 2012 06:57:12 +0000
Subject: [patch] sony-laptop: fix sony_nc_sysfs_store()
Message-Id: <20120606065712.GA26869@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mattia Dongili <malattia@linux.it>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

We made this an unsigned long and it causes a bug on 64 bit big endian
systems when we try to pass the value to sony_nc_int_call().

Also value has to be signed because validate() returns negative error
codes.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static checker bug.  Not tested, sorry.

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 210d4ae..7cf0f3d 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -973,7 +973,7 @@ static ssize_t sony_nc_sysfs_store(struct device *dev,
 			       struct device_attribute *attr,
 			       const char *buffer, size_t count)
 {
-	unsigned long value = 0;
+	int value;
 	int ret = 0;
 	struct sony_nc_value *item  	    container_of(attr, struct sony_nc_value, devattr);
@@ -984,7 +984,7 @@ static ssize_t sony_nc_sysfs_store(struct device *dev,
 	if (count > 31)
 		return -EINVAL;
 
-	if (kstrtoul(buffer, 10, &value))
+	if (kstrtoint(buffer, 10, &value))
 		return -EINVAL;
 
 	if (item->validate)
@@ -994,7 +994,7 @@ static ssize_t sony_nc_sysfs_store(struct device *dev,
 		return value;
 
 	ret = sony_nc_int_call(sony_nc_acpi_handle, *item->acpiset,
-			(int *)&value, NULL);
+			       &value, NULL);
 	if (ret < 0)
 		return -EIO;
 
