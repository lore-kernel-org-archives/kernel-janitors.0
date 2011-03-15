From: Dan Carpenter <error27@gmail.com>
Date: Tue, 15 Mar 2011 07:06:23 +0000
Subject: [patch 1/2] asus-wmi: signedness bug in read_brightness()
Message-Id: <20110315070623.GS2008@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Corentin Chary <corentincj@iksaif.net>
Cc: Matthew Garrett <mjg@redhat.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

"err" needs to be signed for the error handling to work.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 5b779a9..a038595 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -946,7 +946,8 @@ static int read_brightness_max(struct asus_wmi *asus)
 static int read_brightness(struct backlight_device *bd)
 {
 	struct asus_wmi *asus = bl_get_data(bd);
-	u32 retval, err;
+	u32 retval;
+	int err;
 
 	err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_BRIGHTNESS, &retval);
 
