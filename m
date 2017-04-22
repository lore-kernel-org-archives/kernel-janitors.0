From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 22 Apr 2017 21:23:03 +0000
Subject: [PATCH 0/2] dmaengine: s3c24xx: Fine-tuning for s3c24xx_dma_probe()
Message-Id: <930f0a6c-bc5c-3d01-6814-563780fc90ef@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 22 Apr 2017 23:14:32 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use devm_kcalloc() in s3c24xx_dma_probe()
  Fix a typo in a comment line

 drivers/dma/s3c24xx-dma.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
2.12.2

