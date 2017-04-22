From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 22 Apr 2017 20:30:14 +0000
Subject: [PATCH 0/2] dmaengine: zx: Fine-tuning for two function implementations
Message-Id: <85b8d46d-1643-0fdd-b295-9359ebca6444@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Shawn Guo <shawn.guo@linaro.org>, Vinod Koul <vinod.koul@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 22 Apr 2017 22:23:45 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use devm_kcalloc() in zx_dma_probe()
  Fix a typo in a comment line

 drivers/dma/zx_dma.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
2.12.2

