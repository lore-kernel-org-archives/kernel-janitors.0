From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Jun 2017 15:16:25 +0000
Subject: [PATCH] NFS: silence a uninitialized variable warning
Message-Id: <20170623151625.imfq5p6nwyv2nf3k@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <trond.myklebust@primarydata.com>
Cc: Anna Schumaker <anna.schumaker@netapp.com>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

Static checkers have gotten clever enough to complain that "id_long" is
uninitialized on the failure path.  It's harmless, but simple to fix.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/nfs/nfs4idmap.c b/fs/nfs/nfs4idmap.c
index 835c163f61af..dd5d27da8c0c 100644
--- a/fs/nfs/nfs4idmap.c
+++ b/fs/nfs/nfs4idmap.c
@@ -364,7 +364,8 @@ static int nfs_idmap_lookup_id(const char *name, size_t namelen, const char *typ
 		ret = -EINVAL;
 	} else {
 		ret = kstrtol(id_str, 10, &id_long);
-		*id = (__u32)id_long;
+		if (!ret)
+			*id = (__u32)id_long;
 	}
 	return ret;
 }
