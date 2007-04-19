From: Jean Delvare <khali@linux-fr.org>
Date: Thu, 19 Apr 2007 07:33:27 +0000
Subject: Re: [KJ][PATCH] i2c: SPIN_LOCK_UNLOCKED cleanup
Message-Id: <20070419093327.7112d515@hyperion.delvare>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070419040557.GA14283@arun.site>
In-Reply-To: <20070419040557.GA14283@arun.site>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Milind Arun Choudhary <milindchoudhary@gmail.com>
Cc: Kernel Janitors <kernel-janitors@lists.osdl.org>, i2c <i2c@lm-sensors.org>, Andrw Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>

On Thu, 19 Apr 2007 09:35:58 +0530, Milind Arun Choudhary wrote:
> SPIN_LOCK_UNLOCKED cleanup,use __SPIN_LOCK_UNLOCKED instead 
> 
> Signed-off-by: Milind Arun Choudhary <milindchoudhary@gmail.com>
> 
> ---
>  i2c-pxa.c     |    2 +-
>  i2c-s3c2410.c |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
> index 14e83d0..d5d44ed 100644
> --- a/drivers/i2c/busses/i2c-pxa.c
> +++ b/drivers/i2c/busses/i2c-pxa.c
> @@ -825,7 +825,7 @@ static const struct i2c_algorithm i2c_pxa_algorithm = {
>  };
>  
>  static struct pxa_i2c i2c_pxa = {
> -	.lock	= SPIN_LOCK_UNLOCKED,
> +	.lock	= __SPIN_LOCK_UNLOCKED(i2c_pxa.lock),
>  	.adap	= {
>  		.owner		= THIS_MODULE,
>  		.algo		= &i2c_pxa_algorithm,
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
> index 556f244..3eb5958 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -570,7 +570,7 @@ static const struct i2c_algorithm s3c24xx_i2c_algorithm = {
>  };
>  
>  static struct s3c24xx_i2c s3c24xx_i2c = {
> -	.lock	= SPIN_LOCK_UNLOCKED,
> +	.lock	= __SPIN_LOCK_UNLOCKED(s3c24xx_i2c.lock),
>  	.wait	= __WAIT_QUEUE_HEAD_INITIALIZER(s3c24xx_i2c.wait),
>  	.adap	= {
>  		.name			= "s3c2410-i2c",
> 

Applied, thanks.

-- 
Jean Delvare
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
