From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 25 Apr 2017 20:24:16 +0000
Subject: [PATCH 0/3] SCSI-UFSHCD: Fine-tuning for two function implementations
Message-Id: <75622f45-f46c-e52f-2b9e-6ff5ce32184a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-scsi@vger.kernel.org, "James E. J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Vinayak Holikatti <vinholikatti@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 25 Apr 2017 22:20:02 +0200

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Use devm_kcalloc() in ufshcd_memory_alloc()
  Delete an error message for a failed memory allocation in ufshcd_memory_alloc()
  Delete an unnecessary return statement in ufshcd_exception_event_handler()

 drivers/scsi/ufs/ufshcd.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

-- 
2.12.2

