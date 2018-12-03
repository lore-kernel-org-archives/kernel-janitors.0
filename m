From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 03 Dec 2018 14:47:43 +0000
Subject: [PATCH] ubifs: fix a memory leak in ubifs_lpt_calc_hash()
Message-Id: <20181203144743.5p6ve64mw32y67oy@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org

We need to free a couple memory allocations before returning on this
error path.

Fixes: a1dc58140f7e ("ubifs: authentication: Authenticate LPT")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/ubifs/lpt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
index d1d5e96350dd..c162459a1e02 100644
--- a/fs/ubifs/lpt.c
+++ b/fs/ubifs/lpt.c
@@ -1688,7 +1688,7 @@ int ubifs_lpt_calc_hash(struct ubifs_info *c, u8 *hash)
 	if (!c->nroot) {
 		err = ubifs_read_nnode(c, NULL, 0);
 		if (err)
-			return err;
+			goto out;
 	}
 
 	cnode = (struct ubifs_cnode *)c->nroot;
-- 
2.11.0
