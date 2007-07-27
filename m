From: Yoann Padioleau <padator@wanadoo.fr>
Date: Fri, 27 Jul 2007 09:44:07 +0000
Subject: [PATCH 02/68] 0 -> NULL, for arch/arm
Message-Id: <200707270944.LAA17082@ifs.emn.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: rmk@arm.linux.org.uk, akpm@linux-foundation.org, linux-kernel@vger.kernel.org


When comparing a pointer, it's clearer to compare it to NULL than to 0.

Here is an excerpt of the semantic patch: 

@@
expression *E;
@@

  E =
- 0
+ NULL

@@
expression *E;
@@

  E !- 0
+ NULL

Signed-off-by: Yoann Padioleau <padator@wanadoo.fr>
Cc: rmk@arm.linux.org.uk
Cc: akpm@linux-foundation.org
---

 common/dmabounce.c |    2 +-
 mach-omap1/clock.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/common/dmabounce.c b/arch/arm/common/dmabounce.c
index b36b1e8..74ff750 100644
--- a/arch/arm/common/dmabounce.c
+++ b/arch/arm/common/dmabounce.c
@@ -238,7 +238,7 @@ map_single(struct device *dev, void *ptr
 		struct safe_buffer *buf;
 
 		buf = alloc_safe_buffer(device_info, ptr, size, dir);
-		if (buf = 0) {
+		if (buf = NULL) {
 			dev_err(dev, "%s: unable to map unsafe buffer %p!\n",
 			       __func__, ptr);
 			return 0;
diff --git a/arch/arm/mach-omap1/clock.c b/arch/arm/mach-omap1/clock.c
index f625f6d..b7e1b22 100644
--- a/arch/arm/mach-omap1/clock.c
+++ b/arch/arm/mach-omap1/clock.c
@@ -193,7 +193,7 @@ static int calc_dsor_exp(struct clk *clk
 		return -EINVAL;
 
 	parent = clk->parent;
-	if (unlikely(parent = 0))
+	if (unlikely(parent = NULL))
 		return -EIO;
 
 	realrate = parent->rate;

