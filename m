From: Colin King <colin.king@canonical.com>
Date: Sat, 22 Dec 2018 11:49:51 +0000
Subject: [PATCH][next] media: staging: intel-ipu3: fix unsigned comparison with < 0
Message-Id: <20181222114951.31503-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The comparison css->pipes[pipe].bindex < 0 is always false because
bindex is an unsigned int.  Fix this by using a signed integer for
the comparison.

Detected by CoverityScan, CID#1476023 ("Unsigned compared against 0")

Fixes: f5f2e4273518 ("media: staging/intel-ipu3: Add css pipeline programming")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/media/ipu3/ipu3-css.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
index 44c55639389a..b9354d2bb692 100644
--- a/drivers/staging/media/ipu3/ipu3-css.c
+++ b/drivers/staging/media/ipu3/ipu3-css.c
@@ -1751,7 +1751,7 @@ int ipu3_css_fmt_try(struct ipu3_css *css,
 					&q[IPU3_CSS_QUEUE_OUT].fmt.mpix;
 	struct v4l2_pix_format_mplane *const vf  					&q[IPU3_CSS_QUEUE_VF].fmt.mpix;
-	int i, s;
+	int i, s, ret;
 
 	/* Adjust all formats, get statistics buffer sizes and formats */
 	for (i = 0; i < IPU3_CSS_QUEUES; i++) {
@@ -1826,12 +1826,12 @@ int ipu3_css_fmt_try(struct ipu3_css *css,
 	s = (bds->height - gdc->height) / 2 - FILTER_SIZE;
 	env->height = s < MIN_ENVELOPE ? MIN_ENVELOPE : s;
 
-	css->pipes[pipe].bindex -		ipu3_css_find_binary(css, pipe, q, r);
-	if (css->pipes[pipe].bindex < 0) {
+	ret = ipu3_css_find_binary(css, pipe, q, r);
+	if (ret < 0) {
 		dev_err(css->dev, "failed to find suitable binary\n");
 		return -EINVAL;
 	}
+	css->pipes[pipe].bindex = ret;
 
 	dev_dbg(css->dev, "Binary index %d for pipe %d found.",
 		css->pipes[pipe].bindex, pipe);
-- 
2.19.1
