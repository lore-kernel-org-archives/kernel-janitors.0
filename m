From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 03 Jul 2013 03:37:54 +0000
Subject: Re: [patch 1/3] Input: cyttsp4 - silence shift wrap warning
Message-Id: <20130703033754.GB13118@core.coreip.homeip.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130702214019.GA1598@elgon.mountain>
In-Reply-To: <20130702214019.GA1598@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Javier Martinez Canillas <javier@dowhile0.org>, Ferruh Yigit <fery@cypress.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jul 03, 2013 at 12:40:19AM +0300, Dan Carpenter wrote:
> "*max" is a size_t (long) type but "1" is an int so static checkers
> complain that the shift could wrap.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied all 3, thank you Dan.

> 
> diff --git a/drivers/input/touchscreen/cyttsp4_core.c b/drivers/input/touchscreen/cyttsp4_core.c
> index 963da05..7aa4a34 100644
> --- a/drivers/input/touchscreen/cyttsp4_core.c
> +++ b/drivers/input/touchscreen/cyttsp4_core.c
> @@ -153,7 +153,7 @@ static int cyttsp4_hw_reset(struct cyttsp4 *cd)
>   */
>  static int cyttsp4_bits_2_bytes(unsigned int nbits, size_t *max)
>  {
> -	*max = 1 << nbits;
> +	*max = 1UL << nbits;
>  	return (nbits + 7) / 8;
>  }
>  

-- 
Dmitry
