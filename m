From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 13 Dec 2017 17:32:28 +0000
Subject: [PATCH 0/3] SoC/FSL/QE: Adjustments for three function implementations
Message-Id: <07738369-a787-98b4-41a5-71b7d630c356@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 13 Dec 2017 18:28:38 +0100

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an error message for a failed memory allocation in three functions
  Improve a size determination in two functions
  Use common error handling code in ucc_fast_init()

 drivers/soc/fsl/qe/gpio.c     |  4 +---
 drivers/soc/fsl/qe/ucc_fast.c | 39 ++++++++++++++++++---------------------
 drivers/soc/fsl/qe/ucc_slow.c |  7 ++-----
 3 files changed, 21 insertions(+), 29 deletions(-)

-- 
2.15.1

