From: Colin King <colin.king@canonical.com>
Date: Tue, 09 May 2017 13:31:21 +0000
Subject: [PATCH] nfsd: avoid out of bounds read on array nfsd4_layout_ops
Message-Id: <20170509133121.26529-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ari Kauppi <ari@synopsys.com>, "J . Bruce Fields" <bfields@fieldses.org>, Jeff Layton <jlayton@poochiereds.net>, linux-nfs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Array nfsd4_layout_ops has LAYOUT_TYPE_MAX elements (which is currently
just 6), so check for this upper bound rather than the hard coded upper
bound of 32 to avoid an out of bounds read on array nfsd4_layout_ops.

Detected by CoverityScan, CID#1433518 ("Out-of-bounds read")

Fixes: e79104c9bd2d26 ("nfsd: fix undefined behavior in nfsd4_layout_verify")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/nfsd/nfs4proc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/nfsd/nfs4proc.c b/fs/nfsd/nfs4proc.c
index 1dbf62190bee..c453a1998e00 100644
--- a/fs/nfsd/nfs4proc.c
+++ b/fs/nfsd/nfs4proc.c
@@ -1259,7 +1259,8 @@ nfsd4_layout_verify(struct svc_export *exp, unsigned int layout_type)
 		return NULL;
 	}
 
-	if (layout_type >= 32 || !(exp->ex_layout_types & (1 << layout_type))) {
+	if (layout_type >= LAYOUT_TYPE_MAX ||
+	    !(exp->ex_layout_types & (1 << layout_type))) {
 		dprintk("%s: layout type %d not supported\n",
 			__func__, layout_type);
 		return NULL;
-- 
2.11.0

