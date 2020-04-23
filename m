From: Colin King <colin.king@canonical.com>
Date: Thu, 23 Apr 2020 14:17:28 +0000
Subject: [PATCH][next] drm/amd/display: remove redundant assignment to variable ret
Message-Id: <20200423141728.19949-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190530161219.2507-1-colin.king@canonical.com>
In-Reply-To: <20190530161219.2507-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Wenjing Liu <wenjing.liu@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being initialized with a value that is never read
and it is being updated later with a new value. The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index d5b306384d79..9ef9e50a34fa 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -4231,7 +4231,7 @@ void dpcd_set_source_specific_data(struct dc_link *link)
 {
 	const uint32_t post_oui_delay = 30; // 30ms
 	uint8_t dspc = 0;
-	enum dc_status ret = DC_ERROR_UNEXPECTED;
+	enum dc_status ret;
 
 	ret = core_link_read_dpcd(link, DP_DOWN_STREAM_PORT_COUNT, &dspc,
 				  sizeof(dspc));
-- 
2.25.1
