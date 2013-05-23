From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 23 May 2013 18:36:37 +0000
Subject: [patch] ceph: remove unneeded truncation
Message-Id: <20130523183636.GA10316@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sage Weil <sage@inktank.com>
Cc: ceph-devel@vger.kernel.org, kernel-janitors@vger.kernel.org

My static checker complains l->stripe_unit could still be zero after we
truncate it to 32 bits.  I don't see a reason to do the truncation so
I have removed it.  Both sides are u64 type.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/ceph/ioctl.c b/fs/ceph/ioctl.c
index e0b4ef3..98fe5e7 100644
--- a/fs/ceph/ioctl.c
+++ b/fs/ceph/ioctl.c
@@ -43,7 +43,7 @@ static long __validate_layout(struct ceph_mds_client *mdsc,
 	if ((l->object_size & ~PAGE_MASK) ||
 	    (l->stripe_unit & ~PAGE_MASK) ||
 	    (l->stripe_unit != 0 &&
-	     ((unsigned)l->object_size % (unsigned)l->stripe_unit)))
+	     (l->object_size % l->stripe_unit)))
 		return -EINVAL;
 
 	/* make sure it's a valid data pool */
