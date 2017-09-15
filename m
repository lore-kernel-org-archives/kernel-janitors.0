From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Sep 2017 07:46:31 +0000
Subject: [PATCH 0/9] [media] TM6000: Adjustments for some function implementations
Message-Id: <2aade468-5dfd-76ee-f59f-c25864930f61@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, Arvind Yadav <arvind.yadav.cs@gmail.com>, Bhumika Goyal <bhumirks@gmail.com>, Christophe Jaillet <christophe.jaillet@wanadoo.fr>, =?UTF-8?Q?David_H=c3=a4rdeman?= <david@hardeman.nu>, Hans Verkuil <hans.verkuil@cisco.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Santosh Kumar Singh <kumar.san1093@gmail.com>, Sean Young <sean@mess.org>, Wei Yongjun <weiyongjun1@huawei.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Sep 2017 08:24:56 +0200

Some update suggestions were taken into account
from static source code analysis.

Markus Elfring (9):
  Delete seven error messages for a failed memory allocation
  Adjust seven checks for null pointers
  Use common error handling code in tm6000_usb_probe()
  One function call less in tm6000_usb_probe() after error detection
  Delete an unnecessary variable initialisation in tm6000_usb_probe()
  Use common error handling code in tm6000_cards_setup()
  Improve a size determination in dvb_init()
  Use common error handling code in tm6000_start_stream()
  Use common error handling code in tm6000_prepare_isoc()

 drivers/media/usb/tm6000/tm6000-cards.c | 36 ++++++++++++++++-----------------
 drivers/media/usb/tm6000/tm6000-dvb.c   | 24 +++++++++++-----------
 drivers/media/usb/tm6000/tm6000-input.c |  2 +-
 drivers/media/usb/tm6000/tm6000-video.c | 30 +++++++++++----------------
 4 files changed, 42 insertions(+), 50 deletions(-)

-- 
2.14.1

