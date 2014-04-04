From: Joe Perches <joe@perches.com>
Date: Fri, 04 Apr 2014 15:28:07 +0000
Subject: Re: [PATCH] staging: comedi: drivers: pcl812.c: fixed a coding style issue
Message-Id: <1396625287.2863.4.camel@joe-AO722>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1396605929-10514-1-git-send-email-gmate.amit@gmail.com>
	 <20140404110707.GT6991@mwanda> <20140404114852.GA12452@gmail.com>
	 <20140404132651.GV6991@mwanda> <20140404151756.GA14330@gmail.com>
In-Reply-To: <20140404151756.GA14330@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kumar Amit Mehta <gmate.amit@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, abbotti@mev.co.uk, hsweeten@visionengravers.com, wharms@bfs.de, gregkh@linuxfoundation.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 2014-04-04 at 18:17 +0300, Kumar Amit Mehta wrote:
> What Walter mentioned also makes sense, So shouldn't it be something
> like this:

I'm not Dan, but:

> [amit@localhost linux-next]$ git diff
> diff --git a/drivers/staging/comedi/drivers/pcl812.c
> b/drivers/staging/comedi/drivers/pcl812.c
> index 160eac8..552b696 100644
> --- a/drivers/staging/comedi/drivers/pcl812.c
> +++ b/drivers/staging/comedi/drivers/pcl812.c
> @@ -803,16 +803,14 @@ static int pcl812_ai_cmd(struct comedi_device
> *dev, struct comedi_subdevice *s)
>  
>         pcl812_ai_set_chan_range(dev, cmd->chanlist[0], 1);
>  
> +       devpriv->ai_dma = 0;
>         if (devpriv->dma) {     /*  check if we can use DMA transfer */
>                 devpriv->ai_dma = 1;
>                 for (i = 1; i < cmd->chanlist_len; i++)
>                         if (cmd->chanlist[0] != cmd->chanlist[i]) {
>                                 /*  we cann't use DMA :-( */
> -                               devpriv->ai_dma = 0;

No.

You enable unwanted DMA capability here.
There's a typo of can't too.

>                                 break;
>                         }
> -       } else
> -               devpriv->ai_dma = 0;

Otherwise, I suppose either style is OK.

