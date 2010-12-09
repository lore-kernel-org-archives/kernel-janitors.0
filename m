From: Tobias Klauser <tklauser@distanz.ch>
Date: Thu, 09 Dec 2010 14:53:28 +0000
Subject: [PATCH] NFS: Remove redundant unlikely()
Message-Id: <1291906408-859-1-git-send-email-tklauser@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <Trond.Myklebust@netapp.com>, linux-nfs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

IS_ERR() already implies unlikely(), so it can be omitted here.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 fs/nfs/mount_clnt.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/nfs/mount_clnt.c b/fs/nfs/mount_clnt.c
index eceafe7..3f2a6be 100644
--- a/fs/nfs/mount_clnt.c
+++ b/fs/nfs/mount_clnt.c
@@ -248,7 +248,7 @@ void nfs_umount(const struct nfs_mount_request *info)
 		args.flags |= RPC_CLNT_CREATE_NONPRIVPORT;
 
 	clnt = rpc_create(&args);
-	if (unlikely(IS_ERR(clnt)))
+	if (IS_ERR(clnt))
 		goto out_clnt_err;
 
 	dprintk("NFS: sending UMNT request for %s:%s\n",
-- 
1.7.0.4

