From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 22 May 2017 06:12:13 +0000
Subject: [PATCH 0/2] ieee802154: ca8210: Adjustments for two function implementations
Message-Id: <55fddbc7-28c4-8866-67d3-ff1ff1a4eeb7@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxdev@cascoda.com, linux-wpan@vger.kernel.org, netdev@vger.kernel.org, Alexander Aring <aar@pengutronix.de>, Harry Morris <h.morris@cascoda.com>, Stefan Schmidt <stefan@osg.samsung.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 22 May 2017 08:08:04 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation in ca8210_probe()
  Delete an error message for a failed memory allocation in ca8210_skb_rx()

 drivers/net/ieee802154/ca8210.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

-- 
2.13.0

