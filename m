From: Antti Palosaari <crope@iki.fi>
Date: Sun, 26 Aug 2012 16:21:24 +0000
Subject: Re: [PATCH] drivers/media/dvb-frontends/rtl2830.c: correct double assignment
Message-Id: <503A4D04.2050303@iki.fi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1345997751-340-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1345997751-340-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, awalls@md.metrocast.net

On 08/26/2012 07:15 PM, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>
> The double assignment is meant to be a bit-or to combine two values.
>
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @@
> expression i;
> @@
>
> *i = ...;
>   i = ...;
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
> ---
>   drivers/media/dvb-frontends/rtl2830.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/dvb-frontends/rtl2830.c b/drivers/media/dvb-frontends/rtl2830.c
> index 8fa8b08..b6ab858 100644
> --- a/drivers/media/dvb-frontends/rtl2830.c
> +++ b/drivers/media/dvb-frontends/rtl2830.c
> @@ -254,7 +254,7 @@ static int rtl2830_init(struct dvb_frontend *fe)
>   		goto err;
>
>   	buf[0] = tmp << 6;
> -	buf[0] = (if_ctl >> 16) & 0x3f;
> +	buf[0] |= (if_ctl >> 16) & 0x3f;
>   	buf[1] = (if_ctl >>  8) & 0xff;
>   	buf[2] = (if_ctl >>  0) & 0xff;
>
>
Thank you!

Acked-by: Antti Palosaari <crope@iki.fi>
Reviewed-by: Antti Palosaari <crope@iki.fi>


Antti
-- 
http://palosaari.fi/
