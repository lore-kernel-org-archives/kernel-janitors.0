From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 16 Feb 2018 14:20:59 +0000
Subject: [PATCH 0/2] PATA-IT821x: Adjustments for it821x_firmware_command()
Message-Id: <6cdadc5e-bfbd-9866-a69f-d225e68c3b22@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ide@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tejun Heo <tj@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 16 Feb 2018 15:03:45 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation
  Use common error handling code

 drivers/ata/pata_it821x.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

-- 
2.16.1

