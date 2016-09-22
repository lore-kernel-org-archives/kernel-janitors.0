From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Sep 2016 06:22:29 +0000
Subject: [PATCH 3/4] GPU-DRM-QXL: Improve a size determination in qxl_driver_load()
Message-Id: <424ac093-cbe5-17f8-6e03-5e25d7e04269@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ce810580-cc2b-32cc-a852-a355374c2100@users.sourceforge.net>
In-Reply-To: <ce810580-cc2b-32cc-a852-a355374c2100@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, Bhaktipriya Shridhar <bhaktipriya96@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, Tejun Heo <tj@kernel.org>, Thierry Reding <treding@nvidia.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Sep 2016 22:48:34 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/qxl/qxl_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_kms.c
index 76780c2..f8f0261 100644
--- a/drivers/gpu/drm/qxl/qxl_kms.c
+++ b/drivers/gpu/drm/qxl/qxl_kms.c
@@ -306,7 +306,7 @@ int qxl_driver_load(struct drm_device *dev, unsigned long flags)
 	struct qxl_device *qdev;
 	int r;
 
-	qdev = kzalloc(sizeof(struct qxl_device), GFP_KERNEL);
+	qdev = kzalloc(sizeof(*qdev), GFP_KERNEL);
 	if (qdev = NULL)
 		return -ENOMEM;
 
-- 
2.10.0

