From: Colin King <colin.king@canonical.com>
Date: Mon, 15 Apr 2019 15:30:28 +0000
Subject: [PATCH] dmaengine: xgene-dma: fix spelling mistake "descripto" -> "descriptor"
Message-Id: <20190415153028.24849-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a chan_dbg message, fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/dma/xgene-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/xgene-dma.c b/drivers/dma/xgene-dma.c
index 002323661d07..8d174dc5dccd 100644
--- a/drivers/dma/xgene-dma.c
+++ b/drivers/dma/xgene-dma.c
@@ -797,7 +797,7 @@ static int xgene_dma_alloc_chan_resources(struct dma_chan *dchan)
 		return -ENOMEM;
 	}
 
-	chan_dbg(chan, "Allocate descripto pool\n");
+	chan_dbg(chan, "Allocate descriptor pool\n");
 
 	return 1;
 }
-- 
2.20.1
