From: Emil Goode <emilgoode@gmail.com>
Date: Fri, 26 Apr 2013 17:49:51 +0000
Subject: [PATCH] drm/tegra: Include header drm/drm.h
Message-Id: <1366998591-8508-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: airlied@linux.ie, swarren@wwwdotorg.org
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

Include definitions of used types by including drm/drm.h

Sparse output:
/usr/include/drm/tegra_drm.h:21:
	found __[us]{8,16,32,64} type without
	#include <linux/types.h>

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 include/uapi/drm/tegra_drm.h |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/drm/tegra_drm.h b/include/uapi/drm/tegra_drm.h
index 6e132a2..73bde4e 100644
--- a/include/uapi/drm/tegra_drm.h
+++ b/include/uapi/drm/tegra_drm.h
@@ -17,6 +17,8 @@
 #ifndef _UAPI_TEGRA_DRM_H_
 #define _UAPI_TEGRA_DRM_H_
 
+#include <drm/drm.h>
+
 struct drm_tegra_gem_create {
 	__u64 size;
 	__u32 flags;
-- 
1.7.10.4

