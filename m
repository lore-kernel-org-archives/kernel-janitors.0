From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 18 Sep 2017 13:52:49 +0000
Subject: [PATCH 0/6] [media] Go7007: Adjustments for some function implementations
Message-Id: <b36ece3f-0f31-9bb6-14ae-c4abf7cd23ee@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 18 Sep 2017 14:54:32 +0200

Some update suggestions were taken into account
from static source code analysis.

Markus Elfring (6):
  Delete an error message for a failed memory allocation in go7007_load_encoder()
  Adjust 35 checks for null pointers
  Improve a size determination in four functions
  Use common error handling code in s2250_probe()
  Use common error handling code in go7007_snd_init()
  Delete an unnecessary variable initialisation in go7007_snd_init()

 drivers/media/usb/go7007/go7007-driver.c | 13 ++++---
 drivers/media/usb/go7007/go7007-fw.c     |  8 ++---
 drivers/media/usb/go7007/go7007-loader.c |  4 +--
 drivers/media/usb/go7007/go7007-usb.c    | 20 +++++------
 drivers/media/usb/go7007/go7007-v4l2.c   |  6 ++--
 drivers/media/usb/go7007/s2250-board.c   | 59 +++++++++++++++-----------------
 drivers/media/usb/go7007/snd-go7007.c    | 45 ++++++++++++------------
 7 files changed, 75 insertions(+), 80 deletions(-)

-- 
2.14.1

