From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 18 Sep 2017 08:12:18 +0000
Subject: [PATCH 0/2] [media] dvb_usb_core: Adjustments for two function implementations
Message-Id: <38627457-f64f-7356-bf5e-fc41296a26e4@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Antti Palosaari <crope@iki.fi>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 18 Sep 2017 09:51:23 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete two error messages for a failed memory allocation in dvb_usbv2_probe()
  Improve a size determination in two functions

 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

-- 
2.14.1

