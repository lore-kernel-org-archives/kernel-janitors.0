From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 04 Jun 2020 12:30:38 +0000
Subject: Re: [PATCH] pinctrl: pxa: pxa2xx: Remove 'pxa2xx_pinctrl_exit()' which is unused and broken
Message-Id: <20200604123038.GG22511@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a2e34c9a-676f-d83f-f395-7428af038c16@wanadoo.fr>
 <20200601183102.GS30374@kadam>
 <CACRpkdasbS-4_ZwC-Ucm8tkSUW5tAQdUrXjxHXQ3J0goVYfgHw@mail.gmail.com>
 <20200604083120.GF22511@kadam>
 <2aa49a543e6f48a6f428a37b63a06f9149870225.camel@perches.com>
 <alpine.DEB.2.21.2006041147360.2577@hadrien>
 <32232229031e02edcc268b1074c9bac44012ee35.camel@perches.com>
 <alpine.DEB.2.21.2006041228520.2577@hadrien>
 <10e54ee84bd44171ef329bed9e7e6a946bae61ba.camel@perches.com>
 <alpine.DEB.2.21.2006041328570.2577@hadrien>
In-Reply-To: <alpine.DEB.2.21.2006041328570.2577@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Joe Perches <joe@perches.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>

On Thu, Jun 04, 2020 at 01:42:12PM +0200, Julia Lawall wrote:
> OK, I recall a discussion with Dan where he suggested that some things
> that were not actually bug fixes could also merit a Fixes tag.  But it's
> probably better if he weighs in directly.

I generally think Fixes should only be used for "real bug" fixes.

The one exception is when I'm reviewing a patch that fixes an "unused
assignment" static checker warning is that I know which commit
introduced the warning.  I don't have strong feelings if it's in the
Fixes tag or if it's just mentioned in the commit message.  But it
helps me when I'm reviewing if I don't have to grovel through git
history myself.  Also I think that it's always a good exercise for
people fixing patches to look at how the bug was introduced.

regards,
dan carpenter
