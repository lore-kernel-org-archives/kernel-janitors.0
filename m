From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Mar 2018 21:30:13 +0000
Subject: [PATCH 0/3] wlcore: Adjustments for wl1271_acx_sta_rate_policies()
Message-Id: <b5db0825-394a-1d6d-351a-43be14e4c6b4@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, Colin Ian King <colin.king@canonical.com>, Kalle Valo <kvalo@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Mar 2018 22:25:45 +0100

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an unnecessary variable initialisation
  Return directly after a failed kzalloc()
  Use common error handling code

 drivers/net/wireless/ti/wlcore/acx.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

-- 
2.16.2

