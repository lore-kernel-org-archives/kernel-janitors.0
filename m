From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sat, 30 Oct 2010 14:26:17 +0000
Subject: [PATCH] xfs: linux-2.6: xfs_ioctl: fix information leak to userland
Message-Id: <1288448778-5373-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Eric Sandeen <sandeen@redhat.com>, Alex Elder <aelder@sgi.com>, linux-kernel@vger.kernel.org, xfs@oss.sgi.com, xfs-masters@oss.sgi.com, Dave Chinner <dchinner@redhat.com>, Christoph Hellwig <hch@lst.de>

al_hreq is copied from userland.  If al_hreq.buflen is not properly aligned then
xfs_attr_list will ignore the last bytes of kbuf.  These bytes are unitialized.
It leads to leaking of contents of kernel stack memory.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Compile tested.

 fs/xfs/linux-2.6/xfs_ioctl.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/xfs/linux-2.6/xfs_ioctl.c b/fs/xfs/linux-2.6/xfs_ioctl.c
index 2ea238f..ad442d9 100644
--- a/fs/xfs/linux-2.6/xfs_ioctl.c
+++ b/fs/xfs/linux-2.6/xfs_ioctl.c
@@ -416,7 +416,7 @@ xfs_attrlist_by_handle(
 	if (IS_ERR(dentry))
 		return PTR_ERR(dentry);
 
-	kbuf = kmalloc(al_hreq.buflen, GFP_KERNEL);
+	kbuf = kzalloc(al_hreq.buflen, GFP_KERNEL);
 	if (!kbuf)
 		goto out_dput;
 
-- 
1.7.0.4

