From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 07 Mar 2014 11:18:17 +0000
Subject: [patch] staging: unisys/uislib: kthread_create() returns an ERR_PTR
Message-Id: <20140307111817.GA2351@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

kthread_create() returns an ERR_PTR on error, it never returns NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/unisys/uislib/uisthread.c b/drivers/staging/unisys/uislib/uisthread.c
index ecf4bfcb34a6..782b06aad56d 100644
--- a/drivers/staging/unisys/uislib/uisthread.c
+++ b/drivers/staging/unisys/uislib/uisthread.c
@@ -45,7 +45,7 @@ uisthread_start(struct uisthread_info *thrinfo,
 	/* used to stop the thread */
 	init_completion(&thrinfo->has_stopped);
 	thrinfo->task = kthread_create(threadfn, thrcontext, name, NULL);
-	if (thrinfo->task = NULL) {
+	if (IS_ERR(thrinfo->task)) {
 		thrinfo->id = 0;
 		return 0;	/* failure */
 	}
