From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 06 Aug 2017 19:15:28 +0000
Subject: [PATCH 0/5] mtip32xx: Adjustments for some function implementations
Message-Id: <524db5d1-1411-a839-6461-7c33403c1843@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bart Van Assche <Bart.VanAssche@sandisk.com>, Jens Axboe <axboe@kernel.dk>, Johannes Thumshirn <jthumshirn@suse.de>, Ming Lei <ming.lei@redhat.com>, Sagi Grimberg <sagi@grimberg.me>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 6 Aug 2017 21:02:34 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (5):
  Delete an error message for a failed memory allocation in five functions
  Improve a size determination in two functions
  Delete an unnecessary variable initialisation in mtip_pci_probe()
  Fix a typo in a comment line in mtip_hw_get_identify()
  Adjust an input validation check in mtip_hw_debugfs_exit()

 drivers/block/mtip32xx/mtip32xx.c | 37 ++++++++++---------------------------
 1 file changed, 10 insertions(+), 27 deletions(-)

-- 
2.13.4

