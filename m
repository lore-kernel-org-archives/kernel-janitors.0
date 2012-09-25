From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 25 Sep 2012 11:37:03 +0000
Subject: [slave-dma:topic/dmaengine_dt 17/20] drivers/dma/dmaengine.c:65:26: fatal error: linux/of_dma.h: No
Message-Id: <20120925113703.GA5157@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Vinod,

I noticed that kernel build failed on this commit and get fixed by
the next next commit. Do you want me to do commit-by-commit tests on
your tree, or test branch head first which will ignore such interim errors?

Thanks,
Fengguang
---

tree:   git://git.infradead.org/users/vkoul/slave-dma.git topic/dmaengine_dt
head:   be2e7726dc84371736996e05d10331f70afd50c1
commit: 528499a7037ebec0636d928f88cd783c618df3c5 [17/20] dmaengine: add helper function to request a slave DMA channel
config: x86_64-allmodconfig


All error/warnings:

drivers/dma/dmaengine.c:65:26: fatal error: linux/of_dma.h: No such file or directory
compilation terminated.

vim +65 drivers/dma/dmaengine.c
    59	#include <linux/rcupdate.h>
    60	#include <linux/mutex.h>
    61	#include <linux/jiffies.h>
    62	#include <linux/rculist.h>
    63	#include <linux/idr.h>
    64	#include <linux/slab.h>
  > 65	#include <linux/of_dma.h>
    66	
    67	static DEFINE_MUTEX(dma_list_mutex);
    68	static DEFINE_IDR(dma_idr);

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
