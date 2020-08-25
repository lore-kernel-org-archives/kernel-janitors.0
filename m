From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 25 Aug 2020 10:47:07 +0000
Subject: [PATCH] memory: omap-gpmc: Fix a couple off by ones
Message-Id: <20200825104707.GB278587@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roger Quadros <rogerq@ti.com>
Cc: Tony Lindgren <tony@atomide.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jon Hunter <jon-hunter@ti.com>, linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

These comparisons should be >= instead of > to prevent reading one
element beyond the end of the gpmc_cs[] array.

Fixes: cdd6928c589a ("ARM: OMAP2+: Add device-tree support for NOR flash")
Fixes: f37e4580c409 ("ARM: OMAP2: Dynamic allocator for GPMC memory space")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/memory/omap-gpmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index cd9e80748591..fd245b82163a 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -989,7 +989,7 @@ static int gpmc_cs_remap(int cs, u32 base)
 	int ret;
 	u32 old_base, size;
 
-	if (cs > gpmc_cs_num) {
+	if (cs >= gpmc_cs_num) {
 		pr_err("%s: requested chip-select is disabled\n", __func__);
 		return -ENODEV;
 	}
@@ -1024,7 +1024,7 @@ int gpmc_cs_request(int cs, unsigned long size, unsigned long *base)
 	struct resource *res = &gpmc->mem;
 	int r = -1;
 
-	if (cs > gpmc_cs_num) {
+	if (cs >= gpmc_cs_num) {
 		pr_err("%s: requested chip-select is disabled\n", __func__);
 		return -ENODEV;
 	}
-- 
2.28.0
