From: Joe Perches <joe@perches.com>
Date: Sat, 24 May 2014 19:10:48 +0000
Subject: Re: [PATCH] msi3103: Use time_before_eq()
Message-Id: <1400958648.22191.3.camel@joe-AO725>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400957276-13222-1-git-send-email-manuel.schoelling@gmx.de>
In-Reply-To: <1400957276-13222-1-git-send-email-manuel.schoelling@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Manuel =?ISO-8859-1?Q?Sch=F6lling?= <manuel.schoelling@gmx.de>
Cc: crope@iki.fi, m.chehab@samsung.com, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 2014-05-24 at 20:47 +0200, Manuel Sch=F6lling wrote:
> To be future-proof and for better readability the time comparisons are
> modified to use time_before_eq() instead of plain, error-prone math.

A couple of unrelated, trivial notes: (repeated a few times)

> diff --git a/drivers/staging/media/msi3101/sdr-msi3101.c b/drivers/stagin=
g/media/msi3101/sdr-msi3101.c
[]
> @@ -208,7 +208,7 @@ static int msi3101_convert_stream_504(struct msi3101_=
state *s, u8 *dst,
>  	}
> =20
>  	/* calculate samping rate and output it in 10 seconds intervals */

s/samping/sampling/

> -	if ((s->jiffies_next + msecs_to_jiffies(10000)) <=3D jiffies) {
> +	if (time_before_eq(s->jiffies_next + 10 * HZ, jiffies)) {
>  		unsigned long jiffies_now =3D jiffies;
>  		unsigned long msecs =3D jiffies_to_msecs(jiffies_now) - jiffies_to_mse=
cs(s->jiffies_next);

Perhaps better to subtract then convert
instead of convert twice then subtract.


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
