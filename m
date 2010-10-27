From: Dan Carpenter <error27@gmail.com>
Date: Wed, 27 Oct 2010 21:19:04 +0000
Subject: [patch] nfsd: fix NULL dereference in setattr()
Message-Id: <20101027211904.GJ6062@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: Neil Brown <neilb@suse.de>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

The original code would oops if this were called from nfsd4_setattr()
because "filpp" is NULL.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
index 9019e8e..e044d04 100644
--- a/fs/nfsd/nfs4state.c
+++ b/fs/nfsd/nfs4state.c
@@ -3083,9 +3083,10 @@ nfs4_preprocess_stateid_op(struct nfsd4_compound_state *cstate,
 		if (status)
 			goto out;
 		renew_client(dp->dl_client);
-		if (filpp)
+		if (filpp) {
 			*filpp = find_readable_file(dp->dl_file);
-		BUG_ON(!*filpp);
+			BUG_ON(!*filpp);
+		}
 	} else { /* open or lock stateid */
 		stp = find_stateid(stateid, flags);
 		if (!stp)
