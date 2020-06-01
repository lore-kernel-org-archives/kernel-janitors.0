From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 01 Jun 2020 18:31:02 +0000
Subject: Re: [PATCH] pinctrl: pxa: pxa2xx: Remove 'pxa2xx_pinctrl_exit()' which is unused and broken
Message-Id: <20200601183102.GS30374@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200531073716.593343-1-christophe.jaillet@wanadoo.fr>
 <87h7vvb1s3.fsf@belgarion.home>
 <a2e34c9a-676f-d83f-f395-7428af038c16@wanadoo.fr>
In-Reply-To: <a2e34c9a-676f-d83f-f395-7428af038c16@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linus.walleij@linaro.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, haojian.zhuang@gmail.com, linux-gpio@vger.kernel.org, daniel@zonque.org, Robert Jarzmik <robert.jarzmik@free.fr>, linux-arm-kernel@lists.infradead.org

On Mon, Jun 01, 2020 at 01:31:23PM +0200, Christophe JAILLET wrote:
> Le 01/06/2020 =E0 10:58, Robert Jarzmik a =E9crit=A0:
> > Christophe JAILLET <christophe.jaillet@wanadoo.fr> writes:
> >=20
> > > Commit 6d33ee7a0534 ("pinctrl: pxa: Use devm_pinctrl_register() for p=
inctrl registration")
> > > has turned a 'pinctrl_register()' into 'devm_pinctrl_register()' in
> > > 'pxa2xx_pinctrl_init()'.
> > > However, the corresponding 'pinctrl_unregister()' call in
> > > 'pxa2xx_pinctrl_exit()' has not been removed.
> > >=20
> > > This is not an issue, because 'pxa2xx_pinctrl_exit()' is unused.
> > > Remove it now to avoid some wondering in the future and save a few Lo=
C.
> > >=20
> > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
> >=20
> > Would be even a better patch with a :
> > Fixes: 6d33ee7a0534 ("pinctrl: pxa: Use devm_pinctrl_register() for pin=
ctrl registration")
>=20
> I was wondering it was was needed in this case.
> The patch does not really fix anything, as the function is unused. Or it
> fixes things on a theoretical point of view.

There is no concensus...  We should call a vote on this at Kernel
Summit.  :P

regards,
dan carpenter
