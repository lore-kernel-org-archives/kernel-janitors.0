From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 03 Feb 2018 20:16:31 +0000
Subject: [PATCH 0/2] HID-picoLCD: Adjustments for three function implementations
Message-Id: <1ef884c9-9fbe-b95f-d318-b806639e6065@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, =?UTF-8?Q?Bruno_Pr=c3=a9mont?= <bonbons@linux-vserver.org>, Jiri Kosina <jikos@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 3 Feb 2018 21:12:24 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation in three functions
  Improve a size determination in picolcd_probe()

 drivers/hid/hid-picolcd_core.c | 3 +--
 drivers/hid/hid-picolcd_fb.c   | 5 ++---
 drivers/hid/hid-picolcd_leds.c | 1 -
 3 files changed, 3 insertions(+), 6 deletions(-)

-- 
2.16.1

