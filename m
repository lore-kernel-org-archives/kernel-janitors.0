From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Mar 2018 18:22:55 +0000
Subject: [PATCH 0/2] net/usb/ax88179_178a: Adjustments for ax88179_chk_eee()
Message-Id: <b92bebdb-c1dc-a9d3-2e3a-845d8dc4998f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, netdev@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>, =?UTF-8?Q?Bj=c3=b8rn_Mork?= <bjorn@mork.no>, "David S. Miller" <davem@davemloft.net>, Philippe Reynes <tremyfr@gmail.com>, Yuval Shaia <yuval.shaia@oracle.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Mar 2018 19:05:45 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use common code
  Delete three unnecessary variables

 drivers/net/usb/ax88179_178a.c | 45 +++++++++++++++---------------------------
 1 file changed, 16 insertions(+), 29 deletions(-)

-- 
2.16.2

