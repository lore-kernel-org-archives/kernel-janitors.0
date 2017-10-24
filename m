From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Oct 2017 17:33:15 +0000
Subject: [PATCH 0/2] GPU-DRM-Tegra: Fine-tuning for tegra_output_probe()
Message-Id: <bfac49e0-8948-e62f-1876-567605f1e2c8@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, David Airlie <airlied@linux.ie>, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Oct 2017 19:29:39 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use common error handling code
  Use an error code directly

 drivers/gpu/drm/tegra/output.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

-- 
2.14.3

