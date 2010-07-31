From: Dan Carpenter <error27@gmail.com>
Date: Sat, 31 Jul 2010 20:26:31 +0000
Subject: [patch] ceph: create_workqueue() doesn't return ERR_PTR
Message-Id: <20100731202631.GH26313@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sage Weil <sage@newdream.net>
Cc: Yehuda Sadeh <yehuda@hq.newdream.net>, ceph-devel@vger.kernel.org, kernel-janitors@vger.kernel.org

create_workqueue() returns a NULL pointer on errors.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/ceph/messenger.c b/fs/ceph/messenger.c
index 15167b2..d959dba 100644
--- a/fs/ceph/messenger.c
+++ b/fs/ceph/messenger.c
@@ -94,11 +94,9 @@ struct workqueue_struct *ceph_msgr_wq;
 int __init ceph_msgr_init(void)
 {
 	ceph_msgr_wq = create_workqueue("ceph-msgr");
-	if (IS_ERR(ceph_msgr_wq)) {
-		int ret = PTR_ERR(ceph_msgr_wq);
-		pr_err("msgr_init failed to create workqueue: %d\n", ret);
-		ceph_msgr_wq = NULL;
-		return ret;
+	if (!ceph_msgr_wq) {
+		pr_err("msgr_init failed to create workqueue\n");
+		return -ENOMEM;
 	}
 	return 0;
 }
