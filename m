From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 21 Oct 2012 03:59:54 +0000
Subject: [sound-unstable:topic/hda-spdif-fix 99/124] ERROR: "snd_dmaengine_pcm_open" [sound/soc/omap/snd-soc-
Message-Id: <5083733a.T3zEi6cLE4psrO1W%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Peter,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound-unstable.git topic/hda-spdif-fix
head:   afc51e492b36bd61b46f4d70dd646678d96f5f97
commit: e7736cdea223f3a5b867c359fb35cf08250dd771 [99/124] dmaengine: Add flags parameter to dmaengine_prep_dma_cyclic()
config: arm-omap2plus_defconfig # make ARCH=arm omap2plus_defconfig

All error/warnings:

ERROR: "snd_hwparams_to_dma_slave_config" [sound/soc/omap/snd-soc-omap.ko] undefined!
ERROR: "snd_dmaengine_pcm_pointer" [sound/soc/omap/snd-soc-omap.ko] undefined!
ERROR: "snd_dmaengine_pcm_open" [sound/soc/omap/snd-soc-omap.ko] undefined!
ERROR: "snd_dmaengine_pcm_close" [sound/soc/omap/snd-soc-omap.ko] undefined!
ERROR: "snd_dmaengine_pcm_get_chan" [sound/soc/omap/snd-soc-omap.ko] undefined!
ERROR: "snd_dmaengine_pcm_trigger" [sound/soc/omap/snd-soc-omap.ko] undefined!

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
