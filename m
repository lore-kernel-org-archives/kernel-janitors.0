From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 14 Apr 2016 09:40:06 +0000
Subject: [patch] bnx2i: silence uninitialized variable warnings
Message-Id: <20160414094006.GB16891@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: QLogic-Storage-Upstream@qlogic.com
Cc: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Presumably it isn't possible to have empty lists here, but my static
checker doesn't know that and complains that "ep" can be used
uninitialized.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/bnx2i/bnx2i_iscsi.c b/drivers/scsi/bnx2i/bnx2i_iscsi.c
index 7289437..133901f 100644
--- a/drivers/scsi/bnx2i/bnx2i_iscsi.c
+++ b/drivers/scsi/bnx2i/bnx2i_iscsi.c
@@ -675,7 +675,7 @@ bnx2i_find_ep_in_ofld_list(struct bnx2i_hba *hba, u32 iscsi_cid)
 {
 	struct list_head *list;
 	struct list_head *tmp;
-	struct bnx2i_endpoint *ep;
+	struct bnx2i_endpoint *ep = NULL;
 
 	read_lock_bh(&hba->ep_rdwr_lock);
 	list_for_each_safe(list, tmp, &hba->ep_ofld_list) {
@@ -703,7 +703,7 @@ bnx2i_find_ep_in_destroy_list(struct bnx2i_hba *hba, u32 iscsi_cid)
 {
 	struct list_head *list;
 	struct list_head *tmp;
-	struct bnx2i_endpoint *ep;
+	struct bnx2i_endpoint *ep = NULL;
 
 	read_lock_bh(&hba->ep_rdwr_lock);
 	list_for_each_safe(list, tmp, &hba->ep_destroy_list) {
