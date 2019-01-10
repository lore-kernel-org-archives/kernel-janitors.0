From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=  <u.kleine-koenig@pengutronix.de>
Date: Thu, 10 Jan 2019 10:18:18 +0000
Subject: Re: [PATCH] pwm: imx: Signedness bug in imx_pwm_get_state()
Message-Id: <20190110101818.msnvtpw6yczpeybc@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190109082747.GA5476@kadam>
In-Reply-To: <20190109082747.GA5476@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Wed, Jan 09, 2019 at 11:27:47AM +0300, Dan Carpenter wrote:
> "ret" only holds zero and negative error codes.  It needs to be signed
> for the error handling to work.
>=20
> Fixes: 9f4c8f9607c3 ("pwm: imx: Add ipg clock operation")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

I would have expected a compiler warning but at least for me there is
none emitted. Hmm.

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

@Thierry: Given that this is a fix I assume you want to apply this patch
before my pwm-imx series (which is cleanup only). This will conflict for
sure with my driver splitting patch. Please tell me if/when I should
resend my series rebased on top of this patch.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
