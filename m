From: matt mooney <mfm@muteddisk.com>
Date: Fri, 24 Sep 2010 19:17:13 +0000
Subject: [PATCH 03/24] dma: change to new flag variable
Message-Id: <036514b5dd23c5af14303519d79d60d79adccbee.1285355033.git.mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e0bdab5d2e8c52041c003de68ba774c3e706716c.1285355033.git.mfm@muteddisk.com>
 <9968d4260be8850200cc9c7dfe08addf611468b4.1285355033.git.mfm@muteddisk.com>
In-Reply-To: <9968d4260be8850200cc9c7dfe08addf611468b4.1285355033.git.mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org

Replace EXTRA_CFLAGS with ccflags-y.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 drivers/dma/Makefile |    8 ++------
 1 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/Makefile b/drivers/dma/Makefile
index 72bd703..69c5b1e 100644
--- a/drivers/dma/Makefile
+++ b/drivers/dma/Makefile
@@ -1,9 +1,5 @@
-ifeq ($(CONFIG_DMADEVICES_DEBUG),y)
-	EXTRA_CFLAGS	+= -DDEBUG
-endif
-ifeq ($(CONFIG_DMADEVICES_VDEBUG),y)
-	EXTRA_CFLAGS	+= -DVERBOSE_DEBUG
-endif
+ccflags-$(CONFIG_DMADEVICES_DEBUG)  := -DDEBUG
+ccflags-$(CONFIG_DMADEVICES_VDEBUG) += -DVERBOSE_DEBUG
 
 obj-$(CONFIG_DMA_ENGINE) += dmaengine.o
 obj-$(CONFIG_NET_DMA) += iovlock.o
-- 
1.7.2.1

