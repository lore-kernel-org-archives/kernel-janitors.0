From: john stultz <johnstul@us.ibm.com>
Date: Wed, 21 Apr 2010 21:35:21 +0000
Subject: Re: [PATCH 1/2] arch/avr32: Fix build failure caused by typo
Message-Id: <1271885721.3231.1.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201004212318.23909.PeterHuewe@gmx.de>
In-Reply-To: <201004212318.23909.PeterHuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Peter =?ISO-8859-1?Q?H=FCwe?= <PeterHuewe@gmx.de>
Cc: Haavard Skinnemoen <hskinnemoen@atmel.com>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 2010-04-21 at 23:18 +0200, Peter H=C3=BCwe wrote:
> From: Peter Huewe <peterhuewe@gmx.de>
>=20
> This little patch fixes a build failure[1] caused by a typo.
>=20
> Patch against linux-next20100421
>=20
> References:
> [1]http://kisskb.ellerman.id.au/kisskb/buildresult/2448162/
>=20
> Signed-off-by: Peter Huewe <peterhuewe@gmx.de>

Ah! Sorry about that. Thanks so much for catching this!
-john


> ---
>  arch/avr32/kernel/time.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/arch/avr32/kernel/time.c b/arch/avr32/kernel/time.c
> index a047d69..668ed28 100644
> --- a/arch/avr32/kernel/time.c
> +++ b/arch/avr32/kernel/time.c
> @@ -112,7 +112,7 @@ static struct clock_event_device comparator =3D {
>=20
>  void read_persistent_clock(struct timespec *ts)
>  {
> -	ts->tv.sec =3D mktime(2007, 1, 1, 0, 0, 0);
> +	ts->tv_sec =3D mktime(2007, 1, 1, 0, 0, 0);
>  	ts->tv_nsec =3D 0;
>  }
>=20


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
