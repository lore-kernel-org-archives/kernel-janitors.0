From: Emil Goode <emilgoode@gmail.com>
Date: Thu, 10 May 2012 14:53:20 +0000
Subject: [PATCH] drm/exynos: Include missing linux/types.h in header
Message-Id: <1336661600-2409-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

Include the linux/types.h file where used types are declared.

Sparse gives the following warning:
/usr/include/drm/exynos_drm.h:92:
	found __[us]{8,16,32,64} type without
	#include <linux/types.h>

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 include/drm/exynos_drm.h |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/exynos_drm.h b/include/drm/exynos_drm.h
index e478de4..7eb7ae7 100644
--- a/include/drm/exynos_drm.h
+++ b/include/drm/exynos_drm.h
@@ -29,6 +29,8 @@
 #ifndef _EXYNOS_DRM_H_
 #define _EXYNOS_DRM_H_
 
+#include <linux/types.h>
+
 /**
  * User-desired buffer creation information structure.
  *
-- 
1.7.10

