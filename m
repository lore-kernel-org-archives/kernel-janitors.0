From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Sep 2013 07:55:23 +0000
Subject: [patch 1/4] skd: use regular version of copy_from_user()
Message-Id: <20130913075523.GE19211@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>
Cc: Jeff Moyer <jmoyer@redhat.com>, Ramprasad Chinthekindi <rchinthekindi@stec-inc.com>, Akhil Bhansali <abhansali@stec-inc.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The other __copy_from_user() calls have access_ok() checks so they are
fine, but these two don't have the check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/block/skd_main.c b/drivers/block/skd_main.c
index 6fc0296..dfd05a9 100644
--- a/drivers/block/skd_main.c
+++ b/drivers/block/skd_main.c
@@ -1736,7 +1736,7 @@ static int skd_sg_io_get_and_check_args(struct skd_device *skdev,
 		return -EINVAL;
 	}
 
-	if (__copy_from_user(sksgio->cdb, sgp->cmdp, sgp->cmd_len)) {
+	if (copy_from_user(sksgio->cdb, sgp->cmdp, sgp->cmd_len)) {
 		DPRINTK(skdev, "copy_from_user cmdp failed %p\n", sgp->cmdp);
 		return -EFAULT;
 	}
@@ -1767,7 +1767,7 @@ static int skd_sg_io_get_and_check_args(struct skd_device *skdev,
 		sksgio->iov = iov;
 		sksgio->iovcnt = sgp->iovec_count;
 
-		if (__copy_from_user(iov, sgp->dxferp, nbytes)) {
+		if (copy_from_user(iov, sgp->dxferp, nbytes)) {
 			DPRINTK(skdev, "copy_from_user iovec failed %p\n",
 				sgp->dxferp);
 			return -EFAULT;
