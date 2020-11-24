From: Colin King <colin.king@canonical.com>
Date: Tue, 24 Nov 2020 12:15:28 +0000
Subject: [PATCH][next] drm/mcde: fix masking and bitwise-or on variable val
Message-Id: <20201124121528.395681-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The masking of val with ~MCDE_CRX1_CLKSEL_MASK is currently being
ignored because there seems to be a missing bitwise-or of val in the
following statement.  Fix this by replacing the assignment of val
with a bitwise-or.

Addresses-Coverity: ("Unused valued")
Fixes: d795fd322063 ("drm/mcde: Support DPI output")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/mcde/mcde_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
index d941026b940c..7c2e0b865441 100644
--- a/drivers/gpu/drm/mcde/mcde_display.c
+++ b/drivers/gpu/drm/mcde/mcde_display.c
@@ -738,7 +738,7 @@ static void mcde_configure_fifo(struct mcde *mcde, enum mcde_fifo fifo,
 	} else {
 		/* Use the MCDE clock for DSI */
 		val &= ~MCDE_CRX1_CLKSEL_MASK;
-		val = MCDE_CRX1_CLKSEL_MCDECLK << MCDE_CRX1_CLKSEL_SHIFT;
+		val |= MCDE_CRX1_CLKSEL_MCDECLK << MCDE_CRX1_CLKSEL_SHIFT;
 	}
 	writel(val, mcde->regs + cr1);
 	spin_unlock(&mcde->fifo_crx1_lock);
-- 
2.29.2
