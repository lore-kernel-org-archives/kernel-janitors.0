From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Oct 2012 08:29:51 +0000
Subject: [patch] ocfs2/dlm: small signedness bug in dlm_request_all_locks()
Message-Id: <20121002082951.GJ12398@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"ret" is used to store the return value of o2net_send_message(), and not
an enum dlm_status.  Because of the type difference, if an error
happened then the check for (ret < 0) didn't work and the error wasn't
logged.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/ocfs2/dlm/dlmrecovery.c b/fs/ocfs2/dlm/dlmrecovery.c
index 15d81ad..393515b 100644
--- a/fs/ocfs2/dlm/dlmrecovery.c
+++ b/fs/ocfs2/dlm/dlmrecovery.c
@@ -789,7 +789,7 @@ static int dlm_request_all_locks(struct dlm_ctxt *dlm, u8 request_from,
 				 u8 dead_node)
 {
 	struct dlm_lock_request lr;
-	enum dlm_status ret;
+	int ret;
 
 	mlog(0, "\n");
 
@@ -802,7 +802,6 @@ static int dlm_request_all_locks(struct dlm_ctxt *dlm, u8 request_from,
 	lr.dead_node = dead_node;
 
 	// send message
-	ret = DLM_NOLOCKMGR;
 	ret = o2net_send_message(DLM_LOCK_REQUEST_MSG, dlm->key,
 				 &lr, sizeof(lr), request_from, NULL);
 
