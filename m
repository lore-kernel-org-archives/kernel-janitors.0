From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 20 Sep 2019 19:00:13 +0000
Subject: [PATCH 0/2] net/phy/mdio-mscc-miim: Adjustments for mscc_miim_probe()
Message-Id: <189ccfc3-d5a6-79fd-29b8-1f7140e9639a@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 20 Sep 2019 20:52:25 +0200

Two update suggestions were taken into account

from static source code analysis.

Markus Elfring (2):
  Use devm_platform_ioremap_resource()
  Move the setting of mii_bus structure members

 drivers/net/phy/mdio-mscc-miim.c | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

--
2.23.0
