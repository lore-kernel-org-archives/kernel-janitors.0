From: Ian Abbott <abbotti@mev.co.uk>
Date: Wed, 21 Aug 2013 10:44:01 +0000
Subject: Re: [patch] staging: comedi: pcl812: missing break statement
Message-Id: <521499F1.40709@mev.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130821082804.GC5240@elgon.mountain>
In-Reply-To: <20130821082804.GC5240@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2013-08-21 09:28, Dan Carpenter wrote:
> Smatch complains that there is a missing break statement here.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This looks correct to me, but please double check.
>
> diff --git a/drivers/staging/comedi/drivers/pcl812.c b/drivers/staging/comedi/drivers/pcl812.c
> index 35251e7..03a0989 100644
> --- a/drivers/staging/comedi/drivers/pcl812.c
> +++ b/drivers/staging/comedi/drivers/pcl812.c
> @@ -1404,6 +1404,7 @@ no_dma:
>   		if (it->options[3] > 0)
>   						/*  we use external trigger */
>   			devpriv->use_ext_trg = 1;
> +		break;
>   	case boardA821:
>   		devpriv->max_812_ai_mode0_rangewait = 1;
>   		devpriv->mode_reg_int = (irq << 4) & 0xf0;
>

The missing break might be deliberate; I'll need to track down the 
manuals for the affected cards.  case boardACL8216 in the same switch 
also has no break.

-- 
-=( Ian Abbott @ MEV Ltd.    E-mail: <abbotti@mev.co.uk>        )=-
-=( Tel: +44 (0)161 477 1898   FAX: +44 (0)161 718 3587         )=-
