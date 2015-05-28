From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 28 May 2015 21:02:24 +0000
Subject: [PATCH 9/9] regmap: drop unneeded goto
Message-Id: <1432846944-7122-10-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1432846944-7122-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1432846944-7122-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Delete jump to a label on the next line, when that label is not
used elsewhere.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r@
identifier l;
@@

-if (...) goto l;
-l:
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/base/regmap/regmap.c |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index e5eef6f..3378a11 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -2583,10 +2583,7 @@ int regmap_register_patch(struct regmap *map, const struct reg_default *regs,
 	map->async = true;
 
 	ret = _regmap_multi_reg_write(map, regs, num_regs);
-	if (ret != 0)
-		goto out;
 
-out:
 	map->async = false;
 	map->cache_bypass = bypass;
 

