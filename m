From: Sakari Ailus <sakari.ailus@iki.fi>
Date: Fri, 31 Aug 2018 12:42:21 +0000
Subject: Re: [PATCH] media: sr030pc30: inconsistent NULL checking in sr030pc30_base_config()
Message-Id: <20180831124221.3kuamslh4xw3vjt7@valkosipuli.retiisi.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180622111947.tormf7s7an5vj4lg@kili.mountain>
In-Reply-To: <20180622111947.tormf7s7an5vj4lg@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jun 22, 2018 at 02:19:48PM +0300, Dan Carpenter wrote:
> If info->pdata is NULL then we would oops on the next line.  And we can
> flip the "ret" test around and give up if a failure has already occured.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/media/i2c/sr030pc30.c b/drivers/media/i2c/sr030pc30.c
> index 2a4882cddc51..4ebd00198d34 100644
> --- a/drivers/media/i2c/sr030pc30.c
> +++ b/drivers/media/i2c/sr030pc30.c
> @@ -569,8 +569,8 @@ static int sr030pc30_base_config(struct v4l2_subdev *sd)
>  	if (!ret)
>  		ret = sr030pc30_pwr_ctrl(sd, false, false);
>  
> -	if (!ret && !info->pdata)
> -		return ret;
> +	if (ret || !info->pdata)
> +		return -EIO;

There seem to be a couple of other places checking pdata is not NULL,
including the driver's probe() function; doing the same here seems
redundant. Just checking ret and failing if it's non-zero should suffice:

if (ret)
	return ret;

Let me know if you'd like to respin; I can do that as well.

>  
>  	expmin = EXPOS_MIN_MS * info->pdata->clk_rate / (8 * 1000);
>  	expmax = EXPOS_MAX_MS * info->pdata->clk_rate / (8 * 1000);

-- 
Sakari Ailus
e-mail: sakari.ailus@iki.fi
