From: Julia Lawall <julia@diku.dk>
Date: Sat, 17 Oct 2009 06:41:26 +0000
Subject: [PATCH 9/14] drivers/video: Move dereference after NULL test
Message-Id: <Pine.LNX.4.64.0910170840540.9213@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

If the NULL test on fbi is needed, then the dereference should be after the
NULL test.

A simplified version of the semantic match that detects this problem is as
follows (http://coccinelle.lip6.fr/):

// <smpl>
@match exists@
expression x, E;
identifier fld;
@@

* x->fld
  ... when != \(x = E\|&x\)
* x = NULL
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/video/pxafb.c               |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/video/pxafb.c b/drivers/video/pxafb.c
index 1820c4a..fe3172c 100644
--- a/drivers/video/pxafb.c
+++ b/drivers/video/pxafb.c
@@ -1208,13 +1208,14 @@ static void setup_smart_timing(struct pxafb_info *fbi,
 static int pxafb_smart_thread(void *arg)
 {
 	struct pxafb_info *fbi = arg;
-	struct pxafb_mach_info *inf = fbi->dev->platform_data;
+	struct pxafb_mach_info *inf;
 
-	if (!fbi || !inf->smart_update) {
+	if (!fbi || !fbi->dev->platform_data->smart_update) {
 		pr_err("%s: not properly initialized, thread terminated\n",
 				__func__);
 		return -EINVAL;
 	}
+	inf = fbi->dev->platform_data;
 
 	pr_debug("%s(): task starting\n", __func__);
 
