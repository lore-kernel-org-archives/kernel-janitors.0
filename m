From: Colin King <colin.king@canonical.com>
Date: Mon, 13 Jan 2020 14:05:34 +0000
Subject: [PATCH][next] drm/gma500: clean up two indentation issues
Message-Id: <20200113140534.209440-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are a couple of statements that are indented too deeply,
clean these up by removing the extraneous tabs. Also remove an
empty line.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/gma500/cdv_intel_dp.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index 5772b2dce0d6..b5360bd405c5 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -1529,8 +1529,7 @@ cdv_intel_dp_start_link_train(struct gma_encoder *encoder)
 	clock_recovery = false;
 
 	DRM_DEBUG_KMS("Start train\n");
-		reg = DP | DP_LINK_TRAIN_PAT_1;
-
+	reg = DP | DP_LINK_TRAIN_PAT_1;
 
 	for (;;) {
 		/* Use intel_dp->train_set[0] to set the voltage and pre emphasis values */
@@ -1603,7 +1602,7 @@ cdv_intel_dp_complete_link_train(struct gma_encoder *encoder)
 	cr_tries = 0;
 
 	DRM_DEBUG_KMS("\n");
-		reg = DP | DP_LINK_TRAIN_PAT_2;
+	reg = DP | DP_LINK_TRAIN_PAT_2;
 
 	for (;;) {
 
-- 
2.24.0
