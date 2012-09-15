From: Yuanhan Liu <yuanhan.liu@intel.com>
Date: Sat, 15 Sep 2012 13:37:05 +0000
Subject: [nouveau:master 45/83] drivers/gpu/drm/nouveau/core/subdev/bios/base.c:66:12: warning: unused
Message-Id: <20120915133705.GD3578@yliu-dev.sh.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Ben,

FYI, there are new compile warnings show up in

tree:   git://git.freedesktop.org/git/nouveau/linux-2.6 master
head:   0a5cdb723f451765f2ae825884ec8cf47b0cc57b
commit: 08e4708a92bb418b09685c60895bbbd23bfb22d5 [45/83] drm/nouveau: port remainder of drm code, and rip out compat layer
config: powerpc-allmodconfig

All error/warnings:

drivers/gpu/drm/nouveau/core/subdev/bios/base.c: In function 'nouveau_bios_shadow_of':
drivers/gpu/drm/nouveau/core/subdev/bios/base.c:66:12: warning: unused variable 'i' [-Wunused-variable]

git checkout 08e4708a92bb418b09685c60895bbbd23bfb22d5
vim +66 drivers/gpu/drm/nouveau/core/subdev/bios/base.c
    56		return 0;
    57	}
    58	
    59	#if defined(__powerpc__)
    60	static void
    61	nouveau_bios_shadow_of(struct nouveau_bios *bios)
    62	{
    63		struct pci_dev *pdev = nv_device(bios)->pdev;
    64		struct device_node *dn;
    65		const u32 *data;
  > 66		int size, i;
    67	
    68		dn = pci_device_to_OF_node(pdev);
    69		if (!dn) {
    70			nv_info(bios, "Unable to get the OF node\n");
    71			return;
    72		}
    73	
    74		data = of_get_property(dn, "NVDA,BMP", &size);
    75		if (data) {
    76			bios->size = size;

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
