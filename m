From: Colin King <colin.king@canonical.com>
Date: Sun, 07 May 2017 21:30:20 +0000
Subject: [PATCH] scsi: qla4xxx: check for null return from iscsi_lookup_endpoint
Message-Id: <20170507213020.28354-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

iscsi_lookup_endpoint can potentially return null and in 9 out of
the 10 calls to this function a null return is checked, so I think
it is pertinent to perform a null check here too and return -EINVAL
as in the other null cases.

Detected by CoverityScan, CID#147282 ("Dereference null return value")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/qla4xxx/ql4_os.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/scsi/qla4xxx/ql4_os.c b/drivers/scsi/qla4xxx/ql4_os.c
index 64c6fa563fdb..803e342e1093 100644
--- a/drivers/scsi/qla4xxx/ql4_os.c
+++ b/drivers/scsi/qla4xxx/ql4_os.c
@@ -3189,6 +3189,8 @@ static int qla4xxx_conn_bind(struct iscsi_cls_session *cls_session,
 	if (iscsi_conn_bind(cls_session, cls_conn, is_leading))
 		return -EINVAL;
 	ep = iscsi_lookup_endpoint(transport_fd);
+	if (!ep)
+		return -EINVAL;
 	conn = cls_conn->dd_data;
 	qla_conn = conn->dd_data;
 	qla_conn->qla_ep = ep->dd_data;
-- 
2.11.0

