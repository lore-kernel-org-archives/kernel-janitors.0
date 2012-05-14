From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 14 May 2012 19:45:28 +0000
Subject: [patch] NFS: kmalloc() doesn't return an ERR_PTR()
Message-Id: <20120514194528.GA19613@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <Trond.Myklebust@netapp.com>
Cc: linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

Obviously we should check for NULL here instead of IS_ERR().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/nfs/idmap.c b/fs/nfs/idmap.c
index ba3019f..233beea 100644
--- a/fs/nfs/idmap.c
+++ b/fs/nfs/idmap.c
@@ -644,14 +644,14 @@ static int nfs_idmap_legacy_upcall(struct key_construction *cons,
 
 	/* msg and im are freed in idmap_pipe_destroy_msg */
 	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
-	if (IS_ERR(msg)) {
-		ret = PTR_ERR(msg);
+	if (!msg) {
+		ret = -ENOMEM;
 		goto out0;
 	}
 
 	im = kmalloc(sizeof(*im), GFP_KERNEL);
-	if (IS_ERR(im)) {
-		ret = PTR_ERR(im);
+	if (!im) {
+		ret = -ENOMEM;
 		goto out1;
 	}
 
