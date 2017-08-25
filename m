From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 25 Aug 2017 20:22:42 +0000
Subject: [PATCH 0/3] SCSI-sg: Adjustments for two function implementations
Message-Id: <0fffccee-7cc1-1321-2c6b-00ac06b304b8@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-scsi@vger.kernel.org, Doug Gilbert <dgilbert@interlog.com>, "James E. J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 25 Aug 2017 22:20:02 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an error message for a failed memory allocation in sg_alloc()
  Improve a size determination in sg_alloc()
  Fix a typo in a comment line in sg_ioctl()

 drivers/scsi/sg.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

-- 
2.14.0

