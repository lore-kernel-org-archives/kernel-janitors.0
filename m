From: Colin King <colin.king@canonical.com>
Date: Sat, 11 May 2019 12:31:54 +0000
Subject: [PATCH] drm/amd/display: remove redundant assignment to variable actual_clock
Message-Id: <20190511123154.2708-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171215105343.11372-1-colin.king@canonical.com>
In-Reply-To: <20171215105343.11372-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable actual_clock is being initialized however this is never
read and later it is being reassigned to a new value. The initialization
is redundant and hence can be removed.

Addresses-Coverity: ("Unused Value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/display/dc/dce/dce_clk_mgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/dce/dce_clk_mgr.c
index 6b2e207777f0..fdd973c03dca 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_clk_mgr.c
@@ -344,7 +344,7 @@ int dce112_set_dispclk(struct clk_mgr *clk_mgr, int requested_clk_khz)
 	struct dc_bios *bp = clk_mgr->ctx->dc_bios;
 	struct dc *core_dc = clk_mgr->ctx->dc;
 	struct dmcu *dmcu = core_dc->res_pool->dmcu;
-	int actual_clock = requested_clk_khz;
+	int actual_clock;
 	/* Prepare to program display clock*/
 	memset(&dce_clk_params, 0, sizeof(dce_clk_params));
 
-- 
2.20.1
