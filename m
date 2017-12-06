From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 06 Dec 2017 18:34:24 +0000
Subject: [PATCH 0/3] UIO: Adjustments for two function implementations
Message-Id: <2efe226c-065a-b77d-d278-4345ab2586b1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 6 Dec 2017 19:32:10 +0100

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete two error messages for a failed memory allocation
    in uio_dmem_genirq_probe()
  Return directly after a failed kzalloc() in uio_dmem_genirq_probe()
  Delete two error messages for a failed memory allocation
    in uio_pdrv_genirq_probe()

 drivers/uio/uio_dmem_genirq.c | 11 ++++-------
 drivers/uio/uio_pdrv_genirq.c |  9 +++------
 2 files changed, 7 insertions(+), 13 deletions(-)

-- 
2.15.1

