From: Dan Carpenter <error27@gmail.com>
Date: Sat, 21 Aug 2010 08:43:25 +0000
Subject: [patch] ata/sata_dwc_460ex: signdness bug
Message-Id: <20100821084325.GF6674@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Garzik <jgarzik@pobox.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Rupjyoti Sarmah <rsarmah@appliedmicro.com>, Prodyut Hazarika <phazarika@appliedmicro.com>, Grant Likely <grant.likely@secretlab.ca>, linux-ide@vger.kernel.org, kernel-janitors@vger.kernel.org

dma_dwc_xfer_setup() returns an int and "dma_chan" needs to be signed
for the error handling to work.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/ata/sata_dwc_460ex.c b/drivers/ata/sata_dwc_460ex.c
index 2673a3d..6cf57c5 100644
--- a/drivers/ata/sata_dwc_460ex.c
+++ b/drivers/ata/sata_dwc_460ex.c
@@ -1459,7 +1459,7 @@ static void sata_dwc_qc_prep_by_tag(struct ata_queued_cmd *qc, u8 tag)
 {
 	struct scatterlist *sg = qc->sg;
 	struct ata_port *ap = qc->ap;
-	u32 dma_chan;
+	int dma_chan;
 	struct sata_dwc_device *hsdev = HSDEV_FROM_AP(ap);
 	struct sata_dwc_device_port *hsdevp = HSDEVP_FROM_AP(ap);
 	int err;
