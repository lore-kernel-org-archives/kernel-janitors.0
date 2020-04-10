From: Colin King <colin.king@canonical.com>
Date: Fri, 10 Apr 2020 11:46:13 +0000
Subject: [PATCH] drm/amd/display: remove redundant assignment to variable dp_ref_clk_khz
Message-Id: <20200410114613.15271-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171215105343.11372-1-colin.king@canonical.com>
In-Reply-To: <20171215105343.11372-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Eric Yang <Eric.Yang2@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable dp_ref_clk_khz is being initialized with a value that is
never read and it is being updated later with a new value.  The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
index 26db1c5d4e4d..b210f8e9d592 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
@@ -131,7 +131,7 @@ int dce_get_dp_ref_freq_khz(struct clk_mgr *clk_mgr_base)
 	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
 	int dprefclk_wdivider;
 	int dprefclk_src_sel;
-	int dp_ref_clk_khz = 600000;
+	int dp_ref_clk_khz;
 	int target_div;
 
 	/* ASSERT DP Reference Clock source is from DFS*/
-- 
2.25.1
