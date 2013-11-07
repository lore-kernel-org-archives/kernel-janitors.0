From: Ian Abbott <abbotti@mev.co.uk>
Date: Thu, 07 Nov 2013 10:34:49 +0000
Subject: Re: [patch] Staging: comedi: pcl730: fix some bitwise vs logical AND bugs
Message-Id: <527B6CC9.7020401@mev.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131107081300.GT21844@elgon.mountain>
In-Reply-To: <20131107081300.GT21844@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2013-11-07 08:13, Dan Carpenter wrote:
> These conditions are never true because they use bitwise AND instead of
> logical ands.
>
> Fixes: b3ff824a81e8 ('staging: comedi: drivers: use comedi_dio_update_state() for complex cases')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/staging/comedi/drivers/pcl730.c b/drivers/staging/comedi/drivers/pcl730.c
> index d041b71..2baaf1d 100644
> --- a/drivers/staging/comedi/drivers/pcl730.c
> +++ b/drivers/staging/comedi/drivers/pcl730.c
> @@ -173,11 +173,11 @@ static int pcl730_do_insn_bits(struct comedi_device *dev,
>   	if (mask) {
>   		if (mask & 0x00ff)
>   			outb(s->state & 0xff, dev->iobase + reg);
> -		if ((mask & 0xff00) & (s->n_chan > 8))
> +		if ((mask & 0xff00) && (s->n_chan > 8))
>   			outb((s->state >> 8) & 0xff, dev->iobase + reg + 1);
> -		if ((mask & 0xff0000) & (s->n_chan > 16))
> +		if ((mask & 0xff0000) && (s->n_chan > 16))
>   			outb((s->state >> 16) & 0xff, dev->iobase + reg + 2);
> -		if ((mask & 0xff000000) & (s->n_chan > 24))
> +		if ((mask & 0xff000000) && (s->n_chan > 24))
>   			outb((s->state >> 24) & 0xff, dev->iobase + reg + 3);
>   	}
>
>

Acked-by: Ian Abbott <abbotti@mev.co.uk>

-- 
-=( Ian Abbott @ MEV Ltd.    E-mail: <abbotti@mev.co.uk>        )=-
-=( Tel: +44 (0)161 477 1898   FAX: +44 (0)161 718 3587         )=-
