From: Hans-Frieder Vogt <hfvogt@gmx.net>
Date: Sat, 28 Sep 2013 09:39:47 +0000
Subject: Re: [PATCH 05/19] media: Change variable type to bool
Message-Id: <12218816.0kAuduDdYP@maximilian>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1379802471-30252-1-git-send-email-peter.senna@gmail.com> <1379802471-30252-5-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1379802471-30252-5-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: m.chehab@samsung.com, crope@iki.fi, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Am Sonntag, 22. September 2013, 00:27:37 schrieb Peter Senna Tschudin:
> The variable vco_select is only assigned the values true and false.
> Change its type to bool.
> 
> The simplified semantic patch that find this problem is as
> follows (http://coccinelle.lip6.fr/):
> 
> @exists@
> type T;
> identifier b;
> @@
> - T
> + bool
>   b = ...;
>   ... when any
>   b = \(true\|false\)
> 
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
> ---
>  drivers/media/tuners/fc0012.c | 2 +-
>  drivers/media/tuners/fc0013.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/tuners/fc0012.c b/drivers/media/tuners/fc0012.c
> index f4d0e79..d74e920 100644
> --- a/drivers/media/tuners/fc0012.c
> +++ b/drivers/media/tuners/fc0012.c
> @@ -139,7 +139,7 @@ static int fc0012_set_params(struct dvb_frontend *fe)
>  	unsigned char reg[7], am, pm, multi, tmp;
>  	unsigned long f_vco;
>  	unsigned short xtal_freq_khz_2, xin, xdiv;
> -	int vco_select = false;
> +	bool vco_select = false;
> 
>  	if (fe->callback) {
>  		ret = fe->callback(priv->i2c, DVB_FRONTEND_COMPONENT_TUNER,
> diff --git a/drivers/media/tuners/fc0013.c b/drivers/media/tuners/fc0013.c
> index bd8f0f1..b416231 100644
> --- a/drivers/media/tuners/fc0013.c
> +++ b/drivers/media/tuners/fc0013.c
> @@ -233,7 +233,7 @@ static int fc0013_set_params(struct dvb_frontend *fe)
>  	unsigned char reg[7], am, pm, multi, tmp;
>  	unsigned long f_vco;
>  	unsigned short xtal_freq_khz_2, xin, xdiv;
> -	int vco_select = false;
> +	bool vco_select = false;
> 
>  	if (fe->callback) {
>  		ret = fe->callback(priv->i2c, DVB_FRONTEND_COMPONENT_TUNER,

Acked-by: Hans-Frieder Vogt <hfvogt@gmx.net>

Hans-Frieder Vogt                       e-mail: hfvogt <at> gmx .dot. net

