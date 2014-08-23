From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 23 Aug 2014 11:20:30 +0000
Subject: [PATCH 8/9] video: fbdev: aty: use c99 initializers in structures
Message-Id: <1408792831-25615-9-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1408792831-25615-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1408792831-25615-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Mackerras <paulus@samba.org>
Cc: josh@joshtriplett.org, kernel-janitors@vger.kernel.org, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Use c99 initializers for structures.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@decl@
identifier i1,fld;
type T;
field list[n] fs;
@@

struct i1 {
 fs
 T fld;
 ...};

@bad@
identifier decl.i1,i2;
expression e;
initializer list[decl.n] is;
@@

struct i1 i2 = { is,
+ .fld = e
- e
 ,...};
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
The patches in this series do not depend on each other.

 drivers/video/fbdev/aty/aty128fb.c |   59 +++++++++++++++++++++++++++++++------
 1 file changed, 51 insertions(+), 8 deletions(-)

diff --git a/drivers/video/fbdev/aty/aty128fb.c b/drivers/video/fbdev/aty/aty128fb.c
index ff60701..5a72fbd 100644
--- a/drivers/video/fbdev/aty/aty128fb.c
+++ b/drivers/video/fbdev/aty/aty128fb.c
@@ -324,14 +324,57 @@ struct aty128_meminfo {
 };
 
 /* various memory configurations */
-static const struct aty128_meminfo sdr_128   -	{ 4, 4, 3, 3, 1, 3, 1, 16, 30, 16, "128-bit SDR SGRAM (1:1)" };
-static const struct aty128_meminfo sdr_64    -	{ 4, 8, 3, 3, 1, 3, 1, 17, 46, 17, "64-bit SDR SGRAM (1:1)" };
-static const struct aty128_meminfo sdr_sgram -	{ 4, 4, 1, 2, 1, 2, 1, 16, 24, 16, "64-bit SDR SGRAM (2:1)" };
-static const struct aty128_meminfo ddr_sgram -	{ 4, 4, 3, 3, 2, 3, 1, 16, 31, 16, "64-bit DDR SGRAM" };
+static const struct aty128_meminfo sdr_128 = {
+	.ML = 4,
+	.MB = 4,
+	.Trcd = 3,
+	.Trp = 3,
+	.Twr = 1,
+	.CL = 3,
+	.Tr2w = 1,
+	.LoopLatency = 16,
+	.DspOn = 30,
+	.Rloop = 16,
+	.name = "128-bit SDR SGRAM (1:1)" };
+
+static const struct aty128_meminfo sdr_64 = {
+	.ML = 4,
+	.MB = 8,
+	.Trcd = 3,
+	.Trp = 3,
+	.Twr = 1,
+	.CL = 3,
+	.Tr2w = 1,
+	.LoopLatency = 17,
+	.DspOn = 46,
+	.Rloop = 17,
+	.name = "64-bit SDR SGRAM (1:1)" };
+
+static const struct aty128_meminfo sdr_sgram = {
+	.ML = 4,
+	.MB = 4,
+	.Trcd = 1,
+	.Trp = 2,
+	.Twr = 1,
+	.CL = 2,
+	.Tr2w = 1,
+	.LoopLatency = 16,
+	.DspOn = 24,
+	.Rloop = 16,
+	.name = "64-bit SDR SGRAM (2:1)" };
+
+static const struct aty128_meminfo ddr_sgram = {
+	.ML = 4,
+	.MB = 4,
+	.Trcd = 3,
+	.Trp = 3,
+	.Twr = 2,
+	.CL = 3,
+	.Tr2w = 1,
+	.LoopLatency = 16,
+	.DspOn = 31,
+	.Rloop = 16,
+	.name = "64-bit DDR SGRAM" };
 
 static struct fb_fix_screeninfo aty128fb_fix = {
 	.id		= "ATY Rage128",

