From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 01 Dec 2020 07:04:34 +0000
Subject: [PATCH 2/2] 9p: Remove unnecessary IS_ERR() check
Message-Id: <X8XrAreZVDdLX+QH@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The "fid" variable can't be an error pointer so there is no need to
check.  The code is slightly cleaner if we move the increment before
the break and remove the NULL check as well.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/9p/fid.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/9p/fid.c b/fs/9p/fid.c
index 79837f1b1c91..9d9de62592be 100644
--- a/fs/9p/fid.c
+++ b/fs/9p/fid.c
@@ -56,12 +56,11 @@ static struct p9_fid *v9fs_fid_find_inode(struct inode *inode, kuid_t uid)
 	h = (struct hlist_head *)&inode->i_private;
 	hlist_for_each_entry(fid, h, ilist) {
 		if (uid_eq(fid->uid, uid)) {
+			refcount_inc(&fid->count);
 			ret = fid;
 			break;
 		}
 	}
-	if (ret && !IS_ERR(ret))
-		refcount_inc(&ret->count);
 	spin_unlock(&inode->i_lock);
 	return ret;
 }
-- 
2.29.2
