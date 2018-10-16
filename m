From: Colin King <colin.king@canonical.com>
Date: Tue, 16 Oct 2018 17:46:32 +0000
Subject: [PATCH] scsi: be2iscsi: fix spelling mistake "Retreiving" -> "Retrieving"
Message-Id: <20181016174632.2022-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Subbu Seetharaman <subbu.seetharaman@broadcom.com>, Ketan Mukadam <ketan.mukadam@broadcom.com>, Jitendra Bhivare <jitendra.bhivare@broadcom.com>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in beiscsi_log message.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/be2iscsi/be_iscsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/be2iscsi/be_iscsi.c b/drivers/scsi/be2iscsi/be_iscsi.c
index c8f0a2144b44..6dfdf9cee8a9 100644
--- a/drivers/scsi/be2iscsi/be_iscsi.c
+++ b/drivers/scsi/be2iscsi/be_iscsi.c
@@ -771,7 +771,7 @@ int beiscsi_get_host_param(struct Scsi_Host *shost,
 			status = beiscsi_get_initiator_name(phba, buf, false);
 			if (status < 0) {
 				beiscsi_log(phba, KERN_ERR, BEISCSI_LOG_CONFIG,
-					    "BS_%d : Retreiving Initiator Name Failed\n");
+					    "BS_%d : Retrieving Initiator Name Failed\n");
 				status = 0;
 			}
 		}
-- 
2.19.1
