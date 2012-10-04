From: David Airlie <airlied@redhat.com>
Date: Thu, 04 Oct 2012 10:10:54 +0000
Subject: Re: drivers/gpu/drm/nouveau/nouveau_drm.c:503:2: warning: format '%d' expects argument of type 'int'
Message-Id: <373800217.4537165.1349345454717.JavaMail.root@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


I've fixed these already in the pull to Linus, I just need to rebase my branch on his branch.

Dave.

----- Original Message -----
> From: "Fengguang Wu" <fengguang.wu@intel.com>
> To: "Ben Skeggs" <bskeggs@redhat.com>
> Cc: "Yuanhan Liu" <yuanhan.liu@intel.com>, "Dave Airlie" <airlied@redhat.com>, kernel-janitors@vger.kernel.org
> Sent: Thursday, 4 October, 2012 7:40:00 PM
> Subject: drivers/gpu/drm/nouveau/nouveau_drm.c:503:2: warning: format '%d' expects argument of type 'int', but
> argument 4 has type 'struct pid *'
> 
> Hi Ben,
> 
> FYI, there are new compile warnings show up in
> 
> commit: 2c49b56770f65c13ab8d25fafcb657c314f9a474  Merge
> remote-tracking branch 'drm/drm-next'
> config: x86_64-allyesdebian (attached as .config)
> 
> All warnings:
> 
> drivers/gpu/drm/nouveau/nouveau_drm.c: In function
> 'nouveau_drm_open':
> drivers/gpu/drm/nouveau/nouveau_drm.c:503:2: warning: format '%d'
> expects argument of type 'int', but argument 4 has type 'struct pid
> *' [-Wformat]
> --
> drivers/gpu/drm/nouveau/core/subdev/gpio/base.c: In function
> 'nouveau_gpio_isr_del':
> drivers/gpu/drm/nouveau/core/subdev/gpio/base.c:219:4: warning:
> 'flush_work_sync' is deprecated (declared at
> include/linux/workqueue.h:448) [-Wdeprecated-declarations]
> 
> vim +503 drivers/gpu/drm/nouveau/nouveau_drm.c
> 
> 77145f1c (Ben Skeggs     2012-07-31  487) 	nouveau_pm_resume(dev);
> 77145f1c (Ben Skeggs     2012-07-31  488)
> 77145f1c (Ben Skeggs     2012-07-31  489) 	NV_INFO(drm, "resuming
> display...\n");
> 77145f1c (Ben Skeggs     2012-07-31  490)
> 	nouveau_display_resume(dev);
> 77145f1c (Ben Skeggs     2012-07-31  491) 	return 0;
> 94580299 (Ben Skeggs     2012-07-06  492) }
> 94580299 (Ben Skeggs     2012-07-06  493)
> 5b8a43ae (Marcin Slusarz 2012-08-19  494) static int
> ebb945a9 (Ben Skeggs     2012-07-20  495) nouveau_drm_open(struct
> drm_device *dev, struct drm_file *fpriv)
> ebb945a9 (Ben Skeggs     2012-07-20  496) {
> ebb945a9 (Ben Skeggs     2012-07-20  497) 	struct pci_dev *pdev > dev->pdev;
> ebb945a9 (Ben Skeggs     2012-07-20  498) 	struct nouveau_drm *drm > nouveau_drm(dev);
> ebb945a9 (Ben Skeggs     2012-07-20  499) 	struct nouveau_cli *cli;
> fa6df8c1 (Ben Skeggs     2012-09-12  500) 	char name[16];
> ebb945a9 (Ben Skeggs     2012-07-20  501) 	int ret;
> ebb945a9 (Ben Skeggs     2012-07-20  502)
> fa6df8c1 (Ben Skeggs     2012-09-12 @503) 	snprintf(name,
> sizeof(name), "%d", fpriv->pid);
> fa6df8c1 (Ben Skeggs     2012-09-12  504)
> fa6df8c1 (Ben Skeggs     2012-09-12  505) 	ret > nouveau_cli_create(pdev, name, sizeof(*cli), (void **)&cli);
> ebb945a9 (Ben Skeggs     2012-07-20  506) 	if (ret)
> ebb945a9 (Ben Skeggs     2012-07-20  507) 		return ret;
> ebb945a9 (Ben Skeggs     2012-07-20  508)
> ebb945a9 (Ben Skeggs     2012-07-20  509) 	if
> (nv_device(drm->device)->card_type >= NV_50) {
> ebb945a9 (Ben Skeggs     2012-07-20  510) 		ret > nouveau_vm_new(nv_device(drm->device), 0, (1ULL << 40),
> ebb945a9 (Ben Skeggs     2012-07-20  511) 				     0x1000,
> &cli->base.vm);
> 
> The code at line 503 was first introduced by commit:
> fa6df8c drm/nouveau/core: have client-id be a string, rather than an
> integer
> 
> ---
> 0-DAY kernel build testing backend         Open Source Technology
> Center
> Fengguang Wu, Yuanhan Liu                              Intel
> Corporation
> 
