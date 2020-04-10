From: Colin King <colin.king@canonical.com>
Date: Fri, 10 Apr 2020 13:50:14 +0000
Subject: [PATCH] media: pwc-ctl: remove redundant assignment to variable ret
Message-Id: <20200410135014.26396-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/pwc/pwc-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/pwc/pwc-ctrl.c b/drivers/media/usb/pwc/pwc-ctrl.c
index 315c55927f5c..cff64d872058 100644
--- a/drivers/media/usb/pwc/pwc-ctrl.c
+++ b/drivers/media/usb/pwc/pwc-ctrl.c
@@ -523,7 +523,7 @@ int pwc_set_leds(struct pwc_device *pdev, int on_value, int off_value)
 #ifdef CONFIG_USB_PWC_DEBUG
 int pwc_get_cmos_sensor(struct pwc_device *pdev, int *sensor)
 {
-	int ret = -1, request;
+	int ret, request;
 
 	if (pdev->type < 675)
 		request = SENSOR_TYPE_FORMATTER1;
-- 
2.25.1
