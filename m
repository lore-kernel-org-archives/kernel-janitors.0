From: Antti Palosaari <crope@iki.fi>
Date: Fri, 22 Nov 2013 14:11:27 +0000
Subject: Re: [patch] [media] af9035: unlock on error in af9035_i2c_master_xfer()
Message-Id: <528F660F.9050100@iki.fi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131122075045.GA15726@elgon.mountain>
In-Reply-To: <20131122075045.GA15726@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mauro Carvalho Chehab <m.chehab@samsung.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Acked-by: Antti Palosaari <crope@iki.fi>

Antti

On 22.11.2013 09:50, Dan Carpenter wrote:
> We introduced a couple new error paths which are missing unlocks.
>
> Fixes: 7760e148350b ('[media] af9035: Don't use dynamic static allocation')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/media/usb/dvb-usb-v2/af9035.c b/drivers/media/usb/dvb-usb-v2/af9035.c
> index c8fcd78425bd..625ef2489b23 100644
> --- a/drivers/media/usb/dvb-usb-v2/af9035.c
> +++ b/drivers/media/usb/dvb-usb-v2/af9035.c
> @@ -245,7 +245,8 @@ static int af9035_i2c_master_xfer(struct i2c_adapter *adap,
>   				dev_warn(&d->udev->dev,
>   					 "%s: i2c xfer: len=%d is too big!\n",
>   					 KBUILD_MODNAME, msg[0].len);
> -				return -EOPNOTSUPP;
> +				ret = -EOPNOTSUPP;
> +				goto unlock;
>   			}
>   			req.mbox |= ((msg[0].addr & 0x80)  >>  3);
>   			buf[0] = msg[1].len;
> @@ -281,7 +282,8 @@ static int af9035_i2c_master_xfer(struct i2c_adapter *adap,
>   				dev_warn(&d->udev->dev,
>   					 "%s: i2c xfer: len=%d is too big!\n",
>   					 KBUILD_MODNAME, msg[0].len);
> -				return -EOPNOTSUPP;
> +				ret = -EOPNOTSUPP;
> +				goto unlock;
>   			}
>   			req.mbox |= ((msg[0].addr & 0x80)  >>  3);
>   			buf[0] = msg[0].len;
> @@ -319,6 +321,7 @@ static int af9035_i2c_master_xfer(struct i2c_adapter *adap,
>   		ret = -EOPNOTSUPP;
>   	}
>
> +unlock:
>   	mutex_unlock(&d->i2c_mutex);
>
>   	if (ret < 0)
>


-- 
http://palosaari.fi/
