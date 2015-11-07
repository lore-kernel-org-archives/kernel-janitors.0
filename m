From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 07 Nov 2015 16:16:15 +0000
Subject: [patch 1/2] megaraid_sas: remove a stray tab
Message-Id: <20151107161615.GA30686@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kashyap Desai <kashyap.desai@avagotech.com>, Sumit Saxena <sumit.saxena@avagotech.com>
Cc: Uday Lingala <uday.lingala@avagotech.com>, "James E.J. Bottomley" <JBottomley@odin.com>, megaraidlinux.pdl@avagotech.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

One line was indented more than the others.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/megaraid/megaraid_sas_base.c b/drivers/scsi/megaraid/megaraid_sas_base.c
index cc95372..829e9e9 100644
--- a/drivers/scsi/megaraid/megaraid_sas_base.c
+++ b/drivers/scsi/megaraid/megaraid_sas_base.c
@@ -5923,9 +5923,9 @@ static void megasas_detach_one(struct pci_dev *pdev)
 
 	if (instance->ctrl_context) {
 		megasas_release_fusion(instance);
-			pd_seq_map_sz = sizeof(struct MR_PD_CFG_SEQ_NUM_SYNC) +
+		pd_seq_map_sz = sizeof(struct MR_PD_CFG_SEQ_NUM_SYNC) +
 				(sizeof(struct MR_PD_CFG_SEQ) *
-					(MAX_PHYSICAL_DEVICES - 1));
+				(MAX_PHYSICAL_DEVICES - 1));
 		for (i = 0; i < 2 ; i++) {
 			if (fusion->ld_map[i])
 				dma_free_coherent(&instance->pdev->dev,
