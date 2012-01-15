From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 15 Jan 2012 11:29:39 +0000
Subject: [patch] staging: precedence bug in crystalhd_stop_tx_dma_engine()
Message-Id: <20120115112939.GD20463@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The intent here is to see if we have cleared the DMA_START_BIT flag.  We
clear it a couple lines later.  The current code has a precedence bug so
it is equivalent to "if (!dma_cntrl) { ...".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/crystalhd/crystalhd_hw.c b/drivers/staging/crystalhd/crystalhd_hw.c
index 5acf39e..eeddee9 100644
--- a/drivers/staging/crystalhd/crystalhd_hw.c
+++ b/drivers/staging/crystalhd/crystalhd_hw.c
@@ -868,8 +868,7 @@ static enum BC_STATUS crystalhd_stop_tx_dma_engine(struct crystalhd_hw *hw)
 
 	BCMLOG(BCMLOG_DBG, "Stopping TX DMA Engine..\n");
 
-	/* FIXME: jarod: invert dma_ctrl and check bit? or are there missing parens? */
-	if (!dma_cntrl & DMA_START_BIT) {
+	if (!(dma_cntrl & DMA_START_BIT)) {
 		BCMLOG(BCMLOG_DBG, "Already Stopped\n");
 		return BC_STS_SUCCESS;
 	}
