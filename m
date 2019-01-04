From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 04 Jan 2019 06:47:03 +0000
Subject: [PATCH] nfsd: fix an IS_ERR() vs NULL check
Message-Id: <20190104064703.GB30627@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J. Bruce Fields" <bfields@fieldses.org>, NeilBrown <neilb@suse.com>
Cc: Jeff Layton <jlayton@kernel.org>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

The get_backchannel_cred() used to return error pointers on error but
now it returns NULL pointers.

Fixes: 97f68c6b02e0 ("SUNRPC: add 'struct cred *' to auth_cred and rpc_cre")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/nfsd/nfs4callback.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/nfsd/nfs4callback.c b/fs/nfsd/nfs4callback.c
index c74e4538d0eb..9b38dab1c21b 100644
--- a/fs/nfsd/nfs4callback.c
+++ b/fs/nfsd/nfs4callback.c
@@ -913,9 +913,9 @@ static int setup_callback_client(struct nfs4_client *clp, struct nfs4_cb_conn *c
 		return PTR_ERR(client);
 	}
 	cred = get_backchannel_cred(clp, client, ses);
-	if (IS_ERR(cred)) {
+	if (!cred) {
 		rpc_shutdown_client(client);
-		return PTR_ERR(cred);
+		return -ENOMEM;
 	}
 	clp->cl_cb_client = client;
 	clp->cl_cb_cred = cred;
-- 
2.17.1
