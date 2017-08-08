From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=  <u.kleine-koenig@pengutronix.de>
Date: Tue, 08 Aug 2017 08:15:01 +0000
Subject: Re: [PATCH] i2c: imx: Remove a useless test in 'i2c_imx_init_recovery_info()'
Message-Id: <20170808081501.jxhid5rgfeqpshfw@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170806234953.30682-1-christophe.jaillet@wanadoo.fr>
 <20170807063617.5wr4i7b7k72uyrit@pengutronix.de>
 <9279b880-558a-17fb-404c-98012bb0f9f1@wanadoo.fr>
In-Reply-To: <9279b880-558a-17fb-404c-98012bb0f9f1@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: wsa@the-dreams.de, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Tue, Aug 08, 2017 at 09:40:59AM +0200, Christophe JAILLET wrote:
> Le 07/08/2017 =E0 08:36, Uwe Kleine-K=F6nig a =E9crit :
> > On Mon, Aug 07, 2017 at 01:49:53AM +0200, Christophe JAILLET wrote:
> > > 'devm_pinctrl_get()' never returns NULL, so this test can be simplifi=
ed.
> > That's wrong. If CONFIG_PINCTRL is disabled devm_pinctrl_get returns
> > NULL. But I think this shouldn't be considered an error, so your change
> > is right, just the commit log is not.
> With that said, in fact, I think that the test is correct as is.
> If CONFIG_PINCTRL is disabled, we will display an info about a missing
> functionality, but would still continue normally without it (i.e. return
> PTR_ERR(NULL) =3D 0 =3D success), as stated in the comment in front of
> 'i2c_imx_init_recovery_info':
>     "These alternative pinmux settings can be described in the device tree
> by
>      a separate pinctrl state "gpio". If this is missing this is not a big
>      problem, the only implication is that we can't do bus recovery."
>=20
> So, I won't propose any v2 patch with an updated commit log.
> Feel free to update it yourself and apply it if you don't share my analys=
is
> above.

Then the only issue (maybe?) is that the driver makes use of
PTR_ERR(NULL) =3D 0 which I'm not sure is explicitly allowed.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
