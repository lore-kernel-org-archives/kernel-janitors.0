From: Dan Carpenter <error27@gmail.com>
Date: Sat, 26 Feb 2011 12:54:57 +0000
Subject: [patch 2/4] sony-laptop: return negative on failure in
Message-Id: <20110226125456.GJ18043@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mattia Dongili <malattia@linux.it>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

There were two places in sony_nc_add() where we returned zero on failure
instead of a negative error code.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index a7b9c72..d0d0522 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -1593,9 +1593,11 @@ static int sony_nc_add(struct acpi_device *device)
 	if (ACPI_SUCCESS(acpi_get_handle(sony_nc_acpi_handle, "SN00",
 					 &handle))) {
 		dprintk("Doing SNC setup\n");
-		if (sony_nc_handles_setup(sony_pf_device))
+		result = sony_nc_handles_setup(sony_pf_device);
+		if (result)
 			goto outpresent;
-		if (sony_nc_kbd_backlight_setup(sony_pf_device))
+		result = sony_nc_kbd_backlight_setup(sony_pf_device);
+		if (result)
 			goto outsnc;
 		sony_nc_function_setup(device);
 		sony_nc_rfkill_setup(device);
