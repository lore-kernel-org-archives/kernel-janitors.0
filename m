From: Julia Lawall <julia@diku.dk>
Date: Mon, 04 Jul 2011 14:20:17 +0000
Subject: [PATCH] drivers/mtd/lpddr/lpddr_cmds.c: eliminate double free
Message-Id: <1309789217-22947-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: Joakim Tjernlund <joakim.tjernlund@transmode.se>, Lucas De Marchi <lucas.demarchi@profusion.mobi>, Stefani Seibold <stefani@seibold.net>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Tadashi Abe <tabe@mvista.com>

From: Julia Lawall <julia@diku.dk>

The only call to lpddr_cmdset is in the function defined in lpddr_probe
drivers/mtd/lpddr/qinfo_probe.c.  If the result of calling lpddr_cmdset is
NULL, this function frees lpddr.  So lpddr should not be freed in
lpddr_cmdset.

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/mtd/lpddr/lpddr_cmds.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/lpddr/lpddr_cmds.c b/drivers/mtd/lpddr/lpddr_cmds.c
index 65655dd..b7f265e 100644
--- a/drivers/mtd/lpddr/lpddr_cmds.c
+++ b/drivers/mtd/lpddr/lpddr_cmds.c
@@ -89,7 +89,6 @@ struct mtd_info *lpddr_cmdset(struct map_info *map)
 	shared = kmalloc(sizeof(struct flchip_shared) * lpddr->numchips,
 						GFP_KERNEL);
 	if (!shared) {
-		kfree(lpddr);
 		kfree(mtd);
 		return NULL;
 	}

