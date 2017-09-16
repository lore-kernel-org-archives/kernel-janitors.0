From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Sep 2017 13:35:49 +0000
Subject: [PATCH 0/3] [media] si470x: Adjustments for si470x_usb_driver_probe()
Message-Id: <b58222fa-99f8-f2d6-2755-5ccd4a91e783@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Sep 2017 15:16:17 +0200

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an error message for a failed memory allocation
  Improve a size determination
  Delete an unnecessary variable initialisation

 drivers/media/radio/si470x/radio-si470x-usb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

-- 
2.14.1

