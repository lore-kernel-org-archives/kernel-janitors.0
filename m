From: Colin King <colin.king@canonical.com>
Date: Tue, 23 Jul 2019 14:23:12 +0000
Subject: [PATCH][next] drm/amd/display: fix a missing null check on a failed kzalloc
Message-Id: <20190723142312.4013-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the allocation of config may fail and a null pointer
dereference on config can occur.  Fix this by added a null
check on a failed allocation of config.

Addresses-Coverity: ("Dereference null return")
Fixes: c2cd9d04ecf0 ("drm/amd/display: Hook up calls to do stereo mux and dig programming to stereo control interface")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 168f4a7dffdf..7cce2baec2af 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -1259,6 +1259,8 @@ bool dc_set_generic_gpio_for_stereo(bool enable,
 	struct gpio_generic_mux_config *config = kzalloc(sizeof(struct gpio_generic_mux_config),
 			   GFP_KERNEL);
 
+	if (!config)
+		return false;
 	pin_info = dal_gpio_get_generic_pin_info(gpio_service, GPIO_ID_GENERIC, 0);
 
 	if (pin_info.mask = 0xFFFFFFFF || pin_info.offset = 0xFFFFFFFF) {
-- 
2.20.1
