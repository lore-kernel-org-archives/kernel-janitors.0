From: Sven Van Asbroeck <thesven73@gmail.com>
Date: Sun, 24 May 2020 00:24:23 +0000
Subject: Re: [PATCH -next] pwm: pca9685: Remove set but not used variable 'pwm'
Message-Id: <CAGngYiWCT=_H+PwXRTgMWRpwRWMrgvA3vD1is2r704oZn14LiA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAGngYiVDCCjo6VKt660Uz5mbEGOBOZpcUWeRHWx_L=TapZgv_w@mail.gmail.com>
 <20190606151111.14237-1-TheSven73@gmail.com> <20200523201730.o7y7pent4hjtgia3@pengutronix.de>
In-Reply-To: <20200523201730.o7y7pent4hjtgia3@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, YueHaibing <yuehaibing@huawei.com>, Thierry Reding <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Uwe,

On Sat, May 23, 2020 at 4:17 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Is this patch still relevant?

A slightly different version of this patch has already landed in
mainline. Clemens Gruber had
relevant hardware available, and was able to test it out.

See Linus's tree here:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/d=
rivers/pwm/pwm-pca9685.c?h=3Dv5.7-rc6&id=3D9cc5f232a4b6a0ef6e9b57876d61b88f=
61bdd7c2

Have a great week-end,
Sven
