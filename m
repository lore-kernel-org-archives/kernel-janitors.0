From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 29 Nov 2012 14:16:51 +0000
Subject: [patch] mtg: docg3: potential divide by zero in doc_write_oob()
Message-Id: <20121129141651.GA12199@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: Mike Dunn <mikedunn@newsguy.com>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org, Ivan Djelic <ivan.djelic@parrot.com>, Robert Jarzmik <robert.jarzmik@free.fr>

If we set oobdelta to zero then we will either return -EINVAL or hit
a divide (modulus) by zero on the next line when we check
"(ooblen % oobdelta)".  It's better to just return -EINVAL here instead.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static analysis.  I don't know if it's actually possible to hit this
condition.

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index d34d83b..8510ccb 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -1440,7 +1440,7 @@ static int doc_write_oob(struct mtd_info *mtd, loff_t ofs,
 		oobdelta = mtd->ecclayout->oobavail;
 		break;
 	default:
-		oobdelta = 0;
+		return -EINVAL;
 	}
 	if ((len % DOC_LAYOUT_PAGE_SIZE) || (ooblen % oobdelta) ||
 	    (ofs % DOC_LAYOUT_PAGE_SIZE))
