From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 06 Mar 2017 17:38:08 +0000
Subject: [PATCH 0/5] IB/nes: Fine-tuning for some function implementations
Message-Id: <502a5a6f-ee91-dd2f-cdc7-63f396059529@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma@vger.kernel.org, Doug Ledford <dledford@redhat.com>, Faisal Latif <faisal.latif@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, Sean Hefty <sean.hefty@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 6 Mar 2017 18:26:34 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (5):
  Use kcalloc() in nes_init_mgt_qp()
  Use kcalloc() in nes_reg_user_mr()
  Adjust 16 checks for null pointers
  Delete unnecessary braces
  Improve size determinations in two functions

 drivers/infiniband/hw/nes/nes_mgt.c   |   2 +-
 drivers/infiniband/hw/nes/nes_verbs.c | 128 +++++++++++++---------------------
 2 files changed, 50 insertions(+), 80 deletions(-)

-- 
2.12.0

