From: Colin King <colin.king@canonical.com>
Date: Fri, 21 Jun 2019 22:35:34 +0000
Subject: [PATCH] drm/vmwgfx: fix memory leak when too many retries have occurred
Message-Id: <20190621223534.14283-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: VMware Graphics <linux-graphics-maintainer@vmware.com>, Thomas Hellstrom <thellstrom@vmware.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently when too many retries have occurred there is a memory
leak on the allocation for reply on the error return path. Fix
this by kfree'ing reply before returning.

Addresses-Coverity: ("Resource leak")
Fixes: a9cd9c044aa9 ("drm/vmwgfx: Add a check to handle host message failure")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
index 8b9270f31409..8b61f16f50cf 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
@@ -301,8 +301,10 @@ static int vmw_recv_msg(struct rpc_channel *channel, void **msg,
 		break;
 	}
 
-	if (retries = RETRIES)
+	if (retries = RETRIES) {
+		kfree(reply);
 		return -EINVAL;
+	}
 
 	*msg_len = reply_len;
 	*msg     = reply;
-- 
2.20.1
