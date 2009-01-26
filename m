From: Daniele Venzano <venza@brownhat.org>
Date: Mon, 26 Jan 2009 14:15:55 +0000
Subject: [PATCH] Fix compile warning in aty128fb
Message-Id: <20090126141555.30784.22229.stgit@renditai.milesteg.arr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch fixes a warning generated when ati128fb is compiled without
CONFIG_PMAC_BACKLIGHT. Patch is against latest linux-next.

Signed-off-by: Daniele Venzano <venza@brownhat.org>
---

 drivers/video/aty/aty128fb.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/video/aty/aty128fb.c b/drivers/video/aty/aty128fb.c
index db16112..1d5b55c 100644
--- a/drivers/video/aty/aty128fb.c
+++ b/drivers/video/aty/aty128fb.c
@@ -360,8 +360,10 @@ static int mtrr = 1;
 #ifdef CONFIG_PMAC_BACKLIGHT
 static int backlight __devinitdata = 1;
 #else
+#if !defined(MODULE) || defined(CONFIG_FB_ATY128_BACKLIGHT)
 static int backlight __devinitdata = 0;
 #endif
+#endif
 
 /* PLL constants */
 struct aty128_constants {

