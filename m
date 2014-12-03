From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 03 Dec 2014 05:56:15 +0000
Subject: Re: [patch] Input: lm8323 - missing error check in lm8323_set_disable()
Message-Id: <20141203055615.GC7411@dtor-glaptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141202211710.GA19955@mwanda>
In-Reply-To: <20141202211710.GA19955@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jingoo Han <jg1.han@samsung.com>, Fugang Duan <B38611@freescale.com>, Johan Hovold <johan@kernel.org>, Bryan Wu <cooloney@gmail.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Dec 03, 2014 at 12:17:10AM +0300, Dan Carpenter wrote:
> The missing error handling here is not especially harmful but static
> checkers complain that "i" can be used uninitialized.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thank you.

> 
> diff --git a/drivers/input/keyboard/lm8323.c b/drivers/input/keyboard/lm8323.c
> index cb32e2b..21bea52 100644
> --- a/drivers/input/keyboard/lm8323.c
> +++ b/drivers/input/keyboard/lm8323.c
> @@ -616,6 +616,8 @@ static ssize_t lm8323_set_disable(struct device *dev,
>  	unsigned int i;
>  
>  	ret = kstrtouint(buf, 10, &i);
> +	if (ret)
> +		return ret;
>  
>  	mutex_lock(&lm->lock);
>  	lm->kp_enabled = !i;

-- 
Dmitry
