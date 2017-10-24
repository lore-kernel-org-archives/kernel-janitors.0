From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Oct 2017 08:48:12 +0000
Subject: [PATCH 0/3] GPU-DRM-Exynos: Fine-tuning for six function implementations
Message-Id: <7d4cdb43-432c-c67a-5d3f-c37bd604f539@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, David Airlie <airlied@linux.ie>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Oct 2017 10:34:56 +0200

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Use common error handling code in exynos_dsi_enable()
  Use common error handling code in exynos_drm_gem_init()
  Fix typos in five comment lines

 drivers/gpu/drm/exynos/exynos_drm_dsi.c  | 12 +++++++-----
 drivers/gpu/drm/exynos/exynos_drm_fimc.c |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_g2d.c  |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_gem.c  | 16 +++++++++-------
 drivers/gpu/drm/exynos/exynos_drm_ipp.c  |  2 +-
 6 files changed, 20 insertions(+), 16 deletions(-)

-- 
2.14.2

