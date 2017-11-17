From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 17 Nov 2017 21:37:53 +0000
Subject: [PATCH] dmaengine: ioat: Fix error handling path
Message-Id: <20171117213753.21050-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.j.williams@intel.com, vinod.koul@intel.com, dave.jiang@intel.com, bianpan2016@163.com, arvind.yadav.cs@gmail.com, kjlx@templeofstupid.com, geliangtang@gmail.com
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If the last test in 'ioat_dma_self_test()' fails, we must release all
the allocated resources and not just part of them.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/dma/ioat/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/ioat/init.c b/drivers/dma/ioat/init.c
index 2f31d3d0caa6..7792a9186f9c 100644
--- a/drivers/dma/ioat/init.c
+++ b/drivers/dma/ioat/init.c
@@ -390,7 +390,7 @@ static int ioat_dma_self_test(struct ioatdma_device *ioat_dma)
 	if (memcmp(src, dest, IOAT_TEST_SIZE)) {
 		dev_err(dev, "Self-test copy failed compare, disabling\n");
 		err = -ENODEV;
-		goto free_resources;
+		goto unmap_dma;
 	}
 
 unmap_dma:
-- 
2.14.1

