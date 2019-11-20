From: Colin King <colin.king@canonical.com>
Date: Wed, 20 Nov 2019 17:22:42 +0000
Subject: [PATCH][next] drm/amd/display: fix double assignment to msg_id field
Message-Id: <20191120172242.347072-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The msg_id field is being assigned twice. Fix this by replacing the second
assignment with an assignment to msg_size.

Addresses-Coverity: ("Unused value")
Fixes: 11a00965d261 ("drm/amd/display: Add PSP block to verify HDCP2.2 steps")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c
index 2dd5feec8e6c..6791c5844e43 100644
--- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c
+++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c
@@ -42,7 +42,7 @@ static void hdcp2_message_init(struct mod_hdcp *hdcp,
 	in->process.msg2_desc.msg_id = TA_HDCP_HDCP2_MSG_ID__NULL_MESSAGE;
 	in->process.msg2_desc.msg_size = 0;
 	in->process.msg3_desc.msg_id = TA_HDCP_HDCP2_MSG_ID__NULL_MESSAGE;
-	in->process.msg3_desc.msg_id = 0;
+	in->process.msg3_desc.msg_size = 0;
 }
 enum mod_hdcp_status mod_hdcp_remove_display_topology(struct mod_hdcp *hdcp)
 {
-- 
2.24.0
