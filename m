From: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>
Date: Fri, 21 Feb 2020 14:54:43 +0000
Subject: Re: [PATCH] gpio: siox: use raw spinlock for irq related locking
Message-Id: <e5ceaec1-edaf-f039-f4c1-8a4cf27df6fe@kleine-koenig.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="eXuhYJQwEGxsabst4nQyMNwROx5MXEYLG"
List-Id: <kernel-janitors.vger.kernel.org>
References: <87d0al4600.fsf@nanos.tec.linutronix.de>
 <20200211135121.15752-1-uwe@kleine-koenig.org>
 <CACRpkdYXBn+30HJWU7rbvfkgmwxxiRs7k3H9KWNb-X1WLEgt4w@mail.gmail.com>
In-Reply-To: <CACRpkdYXBn+30HJWU7rbvfkgmwxxiRs7k3H9KWNb-X1WLEgt4w@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Thorsten Scherer <t.scherer@eckelmann.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Thomas Gleixner <tglx@linutronix.de>, Dan Carpenter <dan.carpenter@oracle.com>, kernel-janitors@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--eXuhYJQwEGxsabst4nQyMNwROx5MXEYLG
Content-Type: multipart/mixed; boundary="jAO6r4hM7yb6opjeKNvChGl3fB1QD3xzG";
 protected-headers="v1"
From: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Thorsten Scherer <t.scherer@eckelmann.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Dan Carpenter <dan.carpenter@oracle.com>, kernel-janitors@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Message-ID: <e5ceaec1-edaf-f039-f4c1-8a4cf27df6fe@kleine-koenig.org>
Subject: Re: [PATCH] gpio: siox: use raw spinlock for irq related locking
References: <87d0al4600.fsf@nanos.tec.linutronix.de>
 <20200211135121.15752-1-uwe@kleine-koenig.org>
 <CACRpkdYXBn+30HJWU7rbvfkgmwxxiRs7k3H9KWNb-X1WLEgt4w@mail.gmail.com>
In-Reply-To: <CACRpkdYXBn+30HJWU7rbvfkgmwxxiRs7k3H9KWNb-X1WLEgt4w@mail.gmail.com>

--jAO6r4hM7yb6opjeKNvChGl3fB1QD3xzG
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2/21/20 2:52 PM, Linus Walleij wrote:
> On Tue, Feb 11, 2020 at 2:59 PM Uwe Kleine-K=C3=B6nig <uwe@kleine-koeni=
g.org> wrote:
>=20
>> All the irq related callbacks are called with the (raw) spinlock
>> desc->lock being held. So the lock here must be raw as well. Also irqs=

>> were already disabled by the caller for the irq chip callbacks, so the=

>> non-irq variants of spin_lock must be used there.
>>
>> Fixes: be8c8facc707 ("gpio: new driver to work with a 8x12 siox")
>> Signed-off-by: Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org>
>=20
> Patch applied. Is this a regression so I should put it in fixes?
> I put it for v5.7 for now but I can easily change that.

I don't care much. AFAIK siox is only used at Eckelmann and we will have
to deploy the fix there anyhow. Conceptually the conversion to raw is
only relevant for RT (please correct me if I'm wrong), but too early
enablement of irqs probably can yield bad races.

Best regards
Uwe


--jAO6r4hM7yb6opjeKNvChGl3fB1QD3xzG--

--eXuhYJQwEGxsabst4nQyMNwROx5MXEYLG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl5P7zcACgkQwfwUeK3K
7An5lQf+MOWHqgxmuf4I47HedK4AozSY0QlIGDg3IAxofKZXo8K8Q/PDALx+5iPR
9h4GzrbHiF0hut7xtyaclTy3oVDWGK1PDI7AI3EWAIcoe8cxs2LDFsNwFk/SOzMw
o3Hzvptp8qPe5LV6Kb2LpPR4eSI++D3u7ywQl+lbkWfFBjQay8xsuE8VuCPJ6AGo
DyJ3I8xVqxW0I87zPEnynBn4TrP8QfyyFI4RRU2HHT5AblZdaccTlLUFlvGVy2Jr
U/cwfrNGXMci1Z9NN05vAK+4ho/jqnRQWy93rLgkX6sQKl2tKYTZj3NQrikgGOoZ
iD6atp9fWNDt7y6hH+IHawrPN6gxAw==
=SVfp
-----END PGP SIGNATURE-----

--eXuhYJQwEGxsabst4nQyMNwROx5MXEYLG--
