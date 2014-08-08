From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 08 Aug 2014 17:03:32 +0000
Subject: Re: [PATCH 1/1] dpt_i2o: delete unnecessary null test on array
Message-Id: <alpine.DEB.2.10.1408081902400.2348@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1407321551-27479-1-git-send-email-Julia.Lawall@lip6.fr>  <1407321551-27479-2-git-send-email-Julia.Lawall@lip6.fr> <1407517179.2044.13.camel@jarvis.lan>
In-Reply-To: <1407517179.2044.13.camel@jarvis.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Adaptec OEM Raid Solutions <aacraid@adaptec.com>, kernel-janitors@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, joe@perches.com

> > diff --git a/drivers/scsi/dpt_i2o.c b/drivers/scsi/dpt_i2o.c
> > index 67283ef..62e276b 100644
> > --- a/drivers/scsi/dpt_i2o.c
> > +++ b/drivers/scsi/dpt_i2o.c
> > @@ -1169,11 +1169,6 @@ static struct adpt_device* adpt_find_device(adpt_hba* pHba, u32 chan, u32 id, u6
> >  	if(chan < 0 || chan >= MAX_CHANNEL)
> >  		return NULL;
> >
> > -	if( pHba->channel[chan].device = NULL){
> > -		printk(KERN_DEBUG"Adaptec I2O RAID: Trying to find device before they are allocated\n");
> > -		return NULL;
> > -	}
>
> dpt_i2o is always weirdly fun, but I think, based on the message, this
> check is supposed to be
>
> if( pHba->channel[chan].device[id] = NULL){
>
> Since device is an array of device pointers which are allocated by
> parsing data.

That seems to be already checked immediately below:

        d = pHba->channel[chan].device[id];
	if(!d || d->tid = 0) {
                return NULL;
        }

julia
