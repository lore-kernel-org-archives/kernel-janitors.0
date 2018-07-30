From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 30 Jul 2018 09:04:59 +0000
Subject: Re: [PATCH] pinctrl: imx: off by one in imx_pinconf_group_dbg_show()
Message-Id: <CACRpkdaSQtj+2tg_gB4zsaGNYMS35BLMp-cv1KWAx-_Z=ZDTWA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180719081648.o6ug4z3t42mrsmop@mwanda>
In-Reply-To: <20180719081648.o6ug4z3t42mrsmop@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Mon, Jul 30, 2018 at 8:41 AM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Sun, Jul 29, 2018 at 11:23:36PM +0200, Linus Walleij wrote:
> > On Thu, Jul 19, 2018 at 10:17 AM Dan Carpenter <dan.carpenter@oracle.co=
m> wrote:
> >
> > > The > should really be >=3D here.  It's harmless because
> > > pinctrl_generic_get_group() will return a NULL if group is invalid.
> > >
> > > Fixes: ae75ff814538 ("pinctrl: pinctrl-imx: add imx pinctrl core driv=
er")
> > > Reported-by: Dong Aisheng <aisheng.dong@nxp.com>
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > Patch applied.
>
> I see that you applied the imx_pinconf_group_dbg_show patch, but not the
> one specific to imx1 earlier in this thread. These are orthogonal and so
> both should be applied.

Oh I'm sorry if I missed something... which subject does the missing
patch have?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
