From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 21 Sep 2017 15:04:53 +0000
Subject: [PATCH 0/4] [media] usbvision-core: Fine-tuning for some function implementations
Message-Id: <c0e6e8e7-e47d-dc88-3317-2e46eaa51dc6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Davidlohr Bueso <dave@stgolabs.net>, Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 21 Sep 2017 17:00:17 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Use common error handling code in usbvision_set_input()
  Use common error handling code in usbvision_set_compress_params()
  Delete unnecessary braces in 11 functions
  Replace four printk() calls by dev_err()

 drivers/media/usb/usbvision/usbvision-core.c | 128 ++++++++++++---------------
 1 file changed, 58 insertions(+), 70 deletions(-)

-- 
2.14.1

