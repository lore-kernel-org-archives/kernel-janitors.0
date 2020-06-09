From: Colin King <colin.king@canonical.com>
Date: Tue, 09 Jun 2020 23:22:57 +0000
Subject: [PATCH] NFS: remove redundant pointer clnt
Message-Id: <20200609232257.1118354-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker <anna.schumaker@netapp.com>, linux-nfs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer clnt is being initialized with a value that is never
read and so this is assignment redundant and can be removed. The
pointer can removed because it is being used as a temporary
variable and it is clearer to make the direct assignment and remove
it completely.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/nfs/nfs4proc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
index e32717fd1169..7a56e2ab473b 100644
--- a/fs/nfs/nfs4proc.c
+++ b/fs/nfs/nfs4proc.c
@@ -9518,7 +9518,6 @@ _nfs41_proc_secinfo_no_name(struct nfs_server *server, struct nfs_fh *fhandle,
 		.rpc_argp = &args,
 		.rpc_resp = &res,
 	};
-	struct rpc_clnt *clnt = server->client;
 	struct nfs4_call_sync_data data = {
 		.seq_server = server,
 		.seq_args = &args.seq_args,
@@ -9535,8 +9534,7 @@ _nfs41_proc_secinfo_no_name(struct nfs_server *server, struct nfs_fh *fhandle,
 	int status;
 
 	if (use_integrity) {
-		clnt = server->nfs_client->cl_rpcclient;
-		task_setup.rpc_client = clnt;
+		task_setup.rpc_client = server->nfs_client->cl_rpcclient;
 
 		cred = nfs4_get_clid_cred(server->nfs_client);
 		msg.rpc_cred = cred;
-- 
2.27.0.rc0
