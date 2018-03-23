From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Mar 2018 11:37:05 +0000
Subject: [PATCH] nfsd: tidy return values in nfs4_delegation_exists()
Message-Id: <20180323113705.GB28518@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: Jeff Layton <jlayton@kernel.org>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

We made nfs4_delegation_exists() return a bool in 68b18f52947b ("nfsd:
make nfs4_get_existing_delegation less confusing"), but it's still
returning -EINVAL.  That's fine, because it -EINVAL becomes true which
is what we want, but it's not very tidy.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
index a64ee08aadb2..f0b5af3ca8f7 100644
--- a/fs/nfsd/nfs4state.c
+++ b/fs/nfsd/nfs4state.c
@@ -935,10 +935,10 @@ nfs4_delegation_exists(struct nfs4_client *clp, struct nfs4_file *fp)
 	list_for_each_entry(searchdp, &fp->fi_delegations, dl_perfile) {
 		searchclp = searchdp->dl_stid.sc_client;
 		if (clp = searchclp) {
-			return -EAGAIN;
+			return true;
 		}
 	}
-	return 0;
+	return false;
 }
 
 /**
