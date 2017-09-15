From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Sep 2017 20:40:37 +0000
Subject: [PATCH 0/2] [media] MA901: Adjustments for usb_ma901radio_probe()
Message-Id: <6d4d9e92-9ac5-1e46-99ed-2b7d93bd7121@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Alexey Klimov <klimov.linux@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Sep 2017 22:31:23 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete two error messages for a failed memory allocation
  Improve a size determination

 drivers/media/radio/radio-ma901.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

-- 
2.14.1

