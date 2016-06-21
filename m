From: Ian Abbott <abbotti@mev.co.uk>
Date: Tue, 21 Jun 2016 13:56:45 +0000
Subject: Re: [patch] staging: comedi: dt2811: fix a precedence bug
Message-Id: <af0db1a5-a13d-0d90-2e69-2e20b69db2f4@mev.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160621114621.GB16941@mwanda>
In-Reply-To: <20160621114621.GB16941@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 21/06/16 12:46, Dan Carpenter wrote:
> Bitwise | has higher precedence than ?: so we need to add some
> parenthesis for this to work as intended.
>
> Fixes: 7c9574090d30 ('staging: comedi: dt2811: simplify A/D reference configuration')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/staging/comedi/drivers/dt2811.c b/drivers/staging/comedi/drivers/dt2811.c
> index 904f6377..8bbd938 100644
> --- a/drivers/staging/comedi/drivers/dt2811.c
> +++ b/drivers/staging/comedi/drivers/dt2811.c
> @@ -588,8 +588,8 @@ static int dt2811_attach(struct comedi_device *dev, struct comedi_devconfig *it)
>  	s = &dev->subdevices[0];
>  	s->type		= COMEDI_SUBD_AI;
>  	s->subdev_flags	= SDF_READABLE |
> -			  (it->options[2] = 1) ? SDF_DIFF :
> -			  (it->options[2] = 2) ? SDF_COMMON : SDF_GROUND;
> +			  ((it->options[2] = 1) ? SDF_DIFF :
> +			   (it->options[2] = 2) ? SDF_COMMON : SDF_GROUND);
>  	s->n_chan	= (it->options[2] = 1) ? 8 : 16;
>  	s->maxdata	= 0x0fff;
>  	s->range_table	= board->is_pgh ? &dt2811_pgh_ai_ranges
>

Nice catch, thanks!

Reviewed-by: Ian Abbott <abbotti@mev.co.uk>

-- 
-=( Ian Abbott @ MEV Ltd.    E-mail: <abbotti@mev.co.uk> )=-
-=(                          Web: http://www.mev.co.uk/  )=-
