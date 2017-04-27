From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 27 Apr 2017 19:45:17 +0000
Subject: [PATCH 0/2] hwtracing-coresight: Fine-tuning for two function implementations
Message-Id: <52619d05-65c4-149d-f355-cf9c037a0c9b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 27 Apr 2017 21:34:32 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use devm_kcalloc() in stm_probe()
  Use devm_kcalloc() in of_coresight_alloc_memory()

 drivers/hwtracing/coresight/coresight-stm.c | 6 +++---
 drivers/hwtracing/coresight/of_coresight.c  | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.12.2

