From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 09 Nov 2019 08:55:18 +0000
Subject: [PATCH 0/3] FMan MAC: Improve exception handling in mac_probe()
Message-Id: <132e8369-c4da-249f-76b8-834e394dc6d5@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Igal Liberman <igal.liberman@freescale.com>, Madalin Bucur <madalin.bucur@nxp.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 9 Nov 2019 09:44:55 +0100

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Add missing put_device() calls
  Use common error handling code
  Return directly after a failed devm_kzalloc()

 drivers/net/ethernet/freescale/fman/mac.c | 73 ++++++++++++-----------
 1 file changed, 39 insertions(+), 34 deletions(-)

--
2.24.0
