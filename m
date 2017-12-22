From: Colin King <colin.king@canonical.com>
Date: Fri, 22 Dec 2017 00:35:51 +0000
Subject: [PATCH] nfsd: fix incorrect indentation on goto statement
Message-Id: <20171222003551.11110-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J . Bruce Fields" <bfields@fieldses.org>, Jeff Layton <jlayton@kernel.org>, linux-nfs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The goto statement requires one more level of indentation, add it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/nfsd/nfs4state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
index b29b5a185a2c..3bb720a59b49 100644
--- a/fs/nfsd/nfs4state.c
+++ b/fs/nfsd/nfs4state.c
@@ -6159,7 +6159,7 @@ nfsd4_lockt(struct svc_rqst *rqstp, struct nfsd4_compound_state *cstate,
 		default:
 			dprintk("NFSD: nfs4_lockt: bad lock type!\n");
 			status = nfserr_inval;
-		goto out;
+			goto out;
 	}
 
 	lo = find_lockowner_str(cstate->clp, &lockt->lt_owner);
-- 
2.14.1

