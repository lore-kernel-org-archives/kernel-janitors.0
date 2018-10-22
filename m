From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 22 Oct 2018 06:50:23 +0000
Subject: [PATCH] scsi: lpfc: Uninitialized variable in lpfc_debugfs_nodelist_data()
Message-Id: <20181022065023.kxoqxbghtfh3yox2@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There was a merge problem and we accidentally removed the "nrport"
initialization.

Fixes: 77c5bf5647b5 ("Merge branch 'misc' into for-next")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/scsi/lpfc/lpfc_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/lpfc/lpfc_debugfs.c b/drivers/scsi/lpfc/lpfc_debugfs.c
index c6912394b56d..0c8005bb0f53 100644
--- a/drivers/scsi/lpfc/lpfc_debugfs.c
+++ b/drivers/scsi/lpfc/lpfc_debugfs.c
@@ -550,7 +550,7 @@ lpfc_debugfs_nodelist_data(struct lpfc_vport *vport, char *buf, int size)
 	struct lpfc_nodelist *ndlp;
 	unsigned char *statep;
 	struct nvme_fc_local_port *localport;
-	struct nvme_fc_remote_port *nrport;
+	struct nvme_fc_remote_port *nrport = NULL;
 	struct lpfc_nvme_rport *rport;
 
 	cnt = (LPFC_NODELIST_SIZE / LPFC_NODELIST_ENTRY_SIZE);
-- 
2.11.0
