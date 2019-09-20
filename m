From: Jakub Kicinski <jakub.kicinski@netronome.com>
Date: Fri, 20 Sep 2019 22:12:30 +0000
Subject: Re: [0/2] net: dsa: vsc73xx: Adjustments for vsc73xx_platform_probe()
Message-Id: <20190920151230.0d290654@cakuba.netronome.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <98fee5f4-1e45-a0c6-2a38-9201b201c6eb@web.de>
        <20190920150924.GG3530@lunn.ch>
        <4a220bc4-0340-d54a-70bd-7bea62257b81@web.de>
        <5d068275-796d-7d76-ba33-6eb03fb1d7cc@gmail.com>
In-Reply-To: <5d068275-796d-7d76-ba33-6eb03fb1d7cc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Pawel Dembicki <paweldembicki@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, 20 Sep 2019 09:36:57 -0700, Florian Fainelli wrote:
> On 9/20/19 8:30 AM, Markus Elfring wrote:
> >> netdev is closed at the moment for patch.  
> > 
> > I wonder about this information.  
> 
> This is covered here:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/networking/netdev-FAQ.rst#n40
> 
> and you can skip the reading and check this URL:
> 
> http://vger.kernel.org/~davem/net-next.html

Indeed, looks like we have a mix of clean ups of varying clarity here.
I will just drop all, including the devm_platform_ioremap_resource()
conversion patches from patchwork for now. 

Markus, please repost them all once net-next opens. 
Sorry for inconvenience.
