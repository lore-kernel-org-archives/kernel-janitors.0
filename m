From: Colin King <colin.king@canonical.com>
Date: Fri, 04 Dec 2020 19:18:10 +0000
Subject: [PATCH] scsi: qla4xxx: remove redundant assignment to variable rval
Message-Id: <20201204191810.1150995-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <MW2PR07MB40429AAD3AC7C40972012788E3140@MW2PR07MB4042.namprd07.prod.outlook.com>
In-Reply-To: <MW2PR07MB40429AAD3AC7C40972012788E3140@MW2PR07MB4042.namprd07.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nilesh Javali <njavali@marvell.com>, Manish Rangankar <mrangankar@marvell.com>, GR-QLogic-Storage-Upstream@marvell.com, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable rval is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/qla4xxx/ql4_nx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/qla4xxx/ql4_nx.c b/drivers/scsi/qla4xxx/ql4_nx.c
index fd30fbd0d33c..e6e35e6958f6 100644
--- a/drivers/scsi/qla4xxx/ql4_nx.c
+++ b/drivers/scsi/qla4xxx/ql4_nx.c
@@ -1767,7 +1767,7 @@ qla4_82xx_start_firmware(struct scsi_qla_host *ha, uint32_t image_start)
 
 int qla4_82xx_try_start_fw(struct scsi_qla_host *ha)
 {
-	int rval = QLA_ERROR;
+	int rval;
 
 	/*
 	 * FW Load priority:
-- 
2.29.2
