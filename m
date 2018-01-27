From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 27 Jan 2018 14:28:15 +0000
Subject: [PATCH] drm/radeon: adjust tested variable
Message-Id: <1517063295-16648-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>

Check the variable that was most recently initialized.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x, y, f, g, e, m;
statement S1,S2,S3,S4;
@@

x = f(...);
if (\(<+...x...+>\&e\)) S1 else S2
(
x = g(...);
|
m = g(...,&x,...);
|
y = g(...);
*if (e)
 S3 else S4
)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/gpu/drm/radeon/radeon_uvd.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon/radeon_uvd.c
index d34d1cf..95f4db7 100644
--- a/drivers/gpu/drm/radeon/radeon_uvd.c
+++ b/drivers/gpu/drm/radeon/radeon_uvd.c
@@ -995,7 +995,7 @@ int radeon_uvd_calc_upll_dividers(struct radeon_device *rdev,
 		/* calc dclk divider with current vco freq */
 		dclk_div = radeon_uvd_calc_upll_post_div(vco_freq, dclk,
 							 pd_min, pd_even);
-		if (vclk_div > pd_max)
+		if (dclk_div > pd_max)
 			break; /* vco is too big, it has to stop */
 
 		/* calc score with current vco freq */

