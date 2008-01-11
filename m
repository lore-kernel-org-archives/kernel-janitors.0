From: Nikanth Karthikesan <knikanth@suse.de>
Date: Fri, 11 Jan 2008 03:38:16 +0000
Subject: [PATCH 7/11 ] Change drm_ioctl as an unlocked_ioctl function :
Message-Id: <1200021976.3844.12.camel@nikanth-laptop.blr.novell.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: airlied@linux.ie, dri-devel@lists.sourceforge.net, benh@kernel.crashing.org, paulus@samba.org, thomas@winischhofer.net, adaplas@gmail.com, sylvain.meyer@worldonline.fr
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Register drm_ioctl as an unlocked_ioctl function.

Signed-off-by: Nikanth Karthikesan <knikanth@suse.de>

--- 
diff --git a/drivers/char/drm/radeon_drv.c b/drivers/char/drm/radeon_drv.c
index 349ac3d..6d7588c 100644
--- a/drivers/char/drm/radeon_drv.c
+++ b/drivers/char/drm/radeon_drv.c
@@ -85,7 +85,7 @@ static struct drm_driver driver = {
 		 .owner = THIS_MODULE,
 		 .open = drm_open,
 		 .release = drm_release,
-		 .ioctl = drm_ioctl,
+		 .unlocked_ioctl = drm_ioctl,
 		 .mmap = drm_mmap,
 		 .poll = drm_poll,
 		 .fasync = drm_fasync,
diff --git a/drivers/char/drm/radeon_ioc32.c b/drivers/char/drm/radeon_ioc32.c
index 56decda..f095048 100644
--- a/drivers/char/drm/radeon_ioc32.c
+++ b/drivers/char/drm/radeon_ioc32.c
@@ -92,8 +92,8 @@ static int compat_radeon_cp_init(struct file *file, unsigned int cmd,
 			  &init->gart_textures_offset))
 		return -EFAULT;
 
-	return drm_ioctl(file->f_path.dentry->d_inode, file,
-			 DRM_IOCTL_RADEON_CP_INIT, (unsigned long)init);
+	return drm_ioctl(file, DRM_IOCTL_RADEON_CP_INIT,
+					 (unsigned long)init);
 }
 
 typedef struct drm_radeon_clear32 {
@@ -125,8 +125,8 @@ static int compat_radeon_cp_clear(struct file *file, unsigned int cmd,
 			  &clr->depth_boxes))
 		return -EFAULT;
 
-	return drm_ioctl(file->f_path.dentry->d_inode, file,
-			 DRM_IOCTL_RADEON_CLEAR, (unsigned long)clr);
+	return drm_ioctl(file, DRM_IOCTL_RADEON_CLEAR,
+					 (unsigned long)clr);
 }
 
 typedef struct drm_radeon_stipple32 {
@@ -149,8 +149,8 @@ static int compat_radeon_cp_stipple(struct file *file, unsigned int cmd,
 			  &request->mask))
 		return -EFAULT;
 
-	return drm_ioctl(file->f_path.dentry->d_inode, file,
-			 DRM_IOCTL_RADEON_STIPPLE, (unsigned long)request);
+	return drm_ioctl(file, DRM_IOCTL_RADEON_STIPPLE,
+					 (unsigned long)request);
 }
 
 typedef struct drm_radeon_tex_image32 {
@@ -204,8 +204,8 @@ static int compat_radeon_cp_texture(struct file *file, unsigned int cmd,
 			  &image->data))
 		return -EFAULT;
 
-	return drm_ioctl(file->f_path.dentry->d_inode, file,
-			 DRM_IOCTL_RADEON_TEXTURE, (unsigned long)request);
+	return drm_ioctl(file, DRM_IOCTL_RADEON_TEXTURE,
+					 (unsigned long)request);
 }
 
 typedef struct drm_radeon_vertex2_32 {
@@ -238,8 +238,8 @@ static int compat_radeon_cp_vertex2(struct file *file, unsigned int cmd,
 			  &request->prim))
 		return -EFAULT;
 
-	return drm_ioctl(file->f_path.dentry->d_inode, file,
-			 DRM_IOCTL_RADEON_VERTEX2, (unsigned long)request);
+	return drm_ioctl(file, DRM_IOCTL_RADEON_VERTEX2,
+					 (unsigned long)request);
 }
 
 typedef struct drm_radeon_cmd_buffer32 {
@@ -268,8 +268,8 @@ static int compat_radeon_cp_cmdbuf(struct file *file, unsigned int cmd,
 			  &request->boxes))
 		return -EFAULT;
 
-	return drm_ioctl(file->f_path.dentry->d_inode, file,
-			 DRM_IOCTL_RADEON_CMDBUF, (unsigned long)request);
+	return drm_ioctl(file, DRM_IOCTL_RADEON_CMDBUF,
+					 (unsigned long)request);
 }
 
 typedef struct drm_radeon_getparam32 {
@@ -293,8 +293,8 @@ static int compat_radeon_cp_getparam(struct file *file, unsigned int cmd,
 			  &request->value))
 		return -EFAULT;
 
-	return drm_ioctl(file->f_path.dentry->d_inode, file,
-			 DRM_IOCTL_RADEON_GETPARAM, (unsigned long)request);
+	return drm_ioctl(file, DRM_IOCTL_RADEON_GETPARAM,
+					 (unsigned long)request);
 }
 
 typedef struct drm_radeon_mem_alloc32 {
@@ -322,8 +322,8 @@ static int compat_radeon_mem_alloc(struct file *file, unsigned int cmd,
 			  &request->region_offset))
 		return -EFAULT;
 
-	return drm_ioctl(file->f_path.dentry->d_inode, file,
-			 DRM_IOCTL_RADEON_ALLOC, (unsigned long)request);
+	return drm_ioctl(file, DRM_IOCTL_RADEON_ALLOC,
+					 (unsigned long)request);
 }
 
 typedef struct drm_radeon_irq_emit32 {
@@ -345,8 +345,8 @@ static int compat_radeon_irq_emit(struct file *file, unsigned int cmd,
 			  &request->irq_seq))
 		return -EFAULT;
 
-	return drm_ioctl(file->f_path.dentry->d_inode, file,
-			 DRM_IOCTL_RADEON_IRQ_EMIT, (unsigned long)request);
+	return drm_ioctl(file, DRM_IOCTL_RADEON_IRQ_EMIT,
+					 (unsigned long)request);
 }
 
 /* The two 64-bit arches where alignof(u64)=4 in 32-bit code */
@@ -372,8 +372,8 @@ static int compat_radeon_cp_setparam(struct file *file, unsigned int cmd,
 			  &request->value))
 		return -EFAULT;
 
-	return drm_ioctl(file->f_dentry->d_inode, file,
-			 DRM_IOCTL_RADEON_SETPARAM, (unsigned long) request);
+	return drm_ioctl(file, DRM_IOCTL_RADEON_SETPARAM,
+					 (unsigned long) request);
 }
 #else
 #define compat_radeon_cp_setparam NULL
@@ -417,7 +417,7 @@ long radeon_compat_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	if (fn != NULL)
 		ret = (*fn) (filp, cmd, arg);
 	else
-		ret = drm_ioctl(filp->f_path.dentry->d_inode, filp, cmd, arg);
+		ret = drm_ioctl(filp, cmd, arg);
 	unlock_kernel();
 
 	return ret;


