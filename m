From: Julia Lawall <julia@diku.dk>
Date: Tue, 28 Jul 2009 15:56:35 +0000
Subject: [PATCH 9/9] drivers/acpi: correct error-handling code
Message-Id: <Pine.LNX.4.64.0907281756010.28189@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rui.zhang@intel.com, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

backlight_device_register may return an ERR_PTR value rather than a valid
pointer.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier fld,fld1;
expression x,E;
@@

 x = backlight_device_register(...)
  ... when != x = E
      when != &x
      when != x->fld1
(
  ((IS_ERR(x))||...)
|
*  x->fld
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/acpi/video.c                |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/acpi/video.c b/drivers/acpi/video.c
index 8851315..29788db 100644
--- a/drivers/acpi/video.c
+++ b/drivers/acpi/video.c
@@ -982,6 +982,8 @@ static void acpi_video_device_find_cap(struct acpi_video_device *device)
 		sprintf(name, "acpi_video%d", count++);
 		device->backlight = backlight_device_register(name,
 			NULL, device, &acpi_backlight_ops);
+		if (IS_ERR(device->backlight))
+			return;
 		device->backlight->props.max_brightness = device->brightness->count-3;
 		kfree(name);
 
