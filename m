From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 27 Sep 2019 08:14:26 +0000
Subject: [PATCH v2 0/2] net: phy: mscc-miim: Adjustments for mscc_miim_probe()
Message-Id: <8fbfa9ad-182a-e2ce-e91f-7350523e33c7@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <189ccfc3-d5a6-79fd-29b8-1f7140e9639a@web.de>
 <506889a6-4148-89f9-302e-4be069595bb4@web.de> <20190920190908.GH3530@lunn.ch>
 <121e75c5-4d45-9df2-a471-6997a1fb3218@web.de>
 <20190926161825.GB6825@piout.net>
 <0a1f4dbf-4cc6-8530-a38e-31c3369e6db6@web.de>
 <20190926193239.GC6825@piout.net>
In-Reply-To: <20190926193239.GC6825@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 27 Sep 2019 09:48:09 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use devm_platform_ioremap_resource()
  Move the setting of mii_bus structure members

 drivers/net/phy/mdio-mscc-miim.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

--
2.23.0
