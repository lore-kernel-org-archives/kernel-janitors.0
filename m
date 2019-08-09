From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 09 Aug 2019 15:02:14 +0000
Subject: [PATCH] scsi: pmcraid: Fix a typo - pcmraid --> pmcraid
Message-Id: <20190809150214.24454-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jejb@linux.ibm.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

This should be 'pmcraid', not 'pcmraid'

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/scsi/pmcraid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/pmcraid.c b/drivers/scsi/pmcraid.c
index ca22526aff7f..a052e2450efb 100644
--- a/drivers/scsi/pmcraid.c
+++ b/drivers/scsi/pmcraid.c
@@ -5841,7 +5841,7 @@ static int pmcraid_probe(struct pci_dev *pdev,
 }
 
 /*
- * PCI driver structure of pcmraid driver
+ * PCI driver structure of pmcraid driver
  */
 static struct pci_driver pmcraid_driver = {
 	.name = PMCRAID_DRIVER_NAME,
-- 
2.20.1
