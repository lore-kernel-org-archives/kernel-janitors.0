From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 26 Sep 2019 18:52:38 +0000
Subject: Re: [1/2] net/phy/mdio-mscc-miim: Use devm_platform_ioremap_resource() in mscc_miim_probe()
Message-Id: <0a1f4dbf-4cc6-8530-a38e-31c3369e6db6@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <189ccfc3-d5a6-79fd-29b8-1f7140e9639a@web.de>
 <506889a6-4148-89f9-302e-4be069595bb4@web.de> <20190920190908.GH3530@lunn.ch>
 <121e75c5-4d45-9df2-a471-6997a1fb3218@web.de>
 <20190926161825.GB6825@piout.net>
In-Reply-To: <20190926161825.GB6825@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> Does this feedback indicate also an agreement for the detail
>> if the mapping of internal phy registers would be a required operation?
>> (Would such a resource allocation eventually be optional?)
>
> It is optional.

Would you like to integrate an other patch variant then?

Regards,
Markus
