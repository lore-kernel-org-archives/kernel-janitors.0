From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 20 Sep 2017 21:53:46 +0000
Subject: [PATCH] NFS: Cleanup error handling in nfs_idmap_request_key()
Message-Id: <20170920215346.bgucxg77ayrcx6zy@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <trond.myklebust@primarydata.com>
Cc: Anna Schumaker <anna.schumaker@netapp.com>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

nfs_idmap_get_desc() can't actually return zero.  But if it did then
we would return ERR_PTR(0) which is NULL and the caller,
nfs_idmap_get_key(), doesn't expect that so it leads to a NULL pointer
dereference.

I've cleaned this up by changing the "<=" to "<" so it's more clear that
we don't return ERR_PTR(0).

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/nfs/nfs4idmap.c b/fs/nfs/nfs4idmap.c
index dd5d27da8c0c..30426c1a1bbd 100644
--- a/fs/nfs/nfs4idmap.c
+++ b/fs/nfs/nfs4idmap.c
@@ -274,7 +274,7 @@ static struct key *nfs_idmap_request_key(const char *name, size_t namelen,
 	ssize_t ret;
 
 	ret = nfs_idmap_get_desc(name, namelen, type, strlen(type), &desc);
-	if (ret <= 0)
+	if (ret < 0)
 		return ERR_PTR(ret);
 
 	rkey = request_key(&key_type_id_resolver, desc, "");
