From: Martin Baeuml <baeuml@gmail.com>
Date: Tue, 29 May 2007 11:05:31 +0000
Subject: Re: [KJ] [PATCH] drivers/video: fix compiler warnings
Message-Id: <20070529110531.GA2125@sisko.site>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070528222828.GA25955@sisko.site>
In-Reply-To: <20070528222828.GA25955@sisko.site>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, May 29, 2007 at 12:24:24PM +0200, Richard Knutsson wrote:
> Martin Baeuml wrote:
> >On Tue, May 29, 2007 at 01:11:31AM +0200, Richard Knutsson wrote:
> >  
> >>matroxfb_PLL_mavenclock() will initialize this variable (have not 
> >>checked the rest).
> >>    
> >
> >The rest will be initialized, too. This patch was only supposed to
> >remove the warnings.
> >
> >  
> >>When the compiler warns about "may be used 
> >>uninitialized", it is code for "I have no clue what is happening". So 
> >>most of them is alright and we need to check them by hand. There has 
> >>been some attempt to fix this (the problem is, initialize them when it 
> >>is not needed is just cruft) by some macros and such...
> >>    
> >
> >Is there a preferred way of removing such warnings then?  I'd say it's
> >ok to let the compiler generate one or two more instructions to
> >remove the warning unless in very critical paths...  Nobody should ever be
> >able to measure this as a performance penalty.
> >  
> Well, it is preferred to fix it where it is doing "wrong", in this case 
> it is the compiler. Unfortunately this does not seem to be solved 
> soon... Also, initializing the variable with a bogus value may hide bugs 
> introduced later on.
> Some quick searches in a lkml-archive should reveal some of the approaches.

Thanks for the pointer.  The macro uninitialized_var() has only recently been added 
for this matter ( http://marc.info/?l=linux-kernel&m7783880325621&w=2 ).  The adjusted patch is below.

Thank you for your comments.

Martin


Fix some compiler warnings:
warning: '*' may be used uninitialized in this function

Signed-off-by: Martin Baeuml <baeuml@gmail.com>
---
 drivers/video/matrox/matroxfb_maven.c |    6 +++---
 drivers/video/riva/riva_hw.c          |    3 ++-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/video/matrox/matroxfb_maven.c b/drivers/video/matrox/matroxfb_maven.c
index 5d29a26..dd55f98 100644
--- a/drivers/video/matrox/matroxfb_maven.c
+++ b/drivers/video/matrox/matroxfb_maven.c
@@ -284,7 +284,7 @@ static unsigned int matroxfb_mavenclock(const struct matrox_pll_ctl* ctl,
 		unsigned int* in, unsigned int* feed, unsigned int* post,
 		unsigned int* htotal2) {
 	unsigned int fvco;
-	unsigned int p;
+	unsigned int uninitialized_var(p);
 
 	fvco = matroxfb_PLL_mavenclock(&maven1000_pll, ctl, htotal, vtotal, in, feed, &p, htotal2);
 	if (!fvco)
@@ -305,7 +305,7 @@ static unsigned int matroxfb_mavenclock(const struct matrox_pll_ctl* ctl,
 static void DAC1064_calcclock(unsigned int freq, unsigned int fmax,
 		unsigned int* in, unsigned int* feed, unsigned int* post) {
 	unsigned int fvco;
-	unsigned int p;
+	unsigned int uninitialized_var(p);
 
 	fvco = matroxfb_PLL_calcclock(&maven_pll, freq, fmax, in, feed, &p);
 	p = (1 << p) - 1;
@@ -715,7 +715,7 @@ static int maven_find_exact_clocks(unsigned int ht, unsigned int vt,
 	m->regs[0x82] = 0x81;
 
 	for (x = 0; x < 8; x++) {
-		unsigned int a, b, c, h2;
+		unsigned int uninitialized_var(a), uninitialized_var(b), uninitialized_var(c), uninitialized_var(h2);
 		unsigned int h = ht + 2 + x;
 
 		if (!matroxfb_mavenclock((m->mode = MATROXFB_OUTPUT_MODE_PAL) ? &maven_PAL : &maven_NTSC, h, vt, &a, &b, &c, &h2)) {
diff --git a/drivers/video/riva/riva_hw.c b/drivers/video/riva/riva_hw.c
index 70bfd78..b18e654 100644
--- a/drivers/video/riva/riva_hw.c
+++ b/drivers/video/riva/riva_hw.c
@@ -1240,7 +1240,8 @@ int CalcStateExt
     int            dotClock
 )
 {
-    int pixelDepth, VClk, m, n, p;
+    int pixelDepth;
+    int uninitialized_var(VClk), uninitialized_var(m), uninitialized_var(n), uninitialized_var(p);
     /*
      * Save mode parameters.
      */
-- 
1.5.2

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
