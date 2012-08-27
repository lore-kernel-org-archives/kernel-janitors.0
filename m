From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 27 Aug 2012 05:18:10 +0000
Subject: [nouveau:master 39/72] nv50.c:187:1-59: code aligned with following code
Message-Id: <20120827051810.GA17125@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Ben,

FYI, there are new coccinelle warnings show up in

tree:   git://git.freedesktop.org/git/nouveau/linux-2.6 master
head:   fc72098aca323093e899eaa1284686b7d64a4b51
commit: 505c59fd7c71cffec272fef218c1c49987850fa3 [39/72] drm/nouveau/mxm: split up into bios code and a subdev module

All coccinelle warnings:

+ drivers/gpu/drm/nouveau/core/subdev/mxm/nv50.c:187:1-59: code aligned with following code on line 188

vim +187 drivers/gpu/drm/nouveau/core/subdev/mxm/nv50.c
   184	{
   185		u64 desc = *(u64 *)data;
   186		if ((desc & 0xf0) != 0xf0)
 > 187		nv_info(mxm, "unmatched output device 0x%016llx\n", desc);
   188		return true;
   189	}
   190	

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
