From: Julia Lawall <julia@diku.dk>
Date: Sat, 06 Feb 2010 08:45:15 +0000
Subject: [PATCH 11/11] fs/xfs: Correct NULL test
Message-Id: <Pine.LNX.4.64.1002060944580.8092@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Elder <aelder@sgi.com>, xfs-masters@oss.sgi.com, xfs@oss.sgi.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Test the value that was just allocated rather than the previously tested one.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r@
expression *x;
expression e;
identifier l;
@@

if (x = NULL || ...) {
    ... when forall
    return ...; }
... when != goto l;
    when != x = e
    when != &x
*x = NULL
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 fs/xfs/quota/xfs_qm.c               |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/xfs/quota/xfs_qm.c b/fs/xfs/quota/xfs_qm.c
index 11cfd82..4318cd5 100644
--- a/fs/xfs/quota/xfs_qm.c
+++ b/fs/xfs/quota/xfs_qm.c
@@ -123,7 +123,7 @@ xfs_Gqm_init(void)
 		goto out;
 
 	gdqhash = kmem_zalloc_large(hsize);
-	if (!udqhash)
+	if (!gdqhash)
 		goto out_free_udqhash;
 
 	hsize /= sizeof(xfs_dqhash_t);
