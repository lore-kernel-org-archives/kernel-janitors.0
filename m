From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 03 Jan 2018 20:10:55 +0000
Subject: [PATCH 0/2] wireless: libertas_tf: Adjustments for three function implementations
Message-Id: <e8b93aae-8dea-7089-43fe-9222054f0749@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, Arvind Yadav <arvind.yadav.cs@gmail.com>, Kalle Valo <kvalo@codeaurora.org>, Kees Cook <keescook@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 3 Jan 2018 21:06:54 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation
    in __if_usb_submit_rx_urb()
  Improve a size determination in two functions

 drivers/net/wireless/marvell/libertas_tf/if_usb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

-- 
2.15.1

