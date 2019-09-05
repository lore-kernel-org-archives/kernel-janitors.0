From: Colin King <colin.king@canonical.com>
Date: Thu, 05 Sep 2019 13:42:29 +0000
Subject: [PATCH] scsi: qla2xxx: remove redundant assignment to pointer host
Message-Id: <20190905134229.21194-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190213135335.4790-1-colin.king@canonical.com>
In-Reply-To: <20190213135335.4790-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: qla2xxx-upstream@qlogic.com, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer host is being initialized with a value that is never read
and is being re-assigned a little later on. The assignment is
redundant and hence can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/qla2xxx/qla_target.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/qla2xxx/qla_target.c b/drivers/scsi/qla2xxx/qla_target.c
index 0ffda6171614..584f45a7be2f 100644
--- a/drivers/scsi/qla2xxx/qla_target.c
+++ b/drivers/scsi/qla2xxx/qla_target.c
@@ -463,7 +463,7 @@ void qlt_response_pkt_all_vps(struct scsi_qla_host *vha,
 
 	case IMMED_NOTIFY_TYPE:
 	{
-		struct scsi_qla_host *host = vha;
+		struct scsi_qla_host *host;
 		struct imm_ntfy_from_isp *entry  		    (struct imm_ntfy_from_isp *)pkt;
 
-- 
2.20.1
