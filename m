From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Date: Thu, 19 Apr 2018 14:05:46 +0000
Subject: [PATCH 16/61] gpu: drm: vc4: simplify getting .drvdata
Message-Id: <20180419140641.27926-17-wsa+renesas@sang-engineering.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org

We should get drvdata from struct device directly. Going via
platform_device is an unneeded step back and forth.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only. buildbot is happy. Please apply individually.

 drivers/gpu/drm/vc4/vc4_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 94b99c90425a..af9515ae0e0a 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -318,8 +318,7 @@ static int vc4_drm_bind(struct device *dev)
 
 static void vc4_drm_unbind(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct drm_device *drm = platform_get_drvdata(pdev);
+	struct drm_device *drm = dev_get_drvdata(dev);
 
 	drm_dev_unregister(drm);
 
-- 
2.11.0

