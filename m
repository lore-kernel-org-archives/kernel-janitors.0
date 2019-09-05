From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=  <u.kleine-koenig@pengutronix.de>
Date: Thu, 05 Sep 2019 12:06:26 +0000
Subject: Re: [PATCH] led: triggers: Fix NULL dereference in led_trigger_set() error handling
Message-Id: <20190905120626.hyegecmy6hf5lvhj@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190905095728.GA26005@mwanda>
In-Reply-To: <20190905095728.GA26005@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello,

On Thu, Sep 05, 2019 at 12:57:28PM +0300, Dan Carpenter wrote:
> The problem is we set "led_cdev->trigger =3D NULL;" and then dereference
> it when we call write_lock_irqsave():
>=20
> 	write_lock_irqsave(&led_cdev->trigger->leddev_list_lock, flags);
>                             ^^^^^^^^^^^^^^^^^
>=20
> Fixes: 2282e125a406 ("leds: triggers: let struct led_trigger::activate() =
return an error code")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Obviously right. Thanks for catching.

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Did you find this at runtime or by using some static checker?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
