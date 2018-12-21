From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 21 Dec 2018 08:40:21 +0000
Subject: Re: [PATCH] Input: nomadik-ske-keypad - Fix a loop timeout test
Message-Id: <20181221084021.GF211587@dtor-ws>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181218081854.GC32567@kadam>
In-Reply-To: <20181218081854.GC32567@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Dec 18, 2018 at 11:18:54AM +0300, Dan Carpenter wrote:
> The loop exits with "timeout" set to -1 not to 0.
> 
> Fixes: 1158f0f16224 ("Input: add support for Nomadik SKE keypad controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thank you.

> ---
>  drivers/input/keyboard/nomadik-ske-keypad.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/keyboard/nomadik-ske-keypad.c b/drivers/input/keyboard/nomadik-ske-keypad.c
> index 8567ee47761e..ae3b04557074 100644
> --- a/drivers/input/keyboard/nomadik-ske-keypad.c
> +++ b/drivers/input/keyboard/nomadik-ske-keypad.c
> @@ -100,7 +100,7 @@ static int __init ske_keypad_chip_init(struct ske_keypad *keypad)
>  	while ((readl(keypad->reg_base + SKE_RIS) != 0x00000000) && timeout--)
>  		cpu_relax();
>  
> -	if (!timeout)
> +	if (timeout = -1)
>  		return -EINVAL;
>  
>  	/*
> -- 
> 2.17.1
> 

-- 
Dmitry
