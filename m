From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 May 2019 11:34:58 +0000
Subject: [PATCH] drm/mcde: Fix an uninitialized variable
Message-Id: <20190529113458.GG19119@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

We never set "vblank" to "false".

Current versions of GCC will initialize it to zero automatically at
certain optimization levels so that's probably why this didn't show up
in testing.

Fixes: 5fc537bfd000 ("drm/mcde: Add new driver for ST-Ericsson MCDE")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/mcde/mcde_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
index f3ef108a41d9..751454ae3cd1 100644
--- a/drivers/gpu/drm/mcde/mcde_display.c
+++ b/drivers/gpu/drm/mcde/mcde_display.c
@@ -65,7 +65,7 @@ enum mcde_dsi_formatter {
 void mcde_display_irq(struct mcde *mcde)
 {
 	u32 mispp, misovl, mischnl;
-	bool vblank;
+	bool vblank = false;
 
 	/* Handle display IRQs */
 	mispp = readl(mcde->regs + MCDE_MISPP);
-- 
2.20.1
