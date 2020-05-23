From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=  <u.kleine-koenig@pengutronix.de>
Date: Sat, 23 May 2020 20:17:30 +0000
Subject: Re: [PATCH -next] pwm: pca9685: Remove set but not used variable 'pwm'
Message-Id: <20200523201730.o7y7pent4hjtgia3@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAGngYiVDCCjo6VKt660Uz5mbEGOBOZpcUWeRHWx_L=TapZgv_w@mail.gmail.com>
 <20190606151111.14237-1-TheSven73@gmail.com>
In-Reply-To: <20190606151111.14237-1-TheSven73@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Sven Van Asbroeck <thesven73@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, YueHaibing <yuehaibing@huawei.com>, Thierry Reding <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Jun 06, 2019 at 11:11:11AM -0400, Sven Van Asbroeck wrote:
> I was able to test the patch [1] exclusion mechanism without access to ac=
tual
> hardware - by giving it a dummy regmap. See patch below.
>=20
> Test cases (all via sysfs):
> 1. verify requested pwm cannot be requested as gpio
> 2. verify requested gpio cannot be requested as pwm
> 3. verify pwm "all LEDs" cannot be used if pwms/gpios in use
> 4. verify pwms/gpios cannot be requested if pwm "all LEDs" in use
>=20
> All test cases ok.
>  Obviously, I could not test multi-threaded correctness.
>=20
> [1] https://lkml.org/lkml/2019/6/4/1039

Is this patch still relevant? A patch similar to YueHaibing's one was
merged in the meantime but I guess the underlying problem is still
relevant. Sven, do you care enough to recheck and create a patch on top
of a more recent tree?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
