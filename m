From: Florian Fainelli <f.fainelli@gmail.com>
Date: Fri, 20 Sep 2019 16:36:57 +0000
Subject: Re: [0/2] net: dsa: vsc73xx: Adjustments for vsc73xx_platform_probe()
Message-Id: <5d068275-796d-7d76-ba33-6eb03fb1d7cc@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <98fee5f4-1e45-a0c6-2a38-9201b201c6eb@web.de>
 <20190920150924.GG3530@lunn.ch> <4a220bc4-0340-d54a-70bd-7bea62257b81@web.de>
In-Reply-To: <4a220bc4-0340-d54a-70bd-7bea62257b81@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>, Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Pawel Dembicki <paweldembicki@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 9/20/19 8:30 AM, Markus Elfring wrote:
>> netdev is closed at the moment for patch.
> 
> I wonder about this information.

This is covered here:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/networking/netdev-FAQ.rst#n40

and you can skip the reading and check this URL:

http://vger.kernel.org/~davem/net-next.html

> 
> 
>> Please repost once it reopens, in about 2 weeks time.
> 
> I hope that the presented change possibilities can be integrated
> in the near future also without a repetition of this small patch series.
> https://lore.kernel.org/patchwork/project/lkml/list/?seriesA1271

You will have to resend it, and unless a bug fix comes in, which would
be the only reason for your changes not to be "current" anymore, then it
should apply as-is and you should be fine.
-- 
Florian
