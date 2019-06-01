From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=  <u.kleine-koenig@pengutronix.de>
Date: Sat, 01 Jun 2019 16:04:59 +0000
Subject: Re: [PATCH -next] pwm: pca9685: Remove set but not used variable 'pwm'
Message-Id: <20190601160459.baedo5pp5hsrltzs@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190601035709.85379-1-yuehaibing@huawei.com>
 <CAGngYiXZM0QUdKE_zDK763J9iDuiKSbmFeTVA1PJ_4WvjntjQQ@mail.gmail.com>
In-Reply-To: <CAGngYiXZM0QUdKE_zDK763J9iDuiKSbmFeTVA1PJ_4WvjntjQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Sven Van Asbroeck <thesven73@gmail.com>
Cc: YueHaibing <yuehaibing@huawei.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Thierry Reding <thierry.reding@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-pwm@vger.kernel.org, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hello Sven,

On Sat, Jun 01, 2019 at 09:03:09AM -0400, Sven Van Asbroeck wrote:
> Hi YueHaibing,
>=20
> On Fri, May 31, 2019 at 11:49 PM YueHaibing <yuehaibing@huawei.com> wrote:
> >
> >         mutex_lock(&pca->lock);
> > -       pwm =3D &pca->chip.pwms[offset];
> >         mutex_unlock(&pca->lock);
>=20
> Thanks for noticing this issue. However it should be fixed differently.
>=20
> This was introduced by Uwe's clean-up patch:
> commit e926b12c611c2095c79 ("pwm: Clear chip_data in pwm_put()")
>=20
> But Uwe did not realize that in this case, the pwm chip_data is used as a
> synchronization mechanism between pwm and gpio. Moving the chip_data
> clear out of the mutex breaks this mechanism.

>=20
> I think the following would restore the mechanism:
>=20
> >         mutex_lock(&pca->lock);
> >        pwm =3D &pca->chip.pwms[offset];
> > +     pwm_set_chip_data(pwm, NULL);
> >         mutex_unlock(&pca->lock);

I didn't look into the driver to try to understand that, but the
definitely needs a comment to explain for the next person to think they
can do a cleanup here.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
