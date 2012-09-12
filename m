From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 12 Sep 2012 07:34:12 +0000
Subject: [drm:drm-opt-pwr 84/84] drivers/gpu/drm/nouveau/nouveau_drm.c:628:6: sparse: symbol 'nouveau_drm_ioc
Message-Id: <20120912073412.GC26877@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="WIyZ46R2i8wDzkSu"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave,

FYI, there are new sparse warnings show up in

tree:   git://people.freedesktop.org/~airlied/linux.git drm-opt-pwr
head:   75c2c97fd7c783f4f06423a41671f61840e65fa5
commit: 75c2c97fd7c783f4f06423a41671f61840e65fa5 [84/84] nouveau: add runtime PM support (v0.5)

All sparse warnings:

  drivers/gpu/drm/nouveau/nouveau_drm.c:406:1: sparse: symbol 'nouveau_do_suspend' was not declared. Should it be static?
  drivers/gpu/drm/nouveau/nouveau_drm.c:468:1: sparse: symbol 'nouveau_do_resume' was not declared. Should it be static?
+ drivers/gpu/drm/nouveau/nouveau_drm.c:628:6: sparse: symbol 'nouveau_drm_ioctl' was not declared. Should it be static?

vim +628 drivers/gpu/drm/nouveau/nouveau_drm.c

 > 628	long nouveau_drm_ioctl(struct file *filp,
   629			       unsigned int cmd, unsigned long arg)
   630	{
   631		struct drm_file *file_priv = filp->private_data;
   632		struct drm_device *dev;
   633		long ret;
   634		dev = file_priv->minor->dev;
   635		ret = pm_runtime_get(dev->dev);
   636		if (ret < 0)
   637			return ret;
   638	

Please consider folding the attached diff :-)

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation

--WIyZ46R2i8wDzkSu
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="make-it-static-75c2c97.diff"

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index a7258d9..1d68173 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -402,7 +402,7 @@ nouveau_drm_remove(struct pci_dev *pdev)
 	nouveau_object_debug();
 }
 
-int
+static int
 nouveau_do_suspend(struct drm_device *dev)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
@@ -464,7 +464,7 @@ int nouveau_pmops_suspend(struct device *dev)
 	return 0;
 }
 
-int
+static int
 nouveau_do_resume(struct drm_device *dev)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
@@ -625,7 +625,7 @@ nouveau_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_INFO, nouveau_gem_ioctl_info, DRM_UNLOCKED|DRM_AUTH),
 };
 
-long nouveau_drm_ioctl(struct file *filp,
+static long nouveau_drm_ioctl(struct file *filp,
 		       unsigned int cmd, unsigned long arg)
 {
 	struct drm_file *file_priv = filp->private_data;

--WIyZ46R2i8wDzkSu--
