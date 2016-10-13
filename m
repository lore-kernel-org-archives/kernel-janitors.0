From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Oct 2016 10:20:40 +0000
Subject: [patch] drm/exynos: fix a timeout loop
Message-Id: <20161013102040.GA5576@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Inki Dae <inki.dae@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org

We were trying to print an error message if we timed out here, but the
loop actually ends with "tries" set to UINT_MAX and not zero.  Fix this
by changing from tries-- to --tries.

A for loop would actually be the most natural way to do this.  My fix
means we only loop 99 times instead of 100 but that's probably ok.

Fixes: a696394c5224 ('drm/exynos: mixer: simplify loop in vp_win_reset()')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index edb20a3..fcc7e4f 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -701,7 +701,7 @@ static void vp_win_reset(struct mixer_context *ctx)
 	unsigned int tries = 100;
 
 	vp_reg_write(res, VP_SRESET, VP_SRESET_PROCESSING);
-	while (tries--) {
+	while (--tries) {
 		/* waiting until VP_SRESET_PROCESSING is 0 */
 		if (~vp_reg_read(res, VP_SRESET) & VP_SRESET_PROCESSING)
 			break;
