From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 19 Aug 2016 21:07:18 +0000
Subject: [PATCH 0/2] mmc-block: Fine-tuning for mmc_blk_ioctl_copy_from_user()
Message-Id: <68870228-c6a0-5de9-daee-2522a1303857@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, Grant Grundler <grundler@chromium.org>, Jens Axboe <axboe@fb.com>, Jon Hunter <jonathanh@nvidia.com>, Mike Christie <mchristi@redhat.com>, Shawn Lin <shawn.lin@rock-chips.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 19 Aug 2016 23:00:23 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use memdup_user()
  Rename jump labels

 drivers/mmc/card/block.c | 34 +++++++++++++---------------------
 1 file changed, 13 insertions(+), 21 deletions(-)

-- 
2.9.3

