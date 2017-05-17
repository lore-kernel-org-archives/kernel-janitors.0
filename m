From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 17 May 2017 15:43:59 +0000
Subject: [PATCH 0/2] spidev: Adjustments for six function implementations
Message-Id: <c5452d8c-d123-d5e9-b2cc-a386d1325aec@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 17 May 2017 17:41:23 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete error messages for failed memory allocations in spidev_open()
  Adjust five checks for null pointers

 drivers/spi/spidev.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

-- 
2.13.0

