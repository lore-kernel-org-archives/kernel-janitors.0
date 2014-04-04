From: walter harms <wharms@bfs.de>
Date: Fri, 04 Apr 2014 12:39:13 +0000
Subject: Re: [PATCH] staging: comedi: drivers: pcl812.c: fixed a coding style issue
Message-Id: <533EA7F1.2050209@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1396605929-10514-1-git-send-email-gmate.amit@gmail.com>
In-Reply-To: <1396605929-10514-1-git-send-email-gmate.amit@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kumar Amit Mehta <gmate.amit@gmail.com>
Cc: abbotti@mev.co.uk, hsweeten@visionengravers.com, gregkh@linuxfoundation.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



Am 04.04.2014 12:05, schrieb Kumar Amit Mehta:
> Fixed a coding style issue. Reported by checkpatch.pl
> 
> Signed-off-by: Kumar Amit Mehta <gmate.amit@gmail.com>
> ---
>  drivers/staging/comedi/drivers/pcl812.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/comedi/drivers/pcl812.c b/drivers/staging/comedi/drivers/pcl812.c
> index 160eac8..5cc01fe 100644
> --- a/drivers/staging/comedi/drivers/pcl812.c
> +++ b/drivers/staging/comedi/drivers/pcl812.c
> @@ -811,8 +811,9 @@ static int pcl812_ai_cmd(struct comedi_device *dev, struct comedi_subdevice *s)
>  				devpriv->ai_dma = 0;
>  				break;
>  			}
> -	} else
> +	} else {
>  		devpriv->ai_dma = 0;
> +	}
>  
>  	devpriv->ai_act_scan = 0;
>  	devpriv->ai_poll_ptr = 0;

hi Kumar,
is that else needed at all ? perhaps it is possible to devpriv->ai_dma=0 before the if ?
That would reduce code and give a better readability.

re,
 wh

