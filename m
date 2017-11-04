From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 04 Nov 2017 06:12:32 +0000
Subject: [PATCH] drm/amd/display: indent an if statement
Message-Id: <20171104061232.5bq5hwr2p2ca2cl7@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, Harry Wentland <harry.wentland@amd.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Tony Cheng <tony.cheng@amd.com>, Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, Hersen Wu <hersenxs.wu@amd.com>, Yue Hin Lau <Yuehin.Lau@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

The if statement wasn't indented so it makes static analysis tools and
probably very recent GCC versions complain.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I went over 80 characters because other lines do already and it seemed
like the cleanest thing here.

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
index d911590d08bc..c83ac4d9ca3a 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
@@ -727,7 +727,7 @@ static void destruct(struct dcn10_resource_pool *pool)
 
 	for (i = 0; i < pool->base.stream_enc_count; i++) {
 		if (pool->base.stream_enc[i] != NULL)
-		kfree(DCE110STRENC_FROM_STRENC(pool->base.stream_enc[i]));
+			kfree(DCE110STRENC_FROM_STRENC(pool->base.stream_enc[i]));
 	}
 
 	for (i = 0; i < pool->base.audio_count; i++) {
