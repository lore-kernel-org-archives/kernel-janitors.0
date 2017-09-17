From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 17 Sep 2017 20:15:20 +0000
Subject: [PATCH 0/8] [media] Cx231xx: Adjustments for several function implementations
Message-Id: <f2c1ca56-ecdc-318c-f18f-9bef6c670ffb@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Bhumika Goyal <bhumirks@gmail.com>, Hans Verkuil <hans.verkuil@cisco.com>, Johan Hovold <johan@kernel.org>, Julia Lawall <Julia.Lawall@lip6.fr>, Matthias Schwarzott <zzam@gentoo.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Peter Rosin <peda@axentia.se>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 17 Sep 2017 21:30:12 +0200

Some update suggestions were taken into account
from static source code analysis.

Markus Elfring (8):
  Delete eight error messages for a failed memory allocation
  Adjust 56 checks for null pointers
  Improve six size determinations
  Delete an unnecessary variable initialisation in dvb_init()
  Use common error handling code in dvb_init()
  Use common error handling code in read_eeprom()
  Delete an unnecessary variable initialisation in read_eeprom()
  Use common error handling code in cx231xx_load_firmware()

 drivers/media/usb/cx231xx/cx231xx-417.c   |  65 +++++-----
 drivers/media/usb/cx231xx/cx231xx-audio.c |   2 +-
 drivers/media/usb/cx231xx/cx231xx-cards.c |  35 +++---
 drivers/media/usb/cx231xx/cx231xx-core.c  |  34 ++----
 drivers/media/usb/cx231xx/cx231xx-dvb.c   | 195 ++++++++++++------------------
 drivers/media/usb/cx231xx/cx231xx-vbi.c   |  17 +--
 drivers/media/usb/cx231xx/cx231xx-video.c |   6 +-
 7 files changed, 143 insertions(+), 211 deletions(-)

-- 
2.14.1

