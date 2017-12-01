From: Colin King <colin.king@canonical.com>
Date: Fri, 01 Dec 2017 09:25:28 +0000
Subject: [PATCH] dmaengine: timb_dma: fix spelling mistake: "Couldnt" -> "Couldn't"
Message-Id: <20171201092528.8928-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in dev_err error message text.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/dma/timb_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/timb_dma.c b/drivers/dma/timb_dma.c
index 896bafb7a532..395c698edb4d 100644
--- a/drivers/dma/timb_dma.c
+++ b/drivers/dma/timb_dma.c
@@ -422,7 +422,7 @@ static int td_alloc_chan_resources(struct dma_chan *chan)
 				break;
 			else {
 				dev_err(chan2dev(chan),
-					"Couldnt allocate any descriptors\n");
+					"Couldn't allocate any descriptors\n");
 				return -ENOMEM;
 			}
 		}
-- 
2.14.1

