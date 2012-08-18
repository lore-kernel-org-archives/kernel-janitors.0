From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 18 Aug 2012 15:56:38 +0000
Subject: [patch] ceph: divide by zero bug in __validate_layout()
Message-Id: <20120818155638.GC22424@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sage Weil <sage@inktank.com>
Cc: ceph-devel@vger.kernel.org, kernel-janitors@vger.kernel.org

If "l->stripe_unit" is zero the the mod on the next line will cause a
divide by zero bug.  This comes from the copy_from_user() in
ceph_ioctl_set_layout_policy()

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/ceph/ioctl.c b/fs/ceph/ioctl.c
index 8e3fb69..81ec22b 100644
--- a/fs/ceph/ioctl.c
+++ b/fs/ceph/ioctl.c
@@ -42,6 +42,7 @@ static long __validate_layout(struct ceph_mds_client *mdsc,
 	/* validate striping parameters */
 	if ((l->object_size & ~PAGE_MASK) ||
 	    (l->stripe_unit & ~PAGE_MASK) ||
+	    (l->stripe_unit = 0) ||
 	    ((unsigned)l->object_size % (unsigned)l->stripe_unit))
 		return -EINVAL;
 
