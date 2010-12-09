From: Tobias Klauser <tklauser@distanz.ch>
Date: Thu, 09 Dec 2010 14:57:43 +0000
Subject: [PATCH] [SCSI] zfcp: Remove redundant unlikely()
Message-Id: <1291906663-1288-1-git-send-email-tklauser@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

IS_ERR() already implies unlikely(), so it can be omitted here.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 drivers/s390/scsi/zfcp_fsf.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/s390/scsi/zfcp_fsf.c b/drivers/s390/scsi/zfcp_fsf.c
index 2eb7dd5..722cdf5 100644
--- a/drivers/s390/scsi/zfcp_fsf.c
+++ b/drivers/s390/scsi/zfcp_fsf.c
@@ -1553,7 +1553,7 @@ int zfcp_fsf_open_wka_port(struct zfcp_fc_wka_port *wka_port)
 				  SBAL_FLAGS0_TYPE_READ,
 				  qdio->adapter->pool.erp_req);
 
-	if (unlikely(IS_ERR(req))) {
+	if (IS_ERR(req)) {
 		retval = PTR_ERR(req);
 		goto out;
 	}
@@ -1606,7 +1606,7 @@ int zfcp_fsf_close_wka_port(struct zfcp_fc_wka_port *wka_port)
 				  SBAL_FLAGS0_TYPE_READ,
 				  qdio->adapter->pool.erp_req);
 
-	if (unlikely(IS_ERR(req))) {
+	if (IS_ERR(req)) {
 		retval = PTR_ERR(req);
 		goto out;
 	}
-- 
1.7.0.4

