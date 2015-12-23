From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 23 Dec 2015 18:06:32 +0000
Subject: [PATCH 1/5] block-LDM: One function call less in ldm_validate_tocblocks() after error detection
Message-Id: <567AE2A8.8050900@users.sourceforge.net>
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
Date: Tue, 22 Dec 2015 22:32:07 +0100

This issue was detected by using the Coccinelle software.

Let us return directly if a memory allocation failed.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 block/partitions/ldm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/partitions/ldm.c b/block/partitions/ldm.c
index e507cfb..a50385c 100644
--- a/block/partitions/ldm.c
+++ b/block/partitions/ldm.c
@@ -433,7 +433,7 @@ static bool ldm_validate_tocblocks(struct parsed_partitions *state,
 	tb[1] = kmalloc(sizeof(*tb[1]) * 3, GFP_KERNEL);
 	if (!tb[1]) {
 		ldm_crit("Out of memory.");
-		goto err;
+		return false;
 	}
 	tb[2] = (struct tocblock*)((u8*)tb[1] + sizeof(*tb[1]));
 	tb[3] = (struct tocblock*)((u8*)tb[2] + sizeof(*tb[2]));
-- 
2.6.3

