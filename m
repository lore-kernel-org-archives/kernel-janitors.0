From: Ian Abbott <abbotti@mev.co.uk>
Date: Mon, 14 Jan 2013 10:11:56 +0000
Subject: Re: [patch] Staging: comedi: add a missing break statement
Message-Id: <50F3D9EC.6080007@mev.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130113200504.GD5907@elgon.mountain>
In-Reply-To: <20130113200504.GD5907@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2013-01-13 20:05, Dan Carpenter wrote:
> This is a static checker fix.  From the context it looks like there
> should be a break here.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Please review this carefully.  I think it's probably correct, but I'd
> appreciate an Ack from someone who knows comedi better.
>
> diff --git a/drivers/staging/comedi/drivers/ni_tiocmd.c b/drivers/staging/comedi/drivers/ni_tiocmd.c
> index 0c991b9..13747f3 100644
> --- a/drivers/staging/comedi/drivers/ni_tiocmd.c
> +++ b/drivers/staging/comedi/drivers/ni_tiocmd.c
> @@ -159,6 +159,7 @@ static int ni_tio_input_cmd(struct ni_gpct *counter, struct comedi_async *async)
>   		async->inttrig = NULL;
>   		mite_dma_arm(counter->mite_chan);
>   		retval = ni_tio_arm(counter, 1, cmd->start_arg);
> +		break;
>   	case TRIG_OTHER:
>   		async->inttrig = NULL;
>   		mite_dma_arm(counter->mite_chan);
>

Acked-by: Ian Abbott <abbotti@mev.co.uk>

-- 
-=( Ian Abbott @ MEV Ltd.    E-mail: <abbotti@mev.co.uk>        )=-
-=( Tel: +44 (0)161 477 1898   FAX: +44 (0)161 718 3587         )=-
