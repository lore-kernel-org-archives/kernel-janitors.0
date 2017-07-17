From: Colin King <colin.king@canonical.com>
Date: Mon, 17 Jul 2017 16:00:01 +0000
Subject: [PATCH][next] ubifs: fix uninitialized error variable err
Message-Id: <20170717160001.20285-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable err is not initialized and so the check to see if it is
non-zero is basically checking a random garbage value. Fix this
by initializing err to zero.

Detected by CoverityScan, CID#1451370 ("Uninitialized variable")

Fixes: 781f675e2d7e ("ubifs: Fix unlink code wrt. double hash lookups")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/ubifs/tnc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 0a213dcba2a1..ec18304fe0e1 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -1884,7 +1884,7 @@ static int search_dh_cookie(struct ubifs_info *c, const union ubifs_key *key,
 			    struct ubifs_dent_node *dent, uint32_t cookie,
 			    struct ubifs_znode **zn, int *n)
 {
-	int err;
+	int err = 0;
 	struct ubifs_znode *znode = *zn;
 	struct ubifs_zbranch *zbr;
 	union ubifs_key *dkey;
-- 
2.11.0

