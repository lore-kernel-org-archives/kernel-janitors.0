From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 30 Dec 2017 21:06:00 +0000
Subject: [PATCH 0/2] at76c50x-usb: Adjustments for two function implementations
Message-Id: <1d76fe59-af15-ba4d-e05d-09dcd9ee38cd@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, Andrew Zaborowski <andrew.zaborowski@intel.com>, Arvind Yadav <arvind.yadav.cs@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Kalle Valo <kvalo@codeaurora.org>, Kees Cook <keescook@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 30 Dec 2017 22:01:23 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation in at76_submit_rx_urb()
  Improve size determinations in at76_usbdfu_download()

 drivers/net/wireless/atmel/at76c50x-usb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

-- 
2.15.1

