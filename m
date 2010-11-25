From: Dan Carpenter <error27@gmail.com>
Date: Thu, 25 Nov 2010 17:35:52 +0000
Subject: [patch] WMI: return error if wmi_create_device() fails
Message-Id: <20101125173552.GB12939@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, dmitry.torokhov@gmail.com, kernel-janitors@vger.kernel.org

The break resets the retval to 0 but we want to return an error code.
This was introduced in c64eefd48c4 "WMI: embed struct device directly
into wmi_block"

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 104b77c..a5b7a4d 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -812,7 +812,7 @@ static acpi_status parse_wdg(acpi_handle handle)
 		if (IS_ERR(wblock)) {
 			retval = PTR_ERR(wblock);
 			wmi_free_devices();
-			break;
+			goto out_free_pointer;
 		}
 
 		if (debug_event) {
