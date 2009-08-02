From: Joe Perches <joe@perches.com>
Date: Sun, 02 Aug 2009 01:07:16 +0000
Subject: [PATCH v2 1/2] treewide: Use roundup
Message-Id: <1249175236.22466.112.camel@Joe-Laptop.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0908012148100.25693@ask.diku.dk>
	 <1249170191.22466.14.camel@Joe-Laptop.home>
	 <1249171857.6114.5.camel@desktop>
In-Reply-To: <1249171857.6114.5.camel@desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Walker <dwalker@fifo99.com>
Cc: Julia Lawall <julia@diku.dk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 2009-08-01 at 17:10 -0700, Daniel Walker wrote:
> On Sat, 2009-08-01 at 16:43 -0700, Joe Perches wrote:
> > On Sat, 2009-08-01 at 21:48 +0200, Julia Lawall wrote:
> > > The kernel.h macro DIV_ROUND_CLOSEST performs the computation (x + d/2)/d
> > > but is perhaps more readable.
> > Similarly, DIV_ROUND_UP does ((n + d - 1) / d)
> > Signed-off-by: Joe Perches <joe@perches.com>
> > -	mem_size = ((mem_size + pad - 1) / pad) * pad;
> > +	mem_size = DIV_ROUND_UP(mem_size, pad) * pad;
> Doesn't this look more like,
> #define roundup(x, y) ((((x) + ((y) - 1)) / (y)) * (y))

Yes.  Also, the first patch should not be applied because
it converts arch/alpha/boot/tools/objstrip.c which does
not include kernel.h.

Here's another pass at it.

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/media/video/cx2341x.c      |    4 ++--
 drivers/mtd/tests/mtd_stresstest.c |    2 +-
 sound/pci/hda/hda_intel.c          |    3 +--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/video/cx2341x.c b/drivers/media/video/cx2341x.c
index 4c8e958..3d40191 100644
--- a/drivers/media/video/cx2341x.c
+++ b/drivers/media/video/cx2341x.c
@@ -304,7 +304,7 @@ static int cx2341x_set_ctrl(struct cx2341x_mpeg_params *params, int busy,
 		int b = ctrl->value + 1;
 		int gop = params->video_gop_size;
 		params->video_b_frames = ctrl->value;
-		params->video_gop_size = b * ((gop + b - 1) / b);
+		params->video_gop_size = roundup(gop, b);
 		/* Max GOP size = 34 */
 		while (params->video_gop_size > 34)
 			params->video_gop_size -= b;
@@ -313,7 +313,7 @@ static int cx2341x_set_ctrl(struct cx2341x_mpeg_params *params, int busy,
 	case V4L2_CID_MPEG_VIDEO_GOP_SIZE: {
 		int b = params->video_b_frames + 1;
 		int gop = ctrl->value;
-		params->video_gop_size = b * ((gop + b - 1) / b);
+		params->video_gop_size = roundup(gop, b);
 		/* Max GOP size = 34 */
 		while (params->video_gop_size > 34)
 			params->video_gop_size -= b;
diff --git a/drivers/mtd/tests/mtd_stresstest.c b/drivers/mtd/tests/mtd_stresstest.c
index 6392047..f146c81 100644
--- a/drivers/mtd/tests/mtd_stresstest.c
+++ b/drivers/mtd/tests/mtd_stresstest.c
@@ -179,7 +179,7 @@ static int do_write(void)
 		offs = offsets[eb] = 0;
 	}
 	len = rand_len(offs);
-	len = ((len + pgsize - 1) / pgsize) * pgsize;
+	len = roundup(len, pgsize);
 	if (offs + len > mtd->erasesize) {
 		if (bbt[eb + 1])
 			len = mtd->erasesize - offs;
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 77c1b84..1f015b0 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1128,8 +1128,7 @@ static int azx_setup_periods(struct azx *chip,
 		if (!pos_adj)
 			pos_adj = pos_align;
 		else
-			pos_adj = ((pos_adj + pos_align - 1) / pos_align) *
-				pos_align;
+			pos_adj = roundup(pos_adj, pos_align);
 		pos_adj = frames_to_bytes(runtime, pos_adj);
 		if (pos_adj >= period_bytes) {
 			snd_printk(KERN_WARNING SFX "Too big adjustment %d\n",



