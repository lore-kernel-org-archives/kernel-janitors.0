From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 21 Sep 2012 10:22:42 +0000
Subject: sound/pci/hda/patch_ca0132.c: potential null dereference 'dma_engine'
Message-Id: <20120921102242.GA11865@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ian Minett <ian_minett@creativelabs.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

Hi Ian,

FYI, there are new smatch warnings show up in

commit 0b37d4c7982442730061a737c16939e8cc363861
Author:     Ian Minett <ian_minett@creativelabs.com>
Commit:     Takashi Iwai <tiwai@suse.de>
CommitDate: Fri Sep 21 09:54:29 2012 +0200

+ sound/pci/hda/patch_ca0132.c:2056 dspxfr_image() error: potential null dereference 'dma_engine'.  (kzalloc returns null)
+ sound/pci/hda/patch_ca0132.c:2056 dspxfr_image() error: we previously assumed 'dma_engine' could be null (see line 1963)

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
