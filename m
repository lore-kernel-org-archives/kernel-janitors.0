From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 17 Sep 2016 15:27:57 +0000
Subject: [PATCH 17/24] ste_dma40: Move an assignment in d40_prep_desc()
Message-Id: <4b7f5854-3ecd-eaa0-3c0e-d14915708e06@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <92810066-69b6-94e7-dcec-a28594b1328f@users.sourceforge.net>
In-Reply-To: <92810066-69b6-94e7-dcec-a28594b1328f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 17 Sep 2016 15:54:12 +0200

Move one assignment for the local variable "cfg" so that its setting
will only be performed after a call of the function "d40_desc_get"
succeeded by this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/dma/ste_dma40.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 7f38496..4a21778 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -2196,7 +2196,7 @@ static struct d40_desc *
 d40_prep_desc(struct d40_chan *chan, struct scatterlist *sg,
 	      unsigned int sg_len, unsigned long dma_flags)
 {
-	struct stedma40_chan_cfg *cfg = &chan->dma_cfg;
+	struct stedma40_chan_cfg *cfg;
 	struct d40_desc *desc;
 	int ret;
 
@@ -2204,6 +2204,7 @@ d40_prep_desc(struct d40_chan *chan, struct scatterlist *sg,
 	if (!desc)
 		return NULL;
 
+	cfg = &chan->dma_cfg;
 	desc->lli_len = d40_sg_2_dmalen(sg, sg_len, cfg->src_info.data_width,
 					cfg->dst_info.data_width);
 	if (desc->lli_len < 0) {
-- 
2.10.0

