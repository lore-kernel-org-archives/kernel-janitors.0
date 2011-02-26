From: Dan Carpenter <error27@gmail.com>
Date: Sat, 26 Feb 2011 12:56:11 +0000
Subject: [patch 4/4] sony-laptop: potential null dereference
Message-Id: <20110226125611.GL18043@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mattia Dongili <malattia@linux.it>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

In the original code, if "device_enum" was NULL then it would
dereference it when it printed the error message.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 0db9049..c24aa4a 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -1311,7 +1311,11 @@ static void sony_nc_rfkill_setup(struct acpi_device *device)
 	}
 
 	device_enum = (union acpi_object *) buffer.pointer;
-	if (!device_enum || device_enum->type != ACPI_TYPE_BUFFER) {
+	if (!device_enum) {
+		pr_err(DRV_PFX "Invalid SN06 return object.");
+		goto out_no_enum;
+	}
+	if (device_enum->type != ACPI_TYPE_BUFFER) {
 		pr_err(DRV_PFX "Invalid SN06 return object 0x%.2x\n",
 				device_enum->type);
 		goto out_no_enum;
