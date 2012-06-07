From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 Jun 2012 08:22:21 +0000
Subject: [patch] sony-laptop: fix a couple signedness bugs
Message-Id: <20120607082221.GA7582@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mattia Dongili <malattia@linux.it>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

These need to be signed to handle negative error codes.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 210d4ae..0a2f026 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -2113,7 +2113,7 @@ static ssize_t sony_nc_thermal_mode_show(struct device *dev,
 		struct device_attribute *attr, char *buffer)
 {
 	ssize_t count = 0;
-	unsigned int mode = sony_nc_thermal_mode_get();
+	int mode = sony_nc_thermal_mode_get();
 
 	if (mode < 0)
 		return mode;
@@ -2480,7 +2480,7 @@ static void sony_nc_backlight_ng_read_limits(int handle,
 	props->maxlvl = 0xff;
 
 	offset = sony_find_snc_handle(handle);
-	if (offset < 0)
+	if ((int)offset < 0)
 		return;
 
 	/* try to read the boundaries from ACPI tables, if we fail the above
