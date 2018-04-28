From: Colin King <colin.king@canonical.com>
Date: Sat, 28 Apr 2018 22:03:52 +0000
Subject: [PATCH][V2] dmaengine: stm32-mdma: fix spelling mistake: "avalaible" -> "available"
Message-Id: <20180428220352.19601-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in dev_err error message text and make
channel plural.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/dma/stm32-mdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/stm32-mdma.c b/drivers/dma/stm32-mdma.c
index 1ac775f93d9e..90d9f6bd905b 100644
--- a/drivers/dma/stm32-mdma.c
+++ b/drivers/dma/stm32-mdma.c
@@ -1521,7 +1521,7 @@ static struct dma_chan *stm32_mdma_of_xlate(struct of_phandle_args *dma_spec,
 
 	c = dma_get_any_slave_channel(&dmadev->ddev);
 	if (!c) {
-		dev_err(mdma2dev(dmadev), "No more channel avalaible\n");
+		dev_err(mdma2dev(dmadev), "No more channels available\n");
 		return NULL;
 	}
 
-- 
2.17.0

