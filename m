From: Antti Palosaari <crope@iki.fi>
Date: Thu, 30 Jan 2014 14:46:42 +0000
Subject: Re: [patch] [media] tda10071: remove a duplicative test
Message-Id: <52EA65D2.90604@iki.fi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140130120034.GA13267@elgon.mountain>
In-Reply-To: <20140130120034.GA13267@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mauro Carvalho Chehab <m.chehab@samsung.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Acked-by: Antti Palosaari <crope@iki.fi>
Reviewed-by: Antti Palosaari <crope@iki.fi>

I will query that to the kernel 3.15.

thanks
Antti

On 30.01.2014 14:00, Dan Carpenter wrote:
> "ret" is an error code here, we already tested that.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/media/dvb-frontends/tda10071.c b/drivers/media/dvb-frontends/tda10071.c
> index 8ad3a57cf640..a76df29c4973 100644
> --- a/drivers/media/dvb-frontends/tda10071.c
> +++ b/drivers/media/dvb-frontends/tda10071.c
> @@ -1006,8 +1006,7 @@ static int tda10071_init(struct dvb_frontend *fe)
>   				dev_err(&priv->i2c->dev, "%s: firmware " \
>   						"download failed=%d\n",
>   						KBUILD_MODNAME, ret);
> -				if (ret)
> -					goto error_release_firmware;
> +				goto error_release_firmware;
>   			}
>   		}
>   		release_firmware(fw);
> --
> To unsubscribe from this list: send the line "unsubscribe linux-media" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


-- 
http://palosaari.fi/
