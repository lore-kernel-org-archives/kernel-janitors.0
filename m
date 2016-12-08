From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 08 Dec 2016 11:30:20 +0000
Subject: [PATCH 0/5] staging-COMEDI: Fine-tuning for three functions
Message-Id: <8cddc37d-4529-ada4-ac21-20e09e888d0d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Chris Cesare <chris.cesare@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, H Hartley Sweeten <hsweeten@visionengravers.com>, Ian Abbott <abbotti@mev.co.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 8 Dec 2016 11:37:37 +0100

Some update suggestions were taken into account
from static source code analysis.

Markus Elfring (5):
  Combine four kcalloc() calls into one in serial2002_setup_subdevs()
  Split a condition check in usbdux_alloc_usb_buffers()
  Move an assignment in usbdux_alloc_usb_buffers()
  Split a condition check in usbduxsigma_alloc_usb_buffers()
  Move an assignment in usbduxsigma_alloc_usb_buffers()

 drivers/staging/comedi/drivers/serial2002.c  | 22 +++++-----
 drivers/staging/comedi/drivers/usbdux.c      | 56 ++++++++++++++++++-----
 drivers/staging/comedi/drivers/usbduxsigma.c | 66 ++++++++++++++++++++++------
 3 files changed, 108 insertions(+), 36 deletions(-)

-- 
2.11.0

