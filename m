From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 30 Jan 2015 10:55:07 +0000
Subject: [patch] [SCSI] mvumi: shift wrapping bug in mvumi_delete_internal_cmd()
Message-Id: <20150130105507.GA14842@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E.J. Bottomley" <JBottomley@parallels.com>, Jianyun Li <jyli@marvell.com>
Cc: linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

"m_sg->baseaddr_h" is a u32.  We shift it 32 bits before casting it to
dma_addr_t so the cast is too late.

Fixes: f0c568a478f0 ('[SCSI] mvumi: Add Marvell UMI driver')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/mvumi.c b/drivers/scsi/mvumi.c
index 3e6b866..e7f5485 100644
--- a/drivers/scsi/mvumi.c
+++ b/drivers/scsi/mvumi.c
@@ -322,7 +322,7 @@ static void mvumi_delete_internal_cmd(struct mvumi_hba *mhba,
 			sgd_getsz(mhba, m_sg, size);
 
 			phy_addr = (dma_addr_t) m_sg->baseaddr_l |
-				(dma_addr_t) ((m_sg->baseaddr_h << 16) << 16);
+				   (((dma_addr_t)m_sg->baseaddr_h << 16) << 16);
 
 			pci_free_consistent(mhba->pdev, size, cmd->data_buf,
 								phy_addr);
