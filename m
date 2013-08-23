From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Aug 2013 09:30:56 +0000
Subject: [patch] dma: cppi41: off by one in desc_to_chan()
Message-Id: <20130823093056.GG31293@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vinod.koul@intel.com>
Cc: Dan Williams <djbw@fb.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org

The test here should be ">=" instead of ">".  The cdd->chan_busy[] array
has "ALLOC_DECS_NUM" elements.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/dma/cppi41.c b/drivers/dma/cppi41.c
index 5dcebca..7f6524c 100644
--- a/drivers/dma/cppi41.c
+++ b/drivers/dma/cppi41.c
@@ -241,7 +241,7 @@ static struct cppi41_channel *desc_to_chan(struct cppi41_dd *cdd, u32 desc)
 	}
 
 	desc_num = (desc - cdd->descs_phys) / sizeof(struct cppi41_desc);
-	BUG_ON(desc_num > ALLOC_DECS_NUM);
+	BUG_ON(desc_num >= ALLOC_DECS_NUM);
 	c = cdd->chan_busy[desc_num];
 	cdd->chan_busy[desc_num] = NULL;
 	return c;
