From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 08 Nov 2017 21:33:11 +0000
Subject: [PATCH 0/2] tipc: Fine-tuning for three function implementations
Message-Id: <25790616-164d-fe3e-bda4-3155299a8171@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tipc-discussion@lists.sourceforge.net, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jon Maloy <jon.maloy@ericsson.com>, Ying Xue <ying.xue@windriver.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 8 Nov 2017 22:30:03 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use common error handling code in tipc_server_start()
  Improve a size determination in two functions

 net/tipc/server.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

-- 
2.15.0

