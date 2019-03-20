From: Colin King <colin.king@canonical.com>
Date: Wed, 20 Mar 2019 16:50:00 +0000
Subject: [PATCH] scsi: mpt3sas: fix indentation issue
Message-Id: <20190320165000.29340-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sathya Prakash <sathya.prakash@broadcom.com>, Chaitra P B <chaitra.basappa@broadcom.com>, Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are a couple of statements that are incorrectly indented, fix
these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/mpt3sas/mpt3sas_base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/mpt3sas/mpt3sas_base.c b/drivers/scsi/mpt3sas/mpt3sas_base.c
index 0aca627e21e8..9c7012f4c412 100644
--- a/drivers/scsi/mpt3sas/mpt3sas_base.c
+++ b/drivers/scsi/mpt3sas/mpt3sas_base.c
@@ -1523,8 +1523,8 @@ _base_process_reply_queue(struct adapter_reply_queue *reply_q)
 				reply_q->irq_poll_scheduled = true;
 				irq_poll_sched(&reply_q->irqpoll);
 			}
-				atomic_dec(&reply_q->busy);
-				return completed_cmds;
+			atomic_dec(&reply_q->busy);
+			return completed_cmds;
 		}
 		if (request_descript_type = MPI2_RPY_DESCRIPT_FLAGS_UNUSED)
 			goto out;
-- 
2.20.1
