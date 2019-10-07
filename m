From: Colin King <colin.king@canonical.com>
Date: Mon, 07 Oct 2019 15:41:51 +0000
Subject: [PATCH] drm/i915: make array hw_engine_mask static, makes object smaller
Message-Id: <20191007154151.23245-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array hw_engine_mask on the stack but instead make it
static. Makes the object code smaller by 316 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  34004	   4388	    320	  38712	   9738	gpu/drm/i915/gt/intel_reset.o

After:
   text	   data	    bss	    dec	    hex	filename
  33528	   4548	    320	  38396	   95fc	gpu/drm/i915/gt/intel_reset.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/gt/intel_reset.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index eeb3bd0c4d69..db58ca9bee3a 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -285,7 +285,7 @@ static int gen6_reset_engines(struct intel_gt *gt,
 			      unsigned int retry)
 {
 	struct intel_engine_cs *engine;
-	const u32 hw_engine_mask[] = {
+	static const u32 hw_engine_mask[] = {
 		[RCS0]  = GEN6_GRDOM_RENDER,
 		[BCS0]  = GEN6_GRDOM_BLT,
 		[VCS0]  = GEN6_GRDOM_MEDIA,
@@ -408,7 +408,7 @@ static int gen11_reset_engines(struct intel_gt *gt,
 			       intel_engine_mask_t engine_mask,
 			       unsigned int retry)
 {
-	const u32 hw_engine_mask[] = {
+	static const u32 hw_engine_mask[] = {
 		[RCS0]  = GEN11_GRDOM_RENDER,
 		[BCS0]  = GEN11_GRDOM_BLT,
 		[VCS0]  = GEN11_GRDOM_MEDIA,
-- 
2.20.1
