From: Dan Carpenter <error27@gmail.com>
Date: Tue, 03 Aug 2010 17:21:05 +0000
Subject: [patch] dlm: create_workqueue() doesn't return ERR_PTR
Message-Id: <20100803172105.GT26313@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The code was checking for IS_ERR() but create_workqueue() and friends
return NULL on error.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index c0d35c6..24687c6 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1430,20 +1430,17 @@ static void work_stop(void)
 
 static int work_start(void)
 {
-	int error;
 	recv_workqueue = create_workqueue("dlm_recv");
-	error = IS_ERR(recv_workqueue);
-	if (error) {
-		log_print("can't start dlm_recv %d", error);
-		return error;
+	if (!recv_workqueue) {
+		log_print("can't start dlm_recv");
+		return -ENOMEM;
 	}
 
 	send_workqueue = create_singlethread_workqueue("dlm_send");
-	error = IS_ERR(send_workqueue);
-	if (error) {
-		log_print("can't start dlm_send %d", error);
+	if (!send_workqueue) {
+		log_print("can't start dlm_send");
 		destroy_workqueue(recv_workqueue);
-		return error;
+		return -ENOMEM;
 	}
 
 	return 0;
