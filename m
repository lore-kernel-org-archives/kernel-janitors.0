From: Colin King <colin.king@canonical.com>
Date: Sun, 20 Sep 2020 14:14:07 +0000
Subject: [PATCH] drm/gma500: clean up indentation issues
Message-Id: <20200920141407.32672-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are a couple of statements that are indented too deeply,
remove the extraneous tabs and also an empty line.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/gma500/cdv_intel_dp.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index 720a767118c9..50016a754172 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -1501,8 +1501,7 @@ cdv_intel_dp_start_link_train(struct gma_encoder *encoder)
 	clock_recovery = false;
 
 	DRM_DEBUG_KMS("Start train\n");
-		reg = DP | DP_LINK_TRAIN_PAT_1;
-
+	reg = DP | DP_LINK_TRAIN_PAT_1;
 
 	for (;;) {
 		/* Use intel_dp->train_set[0] to set the voltage and pre emphasis values */
@@ -1575,7 +1574,7 @@ cdv_intel_dp_complete_link_train(struct gma_encoder *encoder)
 	cr_tries = 0;
 
 	DRM_DEBUG_KMS("\n");
-		reg = DP | DP_LINK_TRAIN_PAT_2;
+	reg = DP | DP_LINK_TRAIN_PAT_2;
 
 	for (;;) {
 
-- 
2.27.0
