From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Feb 2015 13:08:32 +0000
Subject: [patch] nfsd: fix comparison in fh_fsid_match()
Message-Id: <20150211130832.GA25573@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J. Bruce Fields" <bfields@fieldses.org>, Christoph Hellwig <hch@lst.de>
Cc: linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

We're supposed to be testing that the fh_fsid's match but because the
parenthesis are in the wrong place, then we only check the first
byte.

Fixes: 9558f2500a20 ('nfsd: add fh_fsid_match helper')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/nfsd/nfsfh.h b/fs/nfsd/nfsfh.h
index 84cae20..f229204 100644
--- a/fs/nfsd/nfsfh.h
+++ b/fs/nfsd/nfsfh.h
@@ -200,7 +200,7 @@ static inline bool fh_fsid_match(struct knfsd_fh *fh1, struct knfsd_fh *fh2)
 {
 	if (fh1->fh_fsid_type != fh2->fh_fsid_type)
 		return false;
-	if (memcmp(fh1->fh_fsid, fh2->fh_fsid, key_len(fh1->fh_fsid_type) != 0))
+	if (memcmp(fh1->fh_fsid, fh2->fh_fsid, key_len(fh1->fh_fsid_type)) != 0)
 		return false;
 	return true;
 }
