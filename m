From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 01 Jan 2016 18:21:04 +0000
Subject: [PATCH 0/2] net-ath9k_htc: Fine-tuning for two function implementations
Message-Id: <5686C390.5060600@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ath9k-devel@lists.ath9k.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, ath9k-devel@qca.qualcomm.com, Kalle Valo <kvalo@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 1 Jan 2016 19:16:05 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an unnecessary variable initialisation in ath9k_hif_usb_rx_stream()
  Replace a variable initialisation by an assignment in ath9k_htc_set_channel()

 drivers/net/wireless/ath/ath9k/hif_usb.c      | 2 +-
 drivers/net/wireless/ath/ath9k/htc_drv_main.c | 7 ++-----
 2 files changed, 3 insertions(+), 6 deletions(-)

-- 
2.6.3

