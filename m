From: Colin King <colin.king@canonical.com>
Date: Fri, 22 Dec 2017 01:18:05 +0000
Subject: [PATCH][V2] nfsd: fix incorrect indentation on goto and break statements
Message-Id: <20171222011805.12888-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J . Bruce Fields" <bfields@fieldses.org>, Jeff Layton <jlayton@kernel.org>, linux-nfs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The goto and break statements requires one more level of
indentation, add it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/nfsd/nfs4state.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
index b29b5a185a2c..e3ba585fe3be 100644
--- a/fs/nfsd/nfs4state.c
+++ b/fs/nfsd/nfs4state.c
@@ -6151,15 +6151,15 @@ nfsd4_lockt(struct svc_rqst *rqstp, struct nfsd4_compound_state *cstate,
 		case NFS4_READ_LT:
 		case NFS4_READW_LT:
 			file_lock->fl_type = F_RDLCK;
-		break;
+			break;
 		case NFS4_WRITE_LT:
 		case NFS4_WRITEW_LT:
 			file_lock->fl_type = F_WRLCK;
-		break;
+			break;
 		default:
 			dprintk("NFSD: nfs4_lockt: bad lock type!\n");
 			status = nfserr_inval;
-		goto out;
+			goto out;
 	}
 
 	lo = find_lockowner_str(cstate->clp, &lockt->lt_owner);
-- 
2.14.1

