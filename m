From: Hannes Eder <hannes@hanneseder.net>
Date: Thu, 18 Dec 2008 20:24:18 +0000
Subject: [PATCH 4/6] drm/i915: fix sparse warnings: returning void-valued expression
Message-Id: <494ad5dd.0e0f660a.2937.ffff82d3@mx.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.sourceforge.net

Fix this sparse warnings:

  drivers/gpu/drm/i915/intel_display.c:216:3: warning: returning void-valued expression
  drivers/gpu/drm/i915/intel_display.c:218:3: warning: returning void-valued expression

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/gpu/drm/i915/intel_display.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_display.c b/drivers/gpu/drm/i915/intel_display.c
index 9094119..035be19 100644
--- a/drivers/gpu/drm/i915/intel_display.c
+++ b/drivers/gpu/drm/i915/intel_display.c
@@ -213,10 +213,9 @@ static void intel_clock(struct drm_device *dev, int refclk,
 			intel_clock_t *clock)
 {
 	if (IS_I9XX(dev))
-		return i9xx_clock (refclk, clock);
+		i9xx_clock(refclk, clock);
 	else
-		return i8xx_clock (refclk, clock);
+		i8xx_clock(refclk, clock);
 }
 
 /**
-- 
1.5.6.3

