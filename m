From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 23 Dec 2015 18:10:17 +0000
Subject: [PATCH 3/5] block-LDM: One function call less in ldm_partition() after error detection
Message-Id: <567AE389.1030803@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <567A6CDB.4030703@users.sourceforge.net>
 <alpine.DEB.2.10.1512231140090.4367@hadrien>
 <567AE1C6.9020108@users.sourceforge.net>
In-Reply-To: <567AE1C6.9020108@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ntfs-dev@lists.sourceforge.net, linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, Richard Russon <ldm@flatcap.org>
Cc: Julia Lawall <julia.lawall@lip6.fr>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 23 Dec 2015 13:32:51 +0100

Let us return directly if a memory allocation failed.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 block/partitions/ldm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/partitions/ldm.c b/block/partitions/ldm.c
index 856658a..3118d24 100644
--- a/block/partitions/ldm.c
+++ b/block/partitions/ldm.c
@@ -1512,7 +1512,7 @@ int ldm_partition(struct parsed_partitions *state)
 
 	ldb = kmalloc (sizeof (*ldb), GFP_KERNEL);
 	if (!ldb)
-		goto out;
+		return -1;
 
 	/* Parse and check privheads. */
 	if (!ldm_validate_privheads(state, &ldb->ph))
-- 
2.6.3

