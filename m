From: Colin King <colin.king@canonical.com>
Date: Wed, 01 Jul 2020 14:59:05 +0000
Subject: [PATCH] drm/amd/display: remove redundant initialization of variable result
Message-Id: <20200701145905.551367-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171215105343.11372-1-colin.king@canonical.com>
In-Reply-To: <20171215105343.11372-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable result is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
index 1b3474aa380d..d0a23b72e604 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
@@ -151,7 +151,8 @@ bool edp_receiver_ready_T9(struct dc_link *link)
 	unsigned int tries = 0;
 	unsigned char sinkstatus = 0;
 	unsigned char edpRev = 0;
-	enum dc_status result = DC_OK;
+	enum dc_status result;
+
 	result = core_link_read_dpcd(link, DP_EDP_DPCD_REV, &edpRev, sizeof(edpRev));
 
      /* start from eDP version 1.2, SINK_STAUS indicate the sink is ready.*/
@@ -177,7 +178,7 @@ bool edp_receiver_ready_T7(struct dc_link *link)
 {
 	unsigned char sinkstatus = 0;
 	unsigned char edpRev = 0;
-	enum dc_status result = DC_OK;
+	enum dc_status result;
 
 	/* use absolute time stamp to constrain max T7*/
 	unsigned long long enter_timestamp = 0;
-- 
2.27.0
