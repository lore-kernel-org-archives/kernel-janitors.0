From: Colin King <colin.king@canonical.com>
Date: Thu, 28 Jan 2021 14:49:35 +0000
Subject: [PATCH][next] nfsd: fix check of statid returned from call to find_stateid_by_type
Message-Id: <20210128144935.640026-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J . Bruce Fields" <bfields@fieldses.org>, Chuck Lever <chuck.lever@oracle.com>, linux-nfs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The call to find_stateid_by_type is setting the return value in *stid
yet the NULL check of the return is checking stid instead of *stid.
Fix this by adding in the missing pointer * operator.

Addresses-Coverity: ("Dereference before null check")
Fixes: 6cdaa72d4dde ("nfsd: find_cpntf_state cleanup")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/nfsd/nfs4state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
index f554e3480bb1..423fd6683f3a 100644
--- a/fs/nfsd/nfs4state.c
+++ b/fs/nfsd/nfs4state.c
@@ -5824,7 +5824,7 @@ static __be32 find_cpntf_state(struct nfsd_net *nn, stateid_t *st,
 
 	*stid = find_stateid_by_type(found, &cps->cp_p_stateid,
 			NFS4_DELEG_STID|NFS4_OPEN_STID|NFS4_LOCK_STID);
-	if (stid)
+	if (*stid)
 		status = nfs_ok;
 	else
 		status = nfserr_bad_stateid;
-- 
2.29.2
