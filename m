From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Jul 2013 06:22:55 +0000
Subject: [patch] drm/radeon/dpm: cleanup a type issue with rv6xx_clocks_per_unit()
Message-Id: <20130702062255.GB24410@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Alex Deucher <alexander.deucher@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

The rv6xx_clocks_per_unit() function pretends it can set flags in a u64
bitfield but really because "1" is an int it doesn't work for more than
32 bits.  The only caller truncates the high bits away anyway.  I've
just changed it to be a u32.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/radeon/rv6xx_dpm.c b/drivers/gpu/drm/radeon/rv6xx_dpm.c
index 0e8b7d9..a4b80f23 100644
--- a/drivers/gpu/drm/radeon/rv6xx_dpm.c
+++ b/drivers/gpu/drm/radeon/rv6xx_dpm.c
@@ -406,9 +406,9 @@ static void rv6xx_enable_engine_feedback_and_reference_sync(struct radeon_device
 	WREG32_P(SPLL_CNTL_MODE, SPLL_DIV_SYNC, ~SPLL_DIV_SYNC);
 }
 
-static u64 rv6xx_clocks_per_unit(u32 unit)
+static u32 rv6xx_clocks_per_unit(u32 unit)
 {
-	u64 tmp = 1 << (2 * unit);
+	u32 tmp = 1 << (2 * unit);
 
 	return tmp;
 }
@@ -416,7 +416,7 @@ static u64 rv6xx_clocks_per_unit(u32 unit)
 static u32 rv6xx_scale_count_given_unit(struct radeon_device *rdev,
 					u32 unscaled_count, u32 unit)
 {
-	u32 count_per_unit = (u32)rv6xx_clocks_per_unit(unit);
+	u32 count_per_unit = rv6xx_clocks_per_unit(unit);
 
 	return (unscaled_count + count_per_unit - 1) / count_per_unit;
 }
