From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 20 Sep 2019 14:25:53 +0000
Subject: [PATCH 0/2] net: dsa: vsc73xx: Adjustments for vsc73xx_platform_probe()
Message-Id: <98fee5f4-1e45-a0c6-2a38-9201b201c6eb@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Pawel Dembicki <paweldembicki@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 20 Sep 2019 16:17:18 +0200

Two update suggestions were taken into account
from static source code analysis.


Markus Elfring (2):
  Use devm_platform_ioremap_resource()
  Return an error code as a constant

 drivers/net/dsa/vitesse-vsc73xx-platform.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

--
2.23.0
