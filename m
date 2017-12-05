From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 05 Dec 2017 20:25:13 +0000
Subject: [PATCH 0/4] UWB: Adjustments for four function implementations
Message-Id: <994a4a57-cfe6-91b5-5fc1-d4153cc5b0e6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, Andrey Konovalov <andreyknvl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 5 Dec 2017 21:17:55 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Delete an error message for a failed memory allocation in hwarc_probe()
  Delete an error message for a failed memory allocation in whcrc_probe()
  Delete an error message for a failed memory allocation in fw_hdrs_load()
  Delete two error messages for a failed memory allocation in i1480_usb_probe()

 drivers/uwb/hwa-rc.c        | 5 ++---
 drivers/uwb/i1480/dfu/mac.c | 4 +---
 drivers/uwb/i1480/dfu/usb.c | 4 +---
 drivers/uwb/whc-rc.c        | 5 ++---
 4 files changed, 6 insertions(+), 12 deletions(-)

-- 
2.15.1

