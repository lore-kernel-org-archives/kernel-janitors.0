From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 13 Sep 2018 02:40:56 +0000
Subject: [PATCH -next] scsi: qla2xxx: Remove set but not used variable 'ptr_dma'
Message-Id: <1536806456-124627-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/scsi/qla2xxx/qla_iocb.c: In function 'qla24xx_els_dcmd2_iocb':
drivers/scsi/qla2xxx/qla_iocb.c:2644:13: warning:
 variable 'ptr_dma' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/scsi/qla2xxx/qla_iocb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/scsi/qla2xxx/qla_iocb.c b/drivers/scsi/qla2xxx/qla_iocb.c
index 4de9102..86fb8b2 100644
--- a/drivers/scsi/qla2xxx/qla_iocb.c
+++ b/drivers/scsi/qla2xxx/qla_iocb.c
@@ -2641,7 +2641,6 @@ struct fw_dif_context {
 	struct qla_hw_data *ha = vha->hw;
 	int rval = QLA_SUCCESS;
 	void	*ptr, *resp_ptr;
-	dma_addr_t ptr_dma;
 
 	/* Alloc SRB structure */
 	sp = qla2x00_get_sp(vha, fcport, GFP_KERNEL);
@@ -2673,7 +2672,6 @@ struct fw_dif_context {
 	ptr = elsio->u.els_plogi.els_plogi_pyld  	    dma_alloc_coherent(&ha->pdev->dev, DMA_POOL_SIZE,
 		&elsio->u.els_plogi.els_plogi_pyld_dma, GFP_KERNEL);
-	ptr_dma = elsio->u.els_plogi.els_plogi_pyld_dma;
 
 	if (!elsio->u.els_plogi.els_plogi_pyld) {
 		rval = QLA_FUNCTION_FAILED;
