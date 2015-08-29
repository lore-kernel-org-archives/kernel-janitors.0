From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 29 Aug 2015 17:30:08 +0000
Subject: [PATCH 4/8] staging: lustre: libcfs: put constant on the right of binary operator
Message-Id: <1440869412-4899-5-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1440869412-4899-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1440869412-4899-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: joe@perches.com, kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Move constants to the right of binary operators.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
constant c;
expression e;
binary operator b = {=,!=,&,|};
@@

(
- c
+ e
b
- e
+ c
|
- c < e
+ e > c
)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/libcfs/hash.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/lustre/lustre/libcfs/hash.c b/drivers/staging/lustre/lustre/libcfs/hash.c
index 0ed0631..08f0b48 100644
--- a/drivers/staging/lustre/lustre/libcfs/hash.c
+++ b/drivers/staging/lustre/lustre/libcfs/hash.c
@@ -677,8 +677,8 @@ cfs_hash_bd_findadd_locked(struct cfs_hash *hs, struct cfs_hash_bd *bd,
 			   int noref)
 {
 	return cfs_hash_bd_lookup_intent(hs, bd, key, hnode,
-					 CFS_HS_LOOKUP_IT_ADD |
-					 (!noref * CFS_HS_LOOKUP_MASK_REF));
+					 (!noref * CFS_HS_LOOKUP_MASK_REF) |
+					 CFS_HS_LOOKUP_IT_ADD);
 }
 EXPORT_SYMBOL(cfs_hash_bd_findadd_locked);
 
@@ -756,7 +756,7 @@ cfs_hash_multi_bd_findadd_locked(struct cfs_hash *hs,
 	unsigned	   i;
 
 	LASSERT(hnode != NULL);
-	intent = CFS_HS_LOOKUP_IT_PEEK | (!noref * CFS_HS_LOOKUP_MASK_REF);
+	intent = (!noref * CFS_HS_LOOKUP_MASK_REF) | CFS_HS_LOOKUP_IT_PEEK;
 
 	cfs_hash_for_each_bd(bds, n, i) {
 		ehnode = cfs_hash_bd_lookup_intent(hs, &bds[i], key,

