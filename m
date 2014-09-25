From: Shuah Khan <shuahkh@osg.samsung.com>
Date: Thu, 25 Sep 2014 14:00:34 +0000
Subject: Re: [patch] [media] xc5000: use after free in release()
Message-Id: <54242002.8020408@osg.samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140925114008.GC3708@mwanda>
In-Reply-To: <20140925114008.GC3708@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Mauro Carvalho Chehab <m.chehab@samsung.com>, Shuah Khan <shuah.kh@samsung.com>
Cc: Fabian Frederick <fabf@skynet.be>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org, Shuah Khan <shuahkh@osg.samsung.com>

On 09/25/2014 05:40 AM, Dan Carpenter wrote:
> I moved the call to hybrid_tuner_release_state(priv) after
> "priv->firmware" dereference.
> 
> Fixes: 5264a522a597 ('[media] media: tuner xc5000 - release firmwware from xc5000_release()')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/media/tuners/xc5000.c b/drivers/media/tuners/xc5000.c
> index e44c8ab..803a0e6 100644
> --- a/drivers/media/tuners/xc5000.c
> +++ b/drivers/media/tuners/xc5000.c
> @@ -1333,9 +1333,9 @@ static int xc5000_release(struct dvb_frontend *fe)
>  
>  	if (priv) {
>  		cancel_delayed_work(&priv->timer_sleep);
> -		hybrid_tuner_release_state(priv);
>  		if (priv->firmware)
>  			release_firmware(priv->firmware);
> +		hybrid_tuner_release_state(priv);
>  	}
>  
>  	mutex_unlock(&xc5000_list_mutex);
> 

Thanks for catching it.

Reviewed-by: Shuah Khan <shuahkh@osg.samsung.com>

-- Shuah

-- 
Shuah Khan
Sr. Linux Kernel Developer
Samsung Research America (Silicon Valley)
shuahkh@osg.samsung.com | (970) 217-8978
