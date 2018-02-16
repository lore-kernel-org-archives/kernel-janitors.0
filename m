From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 16 Feb 2018 15:56:16 +0000
Subject: [PATCH 0/3] PATA-Arasan CF: Adjustments for arasan_cf_probe()
Message-Id: <d492f9d2-ed64-e858-441a-fa554369032c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ide@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tejun Heo <tj@kernel.org>, Viresh Kumar <vireshk@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 16 Feb 2018 16:51:23 +0100

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an error message for a failed memory allocation
  Delete an unnecessary variable initialisation
  Move two variable assignments

 drivers/ata/pata_arasan_cf.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

-- 
2.16.1

