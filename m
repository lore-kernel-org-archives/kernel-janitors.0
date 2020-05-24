From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=  <u.kleine-koenig@pengutronix.de>
Date: Sun, 24 May 2020 10:21:19 +0000
Subject: Re: [PATCH -next] pwm: pca9685: Remove set but not used variable 'pwm'
Message-Id: <20200524102119.2fzcl7bqu6qh3w5g@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAGngYiVDCCjo6VKt660Uz5mbEGOBOZpcUWeRHWx_L=TapZgv_w@mail.gmail.com>
 <20190606151111.14237-1-TheSven73@gmail.com>
 <20200523201730.o7y7pent4hjtgia3@pengutronix.de>
 <CAGngYiWCT=_H+PwXRTgMWRpwRWMrgvA3vD1is2r704oZn14LiA@mail.gmail.com>
In-Reply-To: <CAGngYiWCT=_H+PwXRTgMWRpwRWMrgvA3vD1is2r704oZn14LiA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Sven Van Asbroeck <thesven73@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, YueHaibing <yuehaibing@huawei.com>, Thierry Reding <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sat, May 23, 2020 at 08:24:23PM -0400, Sven Van Asbroeck wrote:
> Hi Uwe,
>=20
> On Sat, May 23, 2020 at 4:17 PM Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > Is this patch still relevant?
>=20
> A slightly different version of this patch has already landed in
> mainline. Clemens Gruber had
> relevant hardware available, and was able to test it out.
>=20
> See Linus's tree here:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/drivers/pwm/pwm-pca9685.c?h=3Dv5.7-rc6&id=9Cc5f232a4b6a0ef6e9b57876d61b88f=
61bdd7c2

Optimal, thanks for the feedback. So this thread can be closed.

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
