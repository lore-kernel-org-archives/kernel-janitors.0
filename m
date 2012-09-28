From: Emil Goode <emilgoode@gmail.com>
Date: Fri, 28 Sep 2012 15:35:06 +0000
Subject: [PATCH] remoteproc: Fix use of format specifyer
Message-Id: <1348846506-9670-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: ohad@wizery.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

The dma_addr_t type can be eigher u32 or u64 depending on
the configuration. We should use a format specifyer for the
larges type and explicitly cast to it.

Sparse warnings:
drivers/remoteproc/remoteproc_core.c:234:2: warning:
	format ‘%x’ expects argument of type ‘unsigned int’,
	but argument 6 has type ‘dma_addr_t’ [-Wformat]

drivers/remoteproc/remoteproc_core.c:596:2: warning:
	format ‘%x’ expects argument of type ‘unsigned int’,
	but argument 5 has type ‘dma_addr_t’ [-Wformat]

drivers/remoteproc/remoteproc_core.c:634:3:
	warning: format ‘%x’ expects argument of type ‘unsigned int’,
	but argument 5 has type ‘dma_addr_t’ [-Wformat]

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 drivers/remoteproc/remoteproc_core.c |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index b6c6229..e05f153 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -231,8 +231,8 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
 	/* Store largest notifyid */
 	rproc->max_notifyid = max(rproc->max_notifyid, notifyid);
 
-	dev_dbg(dev, "vring%d: va %p dma %x size %x idr %d\n", i, va,
-					dma, size, notifyid);
+	dev_dbg(dev, "vring%d: va %p dma %llx size %x idr %d\n", i, va,
+				(unsigned long long)dma, size, notifyid);
 
 	rvring->va = va;
 	rvring->dma = dma;
@@ -593,7 +593,8 @@ static int rproc_handle_carveout(struct rproc *rproc,
 		goto free_carv;
 	}
 
-	dev_dbg(dev, "carveout va %p, dma %x, len 0x%x\n", va, dma, rsc->len);
+	dev_dbg(dev, "carveout va %p, dma %llx, len 0x%x\n", va,
+					(unsigned long long)dma, rsc->len);
 
 	/*
 	 * Ok, this is non-standard.
@@ -631,7 +632,8 @@ static int rproc_handle_carveout(struct rproc *rproc,
 		mapping->len = rsc->len;
 		list_add_tail(&mapping->node, &rproc->mappings);
 
-		dev_dbg(dev, "carveout mapped 0x%x to 0x%x\n", rsc->da, dma);
+		dev_dbg(dev, "carveout mapped 0x%x to 0x%llx\n",
+					rsc->da, (unsigned long long)dma);
 	}
 
 	/*
-- 
1.7.10.4

