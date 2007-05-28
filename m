From: Martin Baeuml <baeuml@gmail.com>
Date: Mon, 28 May 2007 22:28:28 +0000
Subject: [KJ] [PATCH] drivers/video: fix compiler warnings
Message-Id: <20070528222828.GA25955@sisko.site>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Fix some compile warnings:
warning: ‘*’ may be used uninitialized in this function

Signed-off-by: Martin Baeuml <baeuml@gmail.com>
---
Compile tested on i386.
Diffed against Linus' git tree.

 drivers/video/matrox/matroxfb_maven.c |    6 +++---
 drivers/video/riva/riva_hw.c          |    3 ++-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/video/matrox/matroxfb_maven.c b/drivers/video/matrox/matroxfb_maven.c
index 5d29a26..907aef0 100644
--- a/drivers/video/matrox/matroxfb_maven.c
+++ b/drivers/video/matrox/matroxfb_maven.c
@@ -284,7 +284,7 @@ static unsigned int matroxfb_mavenclock(const struct matrox_pll_ctl* ctl,
 		unsigned int* in, unsigned int* feed, unsigned int* post,
 		unsigned int* htotal2) {
 	unsigned int fvco;
-	unsigned int p;
+	unsigned int p = 0;
 
 	fvco = matroxfb_PLL_mavenclock(&maven1000_pll, ctl, htotal, vtotal, in, feed, &p, htotal2);
 	if (!fvco)
@@ -305,7 +305,7 @@ static unsigned int matroxfb_mavenclock(const struct matrox_pll_ctl* ctl,
 static void DAC1064_calcclock(unsigned int freq, unsigned int fmax,
 		unsigned int* in, unsigned int* feed, unsigned int* post) {
 	unsigned int fvco;
-	unsigned int p;
+	unsigned int p = 0;
 
 	fvco = matroxfb_PLL_calcclock(&maven_pll, freq, fmax, in, feed, &p);
 	p = (1 << p) - 1;
@@ -715,7 +715,7 @@ static int maven_find_exact_clocks(unsigned int ht, unsigned int vt,
 	m->regs[0x82] = 0x81;
 
 	for (x = 0; x < 8; x++) {
-		unsigned int a, b, c, h2;
+		unsigned int a = 0, b = 0, c = 0, h2 = 0;
 		unsigned int h = ht + 2 + x;
 
 		if (!matroxfb_mavenclock((m->mode = MATROXFB_OUTPUT_MODE_PAL) ? &maven_PAL : &maven_NTSC, h, vt, &a, &b, &c, &h2)) {
diff --git a/drivers/video/riva/riva_hw.c b/drivers/video/riva/riva_hw.c
index 70bfd78..b1cbe25 100644
--- a/drivers/video/riva/riva_hw.c
+++ b/drivers/video/riva/riva_hw.c
@@ -1240,7 +1240,8 @@ int CalcStateExt
     int            dotClock
 )
 {
-    int pixelDepth, VClk, m, n, p;
+    int pixelDepth;
+    int VClk = 0, m = 0, n = 0, p = 0;
     /*
      * Save mode parameters.
      */
-- 
1.5.2

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
