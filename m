From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 21 Sep 2019 07:12:44 +0000
Subject: Re: [0/2] net: dsa: vsc73xx: Adjustments for vsc73xx_platform_probe()
Message-Id: <a5e3f8e6-bdb9-c5fb-2435-81a545cad121@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <98fee5f4-1e45-a0c6-2a38-9201b201c6eb@web.de>
 <20190920150924.GG3530@lunn.ch> <4a220bc4-0340-d54a-70bd-7bea62257b81@web.de>
 <5d068275-796d-7d76-ba33-6eb03fb1d7cc@gmail.com>
 <20190920151230.0d290654@cakuba.netronome.com>
In-Reply-To: <20190920151230.0d290654@cakuba.netronome.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jakub Kicinski <jakub.kicinski@netronome.com>, netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Pawel Dembicki <paweldembicki@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

> Indeed, looks like we have a mix of clean ups of varying clarity here.
> I will just drop all, including the devm_platform_ioremap_resource()
> conversion patches from patchwork for now.

I would prefer an other patch management in this case.


> Markus, please repost them all once net-next opens.
> Sorry for inconvenience.

I would find it nicer if presented change possibilities can be
automatically reconsidered on demand after each closed period.
https://patchwork.ozlabs.org/project/netdev/list/?submitter=76334&state=*
https://patchwork.ozlabs.org/project/netdev/list/?submitter=65077&state=*&archive=both

Regards,
Markus
