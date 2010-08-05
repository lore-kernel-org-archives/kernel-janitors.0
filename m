From: Julia Lawall <julia@diku.dk>
Date: Thu, 05 Aug 2010 20:21:02 +0000
Subject: [PATCH 14/42] drivers/video/aty/mach64_ct.c: Adjust confusing if
Message-Id: <Pine.LNX.4.64.1008052220440.31692@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Indent the branch of an if.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r disable braces4@
position p1,p2;
statement S1,S2;
@@

(
if (...) { ... }
|
if (...) S1@p1 S2@p2
)

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

if (p1[0].column = p2[0].column):
  cocci.print_main("branch",p1)
  cocci.print_secs("after",p2)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/video/aty/mach64_ct.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/aty/mach64_ct.c b/drivers/video/aty/mach64_ct.c
index 2745b85..204b580 100644
--- a/drivers/video/aty/mach64_ct.c
+++ b/drivers/video/aty/mach64_ct.c
@@ -179,7 +179,7 @@ static int aty_dsp_gt(const struct fb_info *info, u32 bpp, struct pll_ct *pll)
 		dsp_on = ((multiplier << vshift) + divider) / divider;
 		tmp = ((ras_multiplier << xshift) + ras_divider) / ras_divider;
 		if (dsp_on < tmp)
-		dsp_on = tmp;
+			dsp_on = tmp;
 		dsp_on = dsp_on + (tmp * 2) + (pll->xclkpagefaultdelay << xshift);
 	}
 
