From: Nikanth Karthikesan <knikanth@suse.de>
Date: Fri, 11 Jan 2008 03:38:44 +0000
Subject: [PATCH 11/11 ] Change drm_ioctl as an unlocked_ioctl function : via
Message-Id: <1200022004.3844.20.camel@nikanth-laptop.blr.novell.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: airlied@linux.ie, dri-devel@lists.sourceforge.net, benh@kernel.crashing.org, paulus@samba.org, thomas@winischhofer.net, adaplas@gmail.com, sylvain.meyer@worldonline.fr
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Register drm_ioctl as an unlocked_ioctl function.

Signed-off-by: Nikanth Karthikesan <knikanth@suse.de>

--- 
diff --git a/drivers/char/drm/via_drv.c b/drivers/char/drm/via_drv.c
index 2d4957a..a8041c5 100644
--- a/drivers/char/drm/via_drv.c
+++ b/drivers/char/drm/via_drv.c
@@ -62,7 +62,7 @@ static struct drm_driver driver = {
 		 .owner = THIS_MODULE,
 		 .open = drm_open,
 		 .release = drm_release,
-		 .ioctl = drm_ioctl,
+		 .unlocked_ioctl = drm_ioctl,
 		 .mmap = drm_mmap,
 		 .poll = drm_poll,
 		 .fasync = drm_fasync,


