From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 23 Dec 2018 08:57:10 +0000
Subject: [PATCH 15/20] NFS: drop useless LIST_HEAD
Message-Id: <1545555435-24576-16-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545555435-24576-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1545555435-24576-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <trond.myklebust@hammerspace.com>
Cc: kernel-janitors@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>, linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org

Drop LIST_HEAD where the variable it declares has never
been used.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier x;
@@
- LIST_HEAD(x);
  ... when != x
// </smpl>

Fixes: 0e20162ed1e9 ("NFSv4.1 Use MDS auth flavor for data server connection")
Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
Successfully 0-day tested on 151 configurations.

 fs/nfs/nfs4client.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/nfs/nfs4client.c b/fs/nfs/nfs4client.c
index 2548405da1f7..735c1056a91c 100644
--- a/fs/nfs/nfs4client.c
+++ b/fs/nfs/nfs4client.c
@@ -145,7 +145,6 @@ static void
 nfs4_shutdown_ds_clients(struct nfs_client *clp)
 {
 	struct nfs4_ds_server *dss;
-	LIST_HEAD(shutdown_list);
 
 	while (!list_empty(&clp->cl_ds_clients)) {
 		dss = list_entry(clp->cl_ds_clients.next,
