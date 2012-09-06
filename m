From: Emil Goode <emilgoode@gmail.com>
Date: Thu, 06 Sep 2012 14:46:20 +0000
Subject: [PATCH] HID: picoLCD: Remove use of deprecated function
Message-Id: <1346942780-8091-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: bonbons@linux-vserver.org, jkosina@suse.cz
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

The flush_delayed_work_sync function is deprecated,
we can instead call flush_delayed_work directly.

Sparse is giving a warning:
drivers/hid/hid-picolcd_fb.c:611:2: warning:
	‘flush_delayed_work_sync’ is deprecated
	(declared at include/linux/workqueue.h:454)
	[-Wdeprecated-declarations]

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 drivers/hid/hid-picolcd_fb.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-picolcd_fb.c b/drivers/hid/hid-picolcd_fb.c
index 0008a51..eb00357 100644
--- a/drivers/hid/hid-picolcd_fb.c
+++ b/drivers/hid/hid-picolcd_fb.c
@@ -608,7 +608,7 @@ void picolcd_exit_framebuffer(struct picolcd_data *data)
 	/* make sure there is no running update - thus that fbdata->picolcd
 	 * once obtained under lock is guaranteed not to get free() under
 	 * the feet of the deferred work */
-	flush_delayed_work_sync(&info->deferred_work);
+	flush_delayed_work(&info->deferred_work);
 
 	data->fb_info = NULL;
 	unregister_framebuffer(info);
-- 
1.7.10.4

