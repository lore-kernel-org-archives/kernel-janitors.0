From: Darren Jenkins <darrenrjenkins@gmail.com>
Date: Wed, 30 Dec 2009 01:21:52 +0000
Subject: [PATCH] drm/radeon: fix a couple of array index errors
Message-Id: <1262136112.8733.29.camel@ICE-BOX>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, dri-devel mailing list <dri-devel@lists.sourceforge.net>, Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

There are a couple of array overruns, and some associated confusion in
the code. 
This is just a wild guess at what the code should actually look like.

Coverity CID: 13305 13306


Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

diff --git drivers/gpu/drm/radeon/radeon_legacy_tv.c drivers/gpu/drm/radeon/radeon_legacy_tv.c
index 3a12bb0..c37535a 100644
--- drivers/gpu/drm/radeon/radeon_legacy_tv.c
+++ drivers/gpu/drm/radeon/radeon_legacy_tv.c
@@ -112,6 +112,8 @@ static const uint16_t vert_timing_NTSC[] = {
 	0x1817,
 	0x21d4,
 	0x0002,
+	0x0000,
+	0x0000,
 	0
 };
 
@@ -623,9 +625,9 @@ void radeon_legacy_tv_mode_set(struct drm_encoder *encoder,
 	}
 	flicker_removal = (tmp + 500) / 1000;
 
-	if (flicker_removal < 3)
-		flicker_removal = 3;
-	for (i = 0; i < 6; ++i) {
+	if (flicker_removal < 2)
+		flicker_removal = 2;
+	for (i = 0; i < ARRAY_SIZE(SLOPE_limit); ++i) {
 		if (flicker_removal = SLOPE_limit[i])
 			break;
 	}
diff --git drivers/gpu/drm/radeon/radeon_mode.h drivers/gpu/drm/radeon/radeon_mode.h
index 402369d..abee9a9 100644
--- drivers/gpu/drm/radeon/radeon_mode.h
+++ drivers/gpu/drm/radeon/radeon_mode.h
@@ -218,8 +218,8 @@ struct radeon_mode_info {
 
 };
 
-#define MAX_H_CODE_TIMING_LEN 32
-#define MAX_V_CODE_TIMING_LEN 32
+#define MAX_H_CODE_TIMING_LEN 16
+#define MAX_V_CODE_TIMING_LEN 16
 
 /* need to store these as reading
    back code tables is excessive */


