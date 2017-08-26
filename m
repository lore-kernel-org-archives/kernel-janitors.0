From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 26 Aug 2017 20:42:06 +0000
Subject: [PATCH 0/3] [media] usbvision: Adjustments for six function implementations
Message-Id: <f72f836e-6cab-8b79-9d87-a79bd62be174@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Davidlohr Bueso <dave@stgolabs.net>, Hans Verkuil <hverkuil@xs4all.nl>, Johan Hovold <johan@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 26 Aug 2017 22:36:54 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an error message for a failed memory allocation in usbvision_probe()
  Adjust eight checks for null pointers
  Improve a size determination in usbvision_alloc()

 drivers/media/usb/usbvision/usbvision-video.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

-- 
2.14.0

