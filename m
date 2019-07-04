From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 04 Jul 2019 10:45:34 +0000
Subject: [PATCH -next] drm/i915: fix possible memory leak in intel_hdcp_auth_downstream()
Message-Id: <20190704104534.12508-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

'ksv_fifo' is malloced in intel_hdcp_auth_downstream() and should be
freed before leaving from the error handling cases, otherwise it will
cause memory leak.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index bc3a94d491c4..27bd7276a82d 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -536,7 +536,8 @@ int intel_hdcp_auth_downstream(struct intel_connector *connector)
 
 	if (drm_hdcp_check_ksvs_revoked(dev, ksv_fifo, num_downstream)) {
 		DRM_ERROR("Revoked Ksv(s) in ksv_fifo\n");
-		return -EPERM;
+		ret = -EPERM;
+		goto err;
 	}
 
 	/*
