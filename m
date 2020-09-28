From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 28 Sep 2020 09:13:00 +0000
Subject: [PATCH] scsi: be2iscsi: Fix a theoretical leak in beiscsi_create_eqs()
Message-Id: <20200928091300.GD377727@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Subbu Seetharaman <subbu.seetharaman@broadcom.com>
Cc: Ketan Mukadam <ketan.mukadam@broadcom.com>, Jitendra Bhivare <jitendra.bhivare@broadcom.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, James Bottomley <James.Bottomley@suse.de>, Jayamohan Kallickal <jayamohank@HDRedirect-LB5-1afb6e2973825a56.elb.us-east-1.amazonaws.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The be_fill_queue() function can only fail when "eq_vaddress" is NULL
and since it's non-NULL here that means the function call can't fail.
But imagine if it could, then in that situation we would want to store
the "paddr" so that dma memory can be released.

Fixes: bfead3b2cb46 ("[SCSI] be2iscsi: Adding msix and mcc_rings V3")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/scsi/be2iscsi/be_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/be2iscsi/be_main.c b/drivers/scsi/be2iscsi/be_main.c
index 5c3513a4b450..202ba925c494 100644
--- a/drivers/scsi/be2iscsi/be_main.c
+++ b/drivers/scsi/be2iscsi/be_main.c
@@ -3020,6 +3020,7 @@ static int beiscsi_create_eqs(struct beiscsi_hba *phba,
 			goto create_eq_error;
 		}
 
+		mem->dma = paddr;
 		mem->va = eq_vaddress;
 		ret = be_fill_queue(eq, phba->params.num_eq_entries,
 				    sizeof(struct be_eq_entry), eq_vaddress);
@@ -3029,7 +3030,6 @@ static int beiscsi_create_eqs(struct beiscsi_hba *phba,
 			goto create_eq_error;
 		}
 
-		mem->dma = paddr;
 		ret = beiscsi_cmd_eq_create(&phba->ctrl, eq,
 					    BEISCSI_EQ_DELAY_DEF);
 		if (ret) {
@@ -3086,6 +3086,7 @@ static int beiscsi_create_cqs(struct beiscsi_hba *phba,
 			goto create_cq_error;
 		}
 
+		mem->dma = paddr;
 		ret = be_fill_queue(cq, phba->params.num_cq_entries,
 				    sizeof(struct sol_cqe), cq_vaddress);
 		if (ret) {
@@ -3095,7 +3096,6 @@ static int beiscsi_create_cqs(struct beiscsi_hba *phba,
 			goto create_cq_error;
 		}
 
-		mem->dma = paddr;
 		ret = beiscsi_cmd_cq_create(&phba->ctrl, cq, eq, false,
 					    false, 0);
 		if (ret) {
-- 
2.28.0
