From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 29 Dec 2017 16:25:08 +0000
Subject: [PATCH 0/3] parport-AX88796: Adjustments for parport_ax88796_probe()
Message-Id: <68c7b9ec-1d02-3981-8323-f72d1e7fa146@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 29 Dec 2017 17:21:23 +0100

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an error message for a failed memory allocation
  Improve a size determination
  Delete an unnecessary variable initialisation

 drivers/parport/parport_ax88796.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

-- 
2.15.1

