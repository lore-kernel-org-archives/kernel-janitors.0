From: Julia Lawall <julia.lawall@inria.fr>
Date: Thu, 04 Jun 2020 10:33:53 +0000
Subject: Re: [PATCH] pinctrl: pxa: pxa2xx: Remove 'pxa2xx_pinctrl_exit()' which is unused and broken
Message-Id: <alpine.DEB.2.21.2006041228520.2577@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200531073716.593343-1-christophe.jaillet@wanadoo.fr>
 <87h7vvb1s3.fsf@belgarion.home>
 <a2e34c9a-676f-d83f-f395-7428af038c16@wanadoo.fr>
 <20200601183102.GS30374@kadam>
 <CACRpkdasbS-4_ZwC-Ucm8tkSUW5tAQdUrXjxHXQ3J0goVYfgHw@mail.gmail.com>
 <20200604083120.GF22511@kadam>
 <2aa49a543e6f48a6f428a37b63a06f9149870225.camel@perches.com>
 <alpine.DEB.2.21.2006041147360.2577@hadrien>
 <32232229031e02edcc268b1074c9bac44012ee35.camel@perches.com>
In-Reply-To: <32232229031e02edcc268b1074c9bac44012ee35.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Dan Carpenter <dan.carpenter@oracle.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>



On Thu, 4 Jun 2020, Joe Perches wrote:

> On Thu, 2020-06-04 at 11:52 +0200, Julia Lawall wrote:
> > Should Fixes also be used when the change will make it hard to port other
> > fixes over it?
>
> If it's a logic defect or regression that's being fixed,
> shouldn't the logic defect or regression be fixed as
> reasonably soon as possible?

Sure, but I recall seeing some patches that mentioned that the problem had
existed since the beginning of git.  Of course, it should be rare.

>
> The nature of the fix should ideally be optimal for
> backporting, but I believe that should not stop any
> consideration for the standalone fix itself.

I'm not sure to follow this.  Sometimes non-bug fixes that block
backporting a bug fix have to be backported as well.  So the fixes would
again highlight the range of versions affected by the issue.

julia

> What do you think?
>
>
