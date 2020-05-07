From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 07 May 2020 11:16:29 +0000
Subject: Re: net: broadcom: fix a mistake about ioremap resource
Message-Id: <c33b90a6-3f4d-d3fb-7f65-928247cd2ee7@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f3208af6-80ad-223f-3490-30561996afff@web.de>
 <CAHrpVsWbAdf+K1+mToj-5yoj-quFoXwF5D6_aAKufBE2tNSkFA@mail.gmail.com>
In-Reply-To: <CAHrpVsWbAdf+K1+mToj-5yoj-quFoXwF5D6_aAKufBE2tNSkFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Richardson <jonathan.richardson@broadcom.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: Dejin Zheng <zhengdejin5@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, =?UTF-8?Q?Petr_=c5=a0tetiar?= <ynezz@true.cz>, Ray Jui <ray.jui@broadcom.com>, Scott Branden <scott.branden@broadcom.com>, Stephen Boyd <swboyd@chromium.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> I hope that other contributors can convince you to improve also this
>> commit message considerably.
>> Would you like to fix the spelling besides other wording weaknesses?
>
> How about this wording:
>
> Commit d7a5502b0bb8b ("net: broadcom: convert to
> devm_platform_ioremap_resource_byname()")
> inadvertently made idm_base and nicpm_base mandatory. These are
> optional properties.
> probe will fail when they're not defined. The commit is partially
> reverted so that they are
> obtained by platform_get_resource_byname() as before. amac_base can
> still be obtained
> by devm_platform_ioremap_resource_byname().

Is it interesting anyhow that another attempt for such an improvement
did not get the possibly desired software development attention?
https://lore.kernel.org/lkml/20200505.111206.118627398774406136.davem@davemloft.net/
https://lore.kernel.org/patchwork/comment/1430759/
https://lkml.org/lkml/2020/5/5/1114

Regards,
Markus
