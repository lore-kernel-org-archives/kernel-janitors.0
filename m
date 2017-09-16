From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Sep 2017 10:50:15 +0000
Subject: [PATCH 0/3] [media] MR800: Adjustments for usb_amradio_probe()
Message-Id: <7efe75db-dbb4-0fe7-509d-908b81072ca1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Alexey Klimov <klimov.linux@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Sep 2017 12:35:43 +0200

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete two error messages for a failed memory allocation
  Improve a size determination
  Delete an unnecessary variable initialisation

 drivers/media/radio/radio-mr800.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

-- 
2.14.1

