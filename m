From: Nikanth Karthikesan <knikanth@suse.de>
Date: Fri, 11 Jan 2008 03:37:47 +0000
Subject: [PATCH 4/11 ] Change drm_ioctl as an unlocked_ioctl function : i915
Message-Id: <1200021947.3844.6.camel@nikanth-laptop.blr.novell.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: airlied@linux.ie, dri-devel@lists.sourceforge.net, benh@kernel.crashing.org, paulus@samba.org, thomas@winischhofer.net, adaplas@gmail.com, sylvain.meyer@worldonline.fr
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Register drm_ioctl as an unlocked_ioctl function.

Signed-off-by: Nikanth Karthikesan <knikanth@suse.de>

--- 
diff --git a/drivers/char/drm/i915_drv.c b/drivers/char/drm/i915_drv.c
index 85bcc27..70a882e 100644
--- a/drivers/char/drm/i915_drv.c
+++ b/drivers/char/drm/i915_drv.c
@@ -64,7 +64,7 @@ static struct drm_driver driver = {
 		 .owner = THIS_MODULE,
 		 .open = drm_open,
 		 .release = drm_release,
-		 .ioctl = drm_ioctl,
+		 .unlocked_ioctl = drm_ioctl,
 		 .mmap = drm_mmap,
 		 .poll = drm_poll,
 		 .fasync = drm_fasync,
diff --git a/drivers/char/drm/i915_ioc32.c b/drivers/char/drm/i915_ioc32.c
index 1fe68a2..f8b1d68 100644
--- a/drivers/char/drm/i915_ioc32.c
+++ b/drivers/char/drm/i915_ioc32.c
@@ -66,9 +66,8 @@ static int compat_i915_batchbuffer(struct file *file, unsigned int cmd,
 			  &batchbuffer->cliprects))
 		return -EFAULT;
 
-	return drm_ioctl(file->f_path.dentry->d_inode, file,
-			 DRM_IOCTL_I915_BATCHBUFFER,
-			 (unsigned long)batchbuffer);
+	return drm_ioctl(file, DRM_IOCTL_I915_BATCHBUFFER,
+					 (unsigned long)batchbuffer);
 }
 
 typedef struct _drm_i915_cmdbuffer32 {
@@ -102,8 +101,8 @@ static int compat_i915_cmdbuffer(struct file *file, unsigned int cmd,
 			  &cmdbuffer->cliprects))
 		return -EFAULT;
 
-	return drm_ioctl(file->f_path.dentry->d_inode, file,
-			 DRM_IOCTL_I915_CMDBUFFER, (unsigned long)cmdbuffer);
+	return drm_ioctl(file, DRM_IOCTL_I915_CMDBUFFER,
+				 (unsigned long)cmdbuffer);
 }
 
 typedef struct drm_i915_irq_emit32 {
@@ -125,8 +124,8 @@ static int compat_i915_irq_emit(struct file *file, unsigned int cmd,
 			  &request->irq_seq))
 		return -EFAULT;
 
-	return drm_ioctl(file->f_path.dentry->d_inode, file,
-			 DRM_IOCTL_I915_IRQ_EMIT, (unsigned long)request);
+	return drm_ioctl(file, DRM_IOCTL_I915_IRQ_EMIT,
+				 (unsigned long)request);
 }
 typedef struct drm_i915_getparam32 {
 	int param;
@@ -149,8 +148,8 @@ static int compat_i915_getparam(struct file *file, unsigned int cmd,
 			  &request->value))
 		return -EFAULT;
 
-	return drm_ioctl(file->f_path.dentry->d_inode, file,
-			 DRM_IOCTL_I915_GETPARAM, (unsigned long)request);
+	return drm_ioctl(file, DRM_IOCTL_I915_GETPARAM,
+					 (unsigned long)request);
 }
 
 typedef struct drm_i915_mem_alloc32 {
@@ -178,8 +177,8 @@ static int compat_i915_alloc(struct file *file, unsigned int cmd,
 			  &request->region_offset))
 		return -EFAULT;
 
-	return drm_ioctl(file->f_path.dentry->d_inode, file,
-			 DRM_IOCTL_I915_ALLOC, (unsigned long)request);
+	return drm_ioctl(file, DRM_IOCTL_I915_ALLOC,
+				 (unsigned long)request);
 }
 
 drm_ioctl_compat_t *i915_compat_ioctls[] = {
@@ -215,7 +214,7 @@ long i915_compat_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	if (fn != NULL)
 		ret = (*fn) (filp, cmd, arg);
 	else
-		ret = drm_ioctl(filp->f_path.dentry->d_inode, filp, cmd, arg);
+		ret = drm_ioctl(filp, cmd, arg);
 	unlock_kernel();
 
 	return ret;


