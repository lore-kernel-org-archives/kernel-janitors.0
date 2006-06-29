From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Thu, 29 Jun 2006 12:51:53 +0000
Subject: [KJ] [PATCH] drivers/video/aty: Clean up return paths in
Message-Id: <20060629125153.GA17831@neon.tklauser.home>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch also adds appropriate KERN_* constants to printk() calls  in
aty_bl_init()

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

---
 drivers/video/aty/atyfb_base.c |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/video/aty/atyfb_base.c b/drivers/video/aty/atyfb_base.c
index 22e7206..1a93fce 100644
--- a/drivers/video/aty/atyfb_base.c
+++ b/drivers/video/aty/atyfb_base.c
@@ -2201,8 +2201,8 @@ #endif
 	bd = backlight_device_register(name, par, &aty_bl_data);
 	if (IS_ERR(bd)) {
 		info->bl_dev = NULL;
-		printk("aty: Backlight registration failed\n");
-		goto error;
+		printk(KERN_ERR "aty: Backlight registration failed\n");
+		return;
 	}
 
 	mutex_lock(&info->bl_mutex);
@@ -2225,11 +2225,8 @@ #ifdef CONFIG_PMAC_BACKLIGHT
 	mutex_unlock(&pmac_backlight_mutex);
 #endif
 
-	printk("aty: Backlight initialized (%s)\n", name);
-
-	return;
+	printk(KERN_INFO "aty: Backlight initialized (%s)\n", name);
 
-error:
 	return;
 }
 
-- 
1.4.0

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
