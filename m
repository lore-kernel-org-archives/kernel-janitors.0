From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Nov 2014 08:33:34 +0000
Subject: [patch] ceph: do_sync is never initialized
Message-Id: <20141128083334.GB10252@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sage Weil <sage@inktank.com>, majianpeng@gmail.com
Cc: ceph-devel@vger.kernel.org, kernel-janitors@vger.kernel.org

Probably this code was syncing a lot more often then intended because
the do_sync variable wasn't set to zero.

Fixes: c62988ec0910 ('ceph: avoid meaningless calling ceph_caps_revoking if sync_mode = WB_SYNC_ALL.')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static checker stuff.  Not tested.  It's surprising that GCC doesn't
catch this.

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 18c06bb..481529b 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -673,7 +673,7 @@ static int ceph_writepages_start(struct address_space *mapping,
 	int rc = 0;
 	unsigned wsize = 1 << inode->i_blkbits;
 	struct ceph_osd_request *req = NULL;
-	int do_sync;
+	int do_sync = 0;
 	u64 truncate_size, snap_size;
 	u32 truncate_seq;
 
