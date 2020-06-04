From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 04 Jun 2020 08:31:20 +0000
Subject: Re: [PATCH] pinctrl: pxa: pxa2xx: Remove 'pxa2xx_pinctrl_exit()' which is unused and broken
Message-Id: <20200604083120.GF22511@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200531073716.593343-1-christophe.jaillet@wanadoo.fr>
 <87h7vvb1s3.fsf@belgarion.home>
 <a2e34c9a-676f-d83f-f395-7428af038c16@wanadoo.fr>
 <20200601183102.GS30374@kadam>
 <CACRpkdasbS-4_ZwC-Ucm8tkSUW5tAQdUrXjxHXQ3J0goVYfgHw@mail.gmail.com>
In-Reply-To: <CACRpkdasbS-4_ZwC-Ucm8tkSUW5tAQdUrXjxHXQ3J0goVYfgHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Daniel Mack <daniel@zonque.org>, Robert Jarzmik <robert.jarzmik@free.fr>, Linux ARM <linux-arm-kernel@lists.infradead.org>

On Thu, Jun 04, 2020 at 12:08:49AM +0200, Linus Walleij wrote:
> On Mon, Jun 1, 2020 at 8:31 PM Dan Carpenter <dan.carpenter@oracle.com> w=
rote:
> > On Mon, Jun 01, 2020 at 01:31:23PM +0200, Christophe JAILLET wrote:
> > > Le 01/06/2020 =E0 10:58, Robert Jarzmik a =E9crit :
> > > > Christophe JAILLET <christophe.jaillet@wanadoo.fr> writes:
> > > >
> > > > > Commit 6d33ee7a0534 ("pinctrl: pxa: Use devm_pinctrl_register() f=
or pinctrl registration")
> > > > > has turned a 'pinctrl_register()' into 'devm_pinctrl_register()' =
in
> > > > > 'pxa2xx_pinctrl_init()'.
> > > > > However, the corresponding 'pinctrl_unregister()' call in
> > > > > 'pxa2xx_pinctrl_exit()' has not been removed.
> > > > >
> > > > > This is not an issue, because 'pxa2xx_pinctrl_exit()' is unused.
> > > > > Remove it now to avoid some wondering in the future and save a fe=
w LoC.
> > > > >
> > > > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > > > Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
> > > >
> > > > Would be even a better patch with a :
> > > > Fixes: 6d33ee7a0534 ("pinctrl: pxa: Use devm_pinctrl_register() for=
 pinctrl registration")
> > >
> > > I was wondering it was was needed in this case.
> > > The patch does not really fix anything, as the function is unused. Or=
 it
> > > fixes things on a theoretical point of view.
> >
> > There is no concensus...  We should call a vote on this at Kernel
> > Summit.  :P
>=20
> Fixes means it fixes something that was wrong in that commit.
> That's all. Whether syntactic or semantic or regression or
> serious or not does not matter. It is also not compulsory to
> add it is just helpful.

Fixes tag should be compulsory for actual bug fixes.  We had a the
Bad Binder exploit last year because commit f5cb779ba163
("ANDROID: binder: remove waitqueue when thread exits.") had no Fixes
tag and wasn't backported to Android kernels.

regards,
dan carpenter
