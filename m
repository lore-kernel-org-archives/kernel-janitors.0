From: Joe Perches <joe@perches.com>
Date: Thu, 04 Jun 2020 18:02:23 +0000
Subject: Re: [PATCH] pinctrl: pxa: pxa2xx: Remove 'pxa2xx_pinctrl_exit()' which is unused and broken
Message-Id: <c925d033cf566743a1f6255da7843d1b85451d2f.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CACRpkdasbS-4_ZwC-Ucm8tkSUW5tAQdUrXjxHXQ3J0goVYfgHw@mail.gmail.com>
 <20200604083120.GF22511@kadam>
 <2aa49a543e6f48a6f428a37b63a06f9149870225.camel@perches.com>
 <alpine.DEB.2.21.2006041147360.2577@hadrien>
 <32232229031e02edcc268b1074c9bac44012ee35.camel@perches.com>
 <alpine.DEB.2.21.2006041228520.2577@hadrien>
 <10e54ee84bd44171ef329bed9e7e6a946bae61ba.camel@perches.com>
 <alpine.DEB.2.21.2006041328570.2577@hadrien> <20200604123038.GG22511@kadam>
 <0749ac5e3868c6ba50728ced8366bfd86b0b8500.camel@perches.com>
 <20200604173500.GI22511@kadam>
In-Reply-To: <20200604173500.GI22511@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Julia Lawall <julia.lawall@inria.fr>, "open list:GPIO
 SUBSYSTEM" <linux-gpio@vger.kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>

On Thu, 2020-06-04 at 20:35 +0300, Dan Carpenter wrote:
> On Thu, Jun 04, 2020 at 09:08:44AM -0700, Joe Perches wrote:
> > On Thu, 2020-06-04 at 15:30 +0300, Dan Carpenter wrote:
> > > On Thu, Jun 04, 2020 at 01:42:12PM +0200, Julia Lawall wrote:
> > > > OK, I recall a discussion with Dan where he suggested that some things
> > > > that were not actually bug fixes could also merit a Fixes tag.  But it's
> > > > probably better if he weighs in directly.
> > > 
> > > I generally think Fixes should only be used for "real bug" fixes.
> > > 
> > > The one exception is when I'm reviewing a patch that fixes an "unused
> > > assignment" static checker warning is that I know which commit
> > > introduced the warning.

Sometimes those warnings are introduced by new compiler
versions.

That's why I don't care for -Werror use in Makefiles.

> > > I don't have strong feelings if it's in the
> > > Fixes tag or if it's just mentioned in the commit message.
> > 
> > My view is that changes that silence compiler warnings are
> > not fixing bugs and that these changes should generally not
> > be backported.
> > 
> The Fixes tag is useful for backports but that's not whole the point of
> it.  It's also for collecting metrics.

Hmm, how are these metrics used?

> Also sometimes we fix the bug
> before the kernel is released so the Fixes tag means we can automatically
> ignore those ones when we look at which patches to backport.
> 
> I don't care if the "unused assignment" patches use a Fixes tag or just
> mention the commit.  Either way the information is there for when I
> review the patch.

Perhaps there could/should be some distinction between
"real bug" fixes and trivialities like "unused assignment"

Maybe something like:
	Updates: <commit> ("commit description")
vs
	Fixes: <commit> ("commit description")
