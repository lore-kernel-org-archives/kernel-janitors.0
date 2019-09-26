From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 26 Sep 2019 15:29:02 +0000
Subject: Re: [1/2] net/phy/mdio-mscc-miim: Use devm_platform_ioremap_resource() in mscc_miim_probe()
Message-Id: <121e75c5-4d45-9df2-a471-6997a1fb3218@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <189ccfc3-d5a6-79fd-29b8-1f7140e9639a@web.de>
 <506889a6-4148-89f9-302e-4be069595bb4@web.de> <20190920190908.GH3530@lunn.ch>
In-Reply-To: <20190920190908.GH3530@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> Simplify this function implementation by using a known wrapper function.
=E2=80=A6
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Does this feedback indicate also an agreement for the detail
if the mapping of internal phy registers would be a required operation?
(Would such a resource allocation eventually be optional?)
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/net/phy/mdio-mscc-miim.c?id=3Df41def397161053eb0d3ed6861ef65985efbf293=
#n145
https://elixir.bootlin.com/linux/v5.3.1/source/drivers/net/phy/mdio-mscc-mi=
im.c#L145

Regards,
Markus
