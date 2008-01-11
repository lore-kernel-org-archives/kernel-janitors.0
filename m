From: Nikanth Karthikesan <knikanth@suse.de>
Date: Fri, 11 Jan 2008 03:37:54 +0000
Subject: [PATCH 5/11 ] Change drm_ioctl as an unlocked_ioctl function : mga
Message-Id: <1200021954.3844.8.camel@nikanth-laptop.blr.novell.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: airlied@linux.ie, dri-devel@lists.sourceforge.net, benh@kernel.crashing.org, paulus@samba.org, thomas@winischhofer.net, adaplas@gmail.com, sylvain.meyer@worldonline.fr
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Register drm_ioctl as an unlocked_ioctl function.

Signed-off-by: Nikanth Karthikesan <knikanth@suse.de>

--- 
diff --git a/drivers/char/drm/mga_drv.c b/drivers/char/drm/mga_drv.c
index 5572939..be31707 100644
--- a/drivers/char/drm/mga_drv.c
+++ b/drivers/char/drm/mga_drv.c
@@ -67,7 +67,7 @@ static struct drm_driver driver = {
 		 .owner = THIS_MODULE,
 		 .open = drm_open,
 		 .release = drm_release,
-		 .ioctl = drm_ioctl,
+		 .unlocked_ioctl = drm_ioctl,
 		 .mmap = drm_mmap,
 		 .poll = drm_poll,
 		 .fasync = drm_fasync,
diff --git a/drivers/char/drm/mga_ioc32.c b/drivers/char/drm/mga_ioc32.c
index 30d0047..a4581d9 100644
--- a/drivers/char/drm/mga_ioc32.c
+++ b/drivers/char/drm/mga_ioc32.c
@@ -100,8 +100,7 @@ static int compat_mga_init(struct file *file, unsigned int cmd,
 	if (err)
 		return -EFAULT;
 
-	return drm_ioctl(file->f_path.dentry->d_inode, file,
-			 DRM_IOCTL_MGA_INIT, (unsigned long)init);
+	return drm_ioctl(file, DRM_IOCTL_MGA_INIT, (unsigned long)init);
 }
 
 typedef struct drm_mga_getparam32 {
@@ -125,8 +124,8 @@ static int compat_mga_getparam(struct file *file, unsigned int cmd,
 			  &getparam->value))
 		return -EFAULT;
 
-	return drm_ioctl(file->f_path.dentry->d_inode, file,
-			 DRM_IOCTL_MGA_GETPARAM, (unsigned long)getparam);
+	return drm_ioctl(file, DRM_IOCTL_MGA_GETPARAM,
+					 (unsigned long)getparam);
 }
 
 typedef struct drm_mga_drm_bootstrap32 {
@@ -166,9 +165,8 @@ static int compat_mga_dma_bootstrap(struct file *file, unsigned int cmd,
 	    || __put_user(dma_bootstrap32.agp_size, &dma_bootstrap->agp_size))
 		return -EFAULT;
 
-	err = drm_ioctl(file->f_path.dentry->d_inode, file,
-			DRM_IOCTL_MGA_DMA_BOOTSTRAP,
-			(unsigned long)dma_bootstrap);
+	err = drm_ioctl(file, DRM_IOCTL_MGA_DMA_BOOTSTRAP,
+					(unsigned long)dma_bootstrap);
 	if (err)
 		return err;
 
@@ -224,7 +222,7 @@ long mga_compat_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	if (fn != NULL)
 		ret = (*fn) (filp, cmd, arg);
 	else
-		ret = drm_ioctl(filp->f_path.dentry->d_inode, filp, cmd, arg);
+		ret = drm_ioctl(filp, cmd, arg);
 	unlock_kernel();
 
 	return ret;


