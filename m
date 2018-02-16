From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 16 Feb 2018 12:37:16 +0000
Subject: [PATCH 0/3] PATA-MacIO: Adjustments for five function implementations
Message-Id: <1e87cf7d-eda2-12d9-af01-17f6619cda72@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ide@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tejun Heo <tj@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 16 Feb 2018 13:32:23 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an error message for a failed memory allocation in two functions
  Improve a size determination in two functions
  Adjust 11 checks for null pointers

 drivers/ata/pata_macio.c | 40 +++++++++++++++++-----------------------
 1 file changed, 17 insertions(+), 23 deletions(-)

-- 
2.16.1

