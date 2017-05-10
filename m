From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 May 2017 18:00:17 +0000
Subject: [PATCH 0/3] S390-DASD: Fine-tuning for some function implementations
Message-Id: <4af00744-1c8a-6b33-22c8-d26d569f6c5f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-s390@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>, =?UTF-8?Q?Jan_H=c3=b6ppner?= <hoeppner@linux.vnet.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Stefan Haberland <sth@linux.vnet.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 May 2017 19:43:21 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Adjust buffer output in dasd_hosts_print()
  Fix typos in two comment lines
  Adjust six checks for null pointers

 drivers/s390/block/dasd_eckd.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

-- 
2.12.3

