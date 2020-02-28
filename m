From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Feb 2020 09:25:54 +0000
Subject: [PATCH] mtd: lpddr: Fix a double free in probe()
Message-Id: <20200228092554.o57igp3nqhyvf66t@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miquel Raynal <miquel.raynal@bootlin.com>, Alexey Korolev <akorolev@infradead.org>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, David Woodhouse <David.Woodhouse@intel.com>, Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org, Steve Winslow <swinslow@gmail.com>, Allison Randal <allison@lohutok.net>, Vignesh Raghavendra <vigneshr@ti.com>

This function is only called from lpddr_probe().  We free "lpddr" both
here and in the caller, so it's a double free.  The best place to free
"lpddr" is in lpddr_probe() so let's delete this one.

Fixes: 8dc004395d5e ("[MTD] LPDDR qinfo probing.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mtd/lpddr/lpddr_cmds.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/lpddr/lpddr_cmds.c b/drivers/mtd/lpddr/lpddr_cmds.c
index 1efc643c9871..9341a8a592e8 100644
--- a/drivers/mtd/lpddr/lpddr_cmds.c
+++ b/drivers/mtd/lpddr/lpddr_cmds.c
@@ -68,7 +68,6 @@ struct mtd_info *lpddr_cmdset(struct map_info *map)
 	shared = kmalloc_array(lpddr->numchips, sizeof(struct flchip_shared),
 						GFP_KERNEL);
 	if (!shared) {
-		kfree(lpddr);
 		kfree(mtd);
 		return NULL;
 	}
-- 
2.11.0
