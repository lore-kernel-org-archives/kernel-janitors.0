From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 27 Jun 2012 10:55:47 +0000
Subject: Re: [patch -resend] leds-lp5523: BUG() in error handling in probe()
Message-Id: <20120627105547.GD3007@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120627085800.GA3007@mwanda>
 <20120627091055.GW31212@elgon.mountain>
 <CAK5ve-J9CgB=uz-09=POPoygWvNs7k_R3tbZVAzi0VLKTpvOqA@mail.gmail.com>
In-Reply-To: <CAK5ve-J9CgB=uz-09=POPoygWvNs7k_R3tbZVAzi0VLKTpvOqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Bryan Wu <bryan.wu@canonical.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Matt Renzelmann <mjr@cs.wisc.edu>

On Wed, Jun 27, 2012 at 06:49:10PM +0800, Bryan Wu wrote:
> On Wed, Jun 27, 2012 at 5:10 PM, Dan Carpenter <dan.carpenter@oracle.com>=
 wrote:
> > Inside the error handling in lp5523_init_led(), there is a place that
> > calls to led_classdev_unregister(). =A0When we unregister the LED drive=
rs,
> > it tries to set the brightness to OFF. =A0In this driver setting the
> > brightness is done through a work queue and the work queue hasn't been
> > initialized yet.
> >
> > The result is that we trigger a WARN_ON() in the __queue_work().
> >
> > The fix is to move the INIT_WORK() in front of the call to
> > lp5523_init_led().
> >
>=20
> Thanks for resending this, I applied this in my for-next branch.
>=20
> > Matt Renzelmann found this using a bug finding tool.
>=20
> Just be curious, what's kind of the tool here?
>=20

Sorry I should have CC'd Matt on this.  I think it's something he
is working on at the University of Wisconsin.  That's all I know.

regards,
dan carpenter

> -Bryan
>=20
> >
> > Reported-by: Matt Renzelmann <mjr@cs.wisc.edu>
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > I don't have this hardware, so I can't test it. =A0I originally sent th=
is
> > on Fri, 13 Apr 2012, and that was before Bryan Wu took on the LED
> > subsystem. =A0Also when I sent it, the WARN_ON() in __queue_work() was
> > a BUG_ON() so I've updated the commit message.
> >
> > diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
> > index 857a3e1..e8a2712 100644
> > --- a/drivers/leds/leds-lp5523.c
> > +++ b/drivers/leds/leds-lp5523.c
> > @@ -943,6 +943,9 @@ static int __devinit lp5523_probe(struct i2c_client=
 *client,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (pdata->led_config[i].led_current =3D=
 0)
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0continue;
> >
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 INIT_WORK(&chip->leds[led].brightness_wor=
k,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 lp5523_led_brightness_wor=
k);
> > +
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D lp5523_init_led(&chip->leds[led]=
, &client->dev, i, pdata);
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ret) {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(&client->dev, "e=
rror initializing leds\n");
> > @@ -956,9 +959,6 @@ static int __devinit lp5523_probe(struct i2c_client=
 *client,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0LP5523_REG_LED_CURRE=
NT_BASE + chip->leds[led].chan_nr,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0chip->leds[led].led_=
current);
> >
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 INIT_WORK(&(chip->leds[led].brightness_wo=
rk),
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 lp5523_led_brightness_wor=
k);
> > -
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0led++;
> > =A0 =A0 =A0 =A0}
> >
>=20
>=20
>=20
> --=20
> Bryan Wu <bryan.wu@canonical.com>
> Kernel Developer =A0 =A0+86.186-168-78255 Mobile
> Canonical Ltd. =A0 =A0 =A0www.canonical.com
> Ubuntu - Linux for human beings | www.ubuntu.com
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
