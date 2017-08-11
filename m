From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 11 Aug 2017 06:57:37 +0000
Subject: [PATCH 2/2] bus: sunxi-rsb: constify regmap_bus structures
Message-Id: <1502434657-16701-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1502434657-16701-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1502434657-16701-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

This regmap_bus structure is only passed as the second argument to
__devm_regmap_init, which is const, so the regmap_bus structure can be
const too.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/bus/sunxi-rsb.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
index 795c9d9..dc3d781 100644
--- a/drivers/bus/sunxi-rsb.c
+++ b/drivers/bus/sunxi-rsb.c
@@ -423,7 +423,7 @@ static void regmap_sunxi_rsb_free_ctx(void *context)
 	kfree(ctx);
 }
 
-static struct regmap_bus regmap_sunxi_rsb = {
+static const struct regmap_bus regmap_sunxi_rsb = {
 	.reg_write = regmap_sunxi_rsb_reg_write,
 	.reg_read = regmap_sunxi_rsb_reg_read,
 	.free_context = regmap_sunxi_rsb_free_ctx,

