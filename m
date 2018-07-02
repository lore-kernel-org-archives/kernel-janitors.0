From: Colin King <colin.king@canonical.com>
Date: Mon, 02 Jul 2018 07:30:22 +0000
Subject: [PATCH] sata_nv: remove redundant pointers sdev0 and sdev1
Message-Id: <20180702073022.10000-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tejun Heo <tj@kernel.org>, linux-ide@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointers sdev0 and sdev1 are being assigned but are never used hence they
are redundant and can be removed.

Cleans up clang warnings:
warning: variable 'sdev0' set but not used [-Wunused-but-set-variable]
warning: variable 'sdev1' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/ata/sata_nv.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/ata/sata_nv.c b/drivers/ata/sata_nv.c
index 10ae11aa1926..72c9b922a77b 100644
--- a/drivers/ata/sata_nv.c
+++ b/drivers/ata/sata_nv.c
@@ -675,7 +675,6 @@ static int nv_adma_slave_config(struct scsi_device *sdev)
 	struct ata_port *ap = ata_shost_to_port(sdev->host);
 	struct nv_adma_port_priv *pp = ap->private_data;
 	struct nv_adma_port_priv *port0, *port1;
-	struct scsi_device *sdev0, *sdev1;
 	struct pci_dev *pdev = to_pci_dev(ap->host->dev);
 	unsigned long segment_boundary, flags;
 	unsigned short sg_tablesize;
@@ -736,8 +735,6 @@ static int nv_adma_slave_config(struct scsi_device *sdev)
 
 	port0 = ap->host->ports[0]->private_data;
 	port1 = ap->host->ports[1]->private_data;
-	sdev0 = ap->host->ports[0]->link.device[0].sdev;
-	sdev1 = ap->host->ports[1]->link.device[0].sdev;
 	if ((port0->flags & NV_ADMA_ATAPI_SETUP_COMPLETE) ||
 	    (port1->flags & NV_ADMA_ATAPI_SETUP_COMPLETE)) {
 		/*
-- 
2.17.1

