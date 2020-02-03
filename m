From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 03 Feb 2020 15:58:45 +0000
Subject: [PATCH -next] NFS: use correct 'verifier' in nfs_lookup_revalidate_dentry
Message-Id: <20200203155845.50239-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <trond.myklebust@hammerspace.com>, Benjamin Coddington <bcodding@redhat.com>, Anna Schumaker <anna.schumaker@netapp.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

'verifier' is already set but not used in nfs_set_verifier().

Fixes: 1346d280eafa ("NFS: Revalidate once when holding a delegation")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 fs/nfs/dir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/nfs/dir.c b/fs/nfs/dir.c
index 289052c0ae93..882ea5337627 100644
--- a/fs/nfs/dir.c
+++ b/fs/nfs/dir.c
@@ -1180,7 +1180,7 @@ nfs_lookup_revalidate_dentry(struct inode *dir, struct dentry *dentry,
 		verifier = nfs_save_change_attribute(dir);
 
 	nfs_setsecurity(inode, fattr, label);
-	nfs_set_verifier(dentry, nfs_save_change_attribute(dir));
+	nfs_set_verifier(dentry, verifier);
 
 	/* set a readdirplus hint that we had a cache miss */
 	nfs_force_use_readdirplus(dir);
