From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 23 Apr 2017 09:06:17 +0000
Subject: [PATCH 0/2] dmaengine: k3dma: Fine-tuning for five function implementations
Message-Id: <f83beedc-28fd-c373-cca8-7261e42577a5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vinod.koul@intel.com>, Zhangfei Gao <zhangfei.gao@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 23 Apr 2017 10:56:54 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use devm_kcalloc() in k3_dma_probe()
  Adjust six checks for null pointers

 drivers/dma/k3dma.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

-- 
2.12.2

