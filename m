From: Nikanth Karthikesan <knikanth@suse.de>
Date: Fri, 11 Jan 2008 03:37:23 +0000
Subject: [PATCH 2/11 ] Change drm_ioctl as an unlocked_ioctl function : i810
Message-Id: <1200021923.3844.2.camel@nikanth-laptop.blr.novell.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: airlied@linux.ie, dri-devel@lists.sourceforge.net, benh@kernel.crashing.org, paulus@samba.org, thomas@winischhofer.net, adaplas@gmail.com, sylvain.meyer@worldonline.fr
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Register drm_ioctl as an unlocked_ioctl function.

Signed-off-by: Nikanth Karthikesan <knikanth@suse.de>

--- 
diff --git a/drivers/char/drm/i810_dma.c b/drivers/char/drm/i810_dma.c
index eb381a7..e3adbf3 100644
--- a/drivers/char/drm/i810_dma.c
+++ b/drivers/char/drm/i810_dma.c
@@ -115,7 +115,7 @@ static int i810_mmap_buffers(struct file *filp, struct vm_area_struct *vma)
 static const struct file_operations i810_buffer_fops = {
 	.open = drm_open,
 	.release = drm_release,
-	.ioctl = drm_ioctl,
+	.unlocked_ioctl = drm_ioctl,
 	.mmap = i810_mmap_buffers,
 	.fasync = drm_fasync,
 };
diff --git a/drivers/char/drm/i810_drv.c b/drivers/char/drm/i810_drv.c
index fabb9a8..c1e0275 100644
--- a/drivers/char/drm/i810_drv.c
+++ b/drivers/char/drm/i810_drv.c
@@ -59,7 +59,7 @@ static struct drm_driver driver = {
 		 .owner = THIS_MODULE,
 		 .open = drm_open,
 		 .release = drm_release,
-		 .ioctl = drm_ioctl,
+		 .unlocked_ioctl = drm_ioctl,
 		 .mmap = drm_mmap,
 		 .poll = drm_poll,
 		 .fasync = drm_fasync,


