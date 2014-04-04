From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 04 Apr 2014 15:32:58 +0000
Subject: Re: [PATCH] staging: comedi: drivers: pcl812.c: fixed a coding style issue
Message-Id: <20140404153258.GT18506@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1396605929-10514-1-git-send-email-gmate.amit@gmail.com>
 <20140404110707.GT6991@mwanda>
 <20140404114852.GA12452@gmail.com>
 <20140404132651.GV6991@mwanda>
 <20140404151756.GA14330@gmail.com>
In-Reply-To: <20140404151756.GA14330@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kumar Amit Mehta <gmate.amit@gmail.com>
Cc: abbotti@mev.co.uk, hsweeten@visionengravers.com, wharms@bfs.de, gregkh@linuxfoundation.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Apr 04, 2014 at 06:17:56PM +0300, Kumar Amit Mehta wrote:
> On Fri, Apr 04, 2014 at 04:26:51PM +0300, Dan Carpenter wrote:
> > On Fri, Apr 04, 2014 at 02:48:52PM +0300, Kumar Amit Mehta wrote:
> > > On Fri, Apr 04, 2014 at 02:07:07PM +0300, Dan Carpenter wrote:
> > > > On Fri, Apr 04, 2014 at 01:05:29PM +0300, Kumar Amit Mehta wrote:
> > > > > Fixed a coding style issue. Reported by checkpatch.pl
> > > > > 
> > > > 
> > > > It's better if the commit messages are more specific than this.
> > > 
> > > So, should I resend the patch with a more appropriate commit message ?
> > 
> > [PATCH] staging: comedi: drivers: pcl812.c: add curly braces for checkpatch
> > 
> > Kernel style is that if one side of the if else statement gets has curly
> > braces then both side should have them.
> 
> Dan, 
> 
> What Walter mentioned also makes sense, So shouldn't it be something
> like this:
> 
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

You'd still want this assignment.

>                                 break;
>                         }
> -       } else
> -               devpriv->ai_dma = 0;

regards,
dan carpenter

