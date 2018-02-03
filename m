From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 03 Feb 2018 20:18:04 +0000
Subject: [PATCH 1/2] HID: picoLCD: Delete an error message for a failed memory allocation in three functions
Message-Id: <59255454-a570-14a3-16dc-6a800283043f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1ef884c9-9fbe-b95f-d318-b806639e6065@users.sourceforge.net>
In-Reply-To: <1ef884c9-9fbe-b95f-d318-b806639e6065@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, =?UTF-8?Q?Bruno_Pr=c3=a9mont?= <bonbons@linux-vserver.org>, Jiri Kosina <jikos@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 3 Feb 2018 21:00:37 +0100

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hid/hid-picolcd_core.c | 1 -
 drivers/hid/hid-picolcd_fb.c   | 5 ++---
 drivers/hid/hid-picolcd_leds.c | 1 -
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-picolcd_core.c b/drivers/hid/hid-picolcd_core.c
index c1b29a9eb41a..5dc48ecc1b98 100644
--- a/drivers/hid/hid-picolcd_core.c
+++ b/drivers/hid/hid-picolcd_core.c
@@ -549,7 +549,6 @@ static int picolcd_probe(struct hid_device *hdev,
 	 */
 	data = kzalloc(sizeof(struct picolcd_data), GFP_KERNEL);
 	if (data = NULL) {
-		hid_err(hdev, "can't allocate space for Minibox PicoLCD device data\n");
 		error = -ENOMEM;
 		goto err_no_cleanup;
 	}
diff --git a/drivers/hid/hid-picolcd_fb.c b/drivers/hid/hid-picolcd_fb.c
index 7f965e231433..5fb0b67b8d59 100644
--- a/drivers/hid/hid-picolcd_fb.c
+++ b/drivers/hid/hid-picolcd_fb.c
@@ -548,10 +548,9 @@ int picolcd_init_framebuffer(struct picolcd_data *data)
 	fbdata->force   = 1;
 	fbdata->vbitmap = info->par + sizeof(struct picolcd_fb_data);
 	fbdata->bitmap  = vmalloc(PICOLCDFB_SIZE*8);
-	if (fbdata->bitmap = NULL) {
-		dev_err(dev, "can't get a free page for framebuffer\n");
+	if (!fbdata->bitmap)
 		goto err_nomem;
-	}
+
 	info->screen_base = (char __force __iomem *)fbdata->bitmap;
 	info->fix.smem_start = (unsigned long)fbdata->bitmap;
 	memset(fbdata->vbitmap, 0xff, PICOLCDFB_SIZE);
diff --git a/drivers/hid/hid-picolcd_leds.c b/drivers/hid/hid-picolcd_leds.c
index a802b4f49c7b..871cad90730a 100644
--- a/drivers/hid/hid-picolcd_leds.c
+++ b/drivers/hid/hid-picolcd_leds.c
@@ -122,7 +122,6 @@ int picolcd_init_leds(struct picolcd_data *data, struct hid_report *report)
 	for (i = 0; i < 8; i++) {
 		led = kzalloc(sizeof(struct led_classdev)+name_sz, GFP_KERNEL);
 		if (!led) {
-			dev_err(dev, "can't allocate memory for LED %d\n", i);
 			ret = -ENOMEM;
 			goto err;
 		}
-- 
2.16.1

