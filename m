From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 28 May 2015 21:02:18 +0000
Subject: [PATCH 3/9] NFS: drop unneeded goto
Message-Id: <1432846944-7122-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1432846944-7122-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1432846944-7122-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <trond.myklebust@primarydata.com>
Cc: kernel-janitors@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>, linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Delete jump to a label on the next line, when that label is not
used elsewhere.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r@
identifier l;
@@

-if (...) goto l;
-l:
// </smpl>

Also drop the unnecessary ret variable.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 fs/nfs/nfs4idmap.c |    7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/fs/nfs/nfs4idmap.c b/fs/nfs/nfs4idmap.c
index 2e1737c..535dfc6 100644
--- a/fs/nfs/nfs4idmap.c
+++ b/fs/nfs/nfs4idmap.c
@@ -494,12 +494,7 @@ nfs_idmap_delete(struct nfs_client *clp)
 
 int nfs_idmap_init(void)
 {
-	int ret;
-	ret = nfs_idmap_init_keyring();
-	if (ret != 0)
-		goto out;
-out:
-	return ret;
+	return nfs_idmap_init_keyring();
 }
 
 void nfs_idmap_quit(void)

