From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 03 Sep 2016 07:05:48 +0000
Subject: [PATCH] bnx2fc: Simplify code
Message-Id: <1472886348-29813-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: QLogic-Storage-Upstream@qlogic.com, jejb@linux.vnet.ibm.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Calling 'list_splice' followed by 'INIT_LIST_HEAD' is equivalent to
'list_splice_init'.

This has been spotted with the following coccinelle script:
/////
@@
expression y,z;
@@

-   list_splice(y,z);
-   INIT_LIST_HEAD(y);
+   list_splice_init(y,z);

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/scsi/bnx2fc/bnx2fc_fcoe.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/scsi/bnx2fc/bnx2fc_fcoe.c b/drivers/scsi/bnx2fc/bnx2fc_fcoe.c
index a5052dd8d7e6..88be12a02764 100644
--- a/drivers/scsi/bnx2fc/bnx2fc_fcoe.c
+++ b/drivers/scsi/bnx2fc/bnx2fc_fcoe.c
@@ -2765,8 +2765,7 @@ static void __exit bnx2fc_mod_exit(void)
 	 * held.
 	 */
 	mutex_lock(&bnx2fc_dev_lock);
-	list_splice(&adapter_list, &to_be_deleted);
-	INIT_LIST_HEAD(&adapter_list);
+	list_splice_init(&adapter_list, &to_be_deleted);
 	adapter_count = 0;
 	mutex_unlock(&bnx2fc_dev_lock);
 
-- 
2.7.4

