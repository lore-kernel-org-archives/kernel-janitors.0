From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 03 Dec 2020 12:18:26 +0000
Subject: [PATCH] scsi: be2iscsi: revert "Fix a theoretical leak in beiscsi_create_eqs()"
Message-Id: <X8jXkt6eThjyVP1v@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <54f36c62-10bf-8736-39ce-27ece097d9de@proxmox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Subbu Seetharaman <subbu.seetharaman@broadcom.com>, Thomas Lamprecht <t.lamprecht@proxmox.com>
Cc: James.Bottomley@suse.de, jayamohank@hdredirect-lb5-1afb6e2973825a56.elb.us-east-1.amazonaws.com, jejb@linux.ibm.com, jitendra.bhivare@broadcom.com, kernel-janitors@vger.kernel.org, ketan.mukadam@broadcom.com, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, martin.petersen@oracle.com, stable@vger.kernel.org

My patch caused kernel Oopses and delays in boot.  Revert it.

The problem was that I moved the "mem->dma = paddr;" before the call to
be_fill_queue().  But the first thing that the be_fill_queue() function
does is memset the whole struct to zero which overwrites the assignment.

Fixes: 38b2db564d9a ("scsi: be2iscsi: Fix a theoretical leak in beiscsi_create_eqs()")
Reported-by: Thomas Lamprecht <t.lamprecht@proxmox.com>
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
My original patch was basically a clean up patch and to try silence a
static checker warning.  I've already updated the static checker to not
warn about impossible leaks and in this case we know that be_fill_queue()
cannot fail.

I was tempted to delete the "mem->va = eq_vaddress;" assignment as a
clean up but I didn't.  :P

 drivers/scsi/be2iscsi/be_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/be2iscsi/be_main.c b/drivers/scsi/be2iscsi/be_main.c
index 50e464224d47..90fcddb76f46 100644
--- a/drivers/scsi/be2iscsi/be_main.c
+++ b/drivers/scsi/be2iscsi/be_main.c
@@ -3020,7 +3020,6 @@ static int beiscsi_create_eqs(struct beiscsi_hba *phba,
 			goto create_eq_error;
 		}
 
-		mem->dma = paddr;
 		mem->va = eq_vaddress;
 		ret = be_fill_queue(eq, phba->params.num_eq_entries,
 				    sizeof(struct be_eq_entry), eq_vaddress);
@@ -3030,6 +3029,7 @@ static int beiscsi_create_eqs(struct beiscsi_hba *phba,
 			goto create_eq_error;
 		}
 
+		mem->dma = paddr;
 		ret = beiscsi_cmd_eq_create(&phba->ctrl, eq,
 					    BEISCSI_EQ_DELAY_DEF);
 		if (ret) {
@@ -3086,7 +3086,6 @@ static int beiscsi_create_cqs(struct beiscsi_hba *phba,
 			goto create_cq_error;
 		}
 
-		mem->dma = paddr;
 		ret = be_fill_queue(cq, phba->params.num_cq_entries,
 				    sizeof(struct sol_cqe), cq_vaddress);
 		if (ret) {
@@ -3096,6 +3095,7 @@ static int beiscsi_create_cqs(struct beiscsi_hba *phba,
 			goto create_cq_error;
 		}
 
+		mem->dma = paddr;
 		ret = beiscsi_cmd_cq_create(&phba->ctrl, cq, eq, false,
 					    false, 0);
 		if (ret) {
-- 
2.29.2
