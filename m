From: Antti Palosaari <crope@iki.fi>
Date: Fri, 07 Sep 2012 16:00:50 +0000
Subject: Re: [PATCH 9/10] drivers/media/dvb-frontends/tda10071.c: removes unnecessary semicolon
Message-Id: <504A1A32.1010005@iki.fi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1347031488-26598-5-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1347031488-26598-5-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, kernel-janitors@vger.kernel.org, Julia.Lawall@lip6.fr, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

On 09/07/2012 06:24 PM, Peter Senna Tschudin wrote:
> From: Peter Senna Tschudin <peter.senna@gmail.com>
>
> removes unnecessary semicolon
>
> Found by Coccinelle: http://coccinelle.lip6.fr/
>
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
>
> ---
>   drivers/media/dvb-frontends/tda10071.c |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff -u -p a/drivers/media/dvb-frontends/tda10071.c b/drivers/media/dvb-frontends/tda10071.c
> --- a/drivers/media/dvb-frontends/tda10071.c
> +++ b/drivers/media/dvb-frontends/tda10071.c
> @@ -257,7 +257,7 @@ static int tda10071_set_voltage(struct d
>   				__func__);
>   		ret = -EINVAL;
>   		goto error;
> -	};
> +	}
>
>   	cmd.args[0] = CMD_LNB_SET_DC_LEVEL;
>   	cmd.args[1] = 0;
> @@ -369,7 +369,7 @@ static int tda10071_diseqc_recv_slave_re
>   	if (ret)
>   		goto error;
>
> -	reply->msg_len = tmp & 0x1f; /* [4:0] */;
> +	reply->msg_len = tmp & 0x1f; /* [4:0] */
>   	if (reply->msg_len > sizeof(reply->msg))
>   		reply->msg_len = sizeof(reply->msg); /* truncate API max */
>
>

Acked-by: Antti Palosaari <crope@iki.fi>

Antti
-- 
http://palosaari.fi/
