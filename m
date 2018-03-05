From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 05 Mar 2018 08:30:15 +0000
Subject: [PATCH 0/4] SCSI-HPSA: Adjustments for hpsa_big_passthru_ioctl()
Message-Id: <f013341a-e3b2-69a7-4918-8bb3d109f0cc@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-scsi@vger.kernel.org, esc.storagedev@microsemi.com, Don Brace <don.brace@microsemi.com>, "James E. J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 5 Mar 2018 09:14:32 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Use memdup_user() rather than duplicating its implementation
  Less function calls in hpsa_big_passthru_ioctl() after error detection
  Delete an unnecessary initialisation
  Move a variable assignment

 drivers/scsi/hpsa.c | 44 +++++++++++++++++++++-----------------------
 1 file changed, 21 insertions(+), 23 deletions(-)

-- 
2.16.2

