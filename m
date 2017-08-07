From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 07 Aug 2017 12:55:45 +0000
Subject: [PATCH 0/5] block-skd: Adjustments for some function implementations
Message-Id: <56b55301-2db3-9c0b-297f-c2115fd92c6c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Geliang Tang <geliangtang@gmail.com>, Jens Axboe <axboe@kernel.dk>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 7 Aug 2017 14:48:14 +0200

Some update suggestions were taken into account
from static source code analysis.

Markus Elfring (5):
  Delete an error message for a failed memory allocation in three functions
  Adjust 44 checks for null pointers
  Delete an unnecessary return statement in skd_pci_remove()
  Fix a typo in a comment line in skd_do_inq_page_da()
  Use ARRAY_SIZE() in skd_check_status()

 drivers/block/skd_main.c | 113 ++++++++++++++++++++---------------------------
 1 file changed, 49 insertions(+), 64 deletions(-)

-- 
2.13.4

