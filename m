From: Dan Carpenter <error27@gmail.com>
Date: Thu, 22 Apr 2010 09:30:59 +0000
Subject: [patch] nfsd: potential ERR_PTR dereference on exp_export() error
Message-Id: <20100422093059.GJ29647@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: Neil Brown <neilb@suse.de>, Trond Myklebust <Trond.Myklebust@netapp.com>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

We "goto finish" from several places where "exp" is an ERR_PTR.  Also I 
changed the check for "fsid_key" so that it was consistent with the check
I added.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/nfsd/export.c b/fs/nfsd/export.c
index 872a5ef..bfe6f3f 100644
--- a/fs/nfsd/export.c
+++ b/fs/nfsd/export.c
@@ -1071,9 +1071,9 @@ exp_export(struct nfsctl_export *nxp)
 		err = 0;
 finish:
 	kfree(new.ex_pathname);
-	if (exp)
+	if (!IS_ERR_OR_NULL(exp))
 		exp_put(exp);
-	if (fsid_key && !IS_ERR(fsid_key))
+	if (!IS_ERR_OR_NULL(fsid_key))
 		cache_put(&fsid_key->h, &svc_expkey_cache);
 	path_put(&path);
 out_put_clp:
