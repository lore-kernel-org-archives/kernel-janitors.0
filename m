From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 28 Mar 2018 12:52:10 +0000
Subject: [PATCH -next] drm/tegra: dc: Using NULL instead of plain integer
Message-Id: <1522241530-77833-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, dri-devel@lists.freedesktop.org

Fixes the following sparse warnings:

drivers/gpu/drm/tegra/dc.c:2181:69: warning:
  Using plain integer as NULL pointer

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpu/drm/tegra/dc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 616c963..910125c 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2178,7 +2178,7 @@ static int tegra_dc_couple(struct tegra_dc *dc)
 		struct device_link *link;
 		struct device *partner;
 
-		partner = driver_find_device(dc->dev->driver, NULL, 0,
+		partner = driver_find_device(dc->dev->driver, NULL, NULL,
 					     tegra_dc_match_by_pipe);
 		if (!partner)
 			return -EPROBE_DEFER;

