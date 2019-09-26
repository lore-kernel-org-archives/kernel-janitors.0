From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Thu, 26 Sep 2019 16:18:25 +0000
Subject: Re: [1/2] net/phy/mdio-mscc-miim: Use devm_platform_ioremap_resource() in mscc_miim_probe()
Message-Id: <20190926161825.GB6825@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <189ccfc3-d5a6-79fd-29b8-1f7140e9639a@web.de>
 <506889a6-4148-89f9-302e-4be069595bb4@web.de>
 <20190920190908.GH3530@lunn.ch>
 <121e75c5-4d45-9df2-a471-6997a1fb3218@web.de>
In-Reply-To: <121e75c5-4d45-9df2-a471-6997a1fb3218@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 26/09/2019 17:29:02+0200, Markus Elfring wrote:
> >> Simplify this function implementation by using a known wrapper functio=
n.
> =E2=80=A6
> > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>=20
> Does this feedback indicate also an agreement for the detail
> if the mapping of internal phy registers would be a required operation?
> (Would such a resource allocation eventually be optional?)

It is optional.


--=20
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
