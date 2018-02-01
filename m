From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 01 Feb 2018 16:55:05 +0000
Subject: [PATCH 0/2] i2c-tiny-usb: Adjustments for i2c_tiny_usb_probe()
Message-Id: <5ab52458-e334-bb06-8d7d-66b48ac3f30b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-i2c@vger.kernel.org, Till Harbaum <till@harbaum.org>, Wolfram Sang <wsa@the-dreams.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 1 Feb 2018 17:51:23 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation
  Return an error code only as a constant

 drivers/i2c/busses/i2c-tiny-usb.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

-- 
2.16.1

