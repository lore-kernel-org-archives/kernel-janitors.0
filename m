From: walter harms <wharms@bfs.de>
Date: Wed, 18 Jan 2012 17:06:46 +0000
Subject: Re: [patch 2/2] [media] ds3000: off by one in ds3000_read_snr()
Message-Id: <4F16FC26.80306@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120117073021.GB11358@elgon.mountain>
In-Reply-To: <20120117073021.GB11358@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, "Igor M. Liplianin" <liplianin@me.by>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



Am 17.01.2012 08:30, schrieb Dan Carpenter:
> This is a static checker patch and I don't have the hardware to test
> this, so please review it carefully.  The dvbs2_snr_tab[] array has 80
> elements so when we cap it at 80, that's off by one.  I would have
> assumed that the test was wrong but in the lines right before we have
> the same test but use "snr_reading - 1" as the array offset.  I've done
> the same thing here.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/media/dvb/frontends/ds3000.c b/drivers/media/dvb/frontends/ds3000.c
> index af65d01..3f5ae0a 100644
> --- a/drivers/media/dvb/frontends/ds3000.c
> +++ b/drivers/media/dvb/frontends/ds3000.c
> @@ -681,7 +681,7 @@ static int ds3000_read_snr(struct dvb_frontend *fe, u16 *snr)
>  			snr_reading = dvbs2_noise_reading / tmp;
>  			if (snr_reading > 80)
>  				snr_reading = 80;
> -			*snr = -(dvbs2_snr_tab[snr_reading] / 1000);
> +			*snr = -(dvbs2_snr_tab[snr_reading - 1] / 1000);
>  		}
>  		dprintk("%s: raw / cooked = 0x%02x / 0x%04x\n", __func__,
>  				snr_reading, *snr);

hi dan,

perhaps it is more useful to do it in the check above ?
thinking about that why not replace the number (80) with ARRAY_SIZE() ?

re,
 wh



