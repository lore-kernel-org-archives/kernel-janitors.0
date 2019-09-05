From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 05 Sep 2019 13:04:06 +0000
Subject: Re: [PATCH] led: triggers: Fix NULL dereference in led_trigger_set() error handling
Message-Id: <20190905130406.GE3093@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190905095728.GA26005@mwanda>
 <20190905120626.hyegecmy6hf5lvhj@pengutronix.de>
In-Reply-To: <20190905120626.hyegecmy6hf5lvhj@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Sep 05, 2019 at 02:06:26PM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> On Thu, Sep 05, 2019 at 12:57:28PM +0300, Dan Carpenter wrote:
> > The problem is we set "led_cdev->trigger =3D NULL;" and then dereference
> > it when we call write_lock_irqsave():
> >=20
> > 	write_lock_irqsave(&led_cdev->trigger->leddev_list_lock, flags);
> >                             ^^^^^^^^^^^^^^^^^
> >=20
> > Fixes: 2282e125a406 ("leds: triggers: let struct led_trigger::activate(=
) return an error code")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> Obviously right. Thanks for catching.
>=20
> Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Did you find this at runtime or by using some static checker?

Yes.  It's a new one that I'm working on.

It's a tricky thing because it turns out Smatch thinks a whole lot of
pointers are definitely NULL when they aren't.  For example, if the
struct is allocated with kzalloc() and Smatch doesn't see where the
pointer is assigned.

regards,
dan carpenter
