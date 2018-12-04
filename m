From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 04 Dec 2018 07:00:33 +0000
Subject: Re: [PATCH v2] ptp: fix an IS_ERR() vs NULL check
Message-Id: <20181204070033.GG3073@unbuntlaptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181130163252.e6z33t23j3qud57z@localhost>
 <20181203105506.GA21127@unbuntlaptop>
 <20181204044257.grk3na2wyrx6nssg@localhost>
In-Reply-To: <20181204044257.grk3na2wyrx6nssg@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Cochran <richardcochran@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>

Hi Greg,

I meant to CC you but I screwed up and added you to the From header
instead... :(

Why did you commit 3b1ad360acad ("pps: using ERR_PTR instead of NULL
while pps_register_source fails")?  You're not listed as a maintainer so
I wouldn't have known to CC you.

The back story is that the last chunk which changes drivers/ptp/ptp_clock.c
was dropped by mistake and it's not there in linux-next.  I wrote a
patch which adds it, but everyone is super confused now...  Here is
YueHaibing's original patch btw, for reference.
https://www.spinics.net/lists/netdev/msg535929.html

regards,
dan carpenter


On Mon, Dec 03, 2018 at 08:42:57PM -0800, Richard Cochran wrote:
> On Mon, Dec 03, 2018 at 01:55:06PM +0300, Dan Carpenter wrote:
> > We recently modified pps_register_source() to return error pointers
> > instead of NULL but this check wasn't updated.
> 
> But it *was* updated!
>  
> > Fixes: 3b1ad360acad ("pps: using ERR_PTR instead of NULL while pps_register_source fails")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > v2:  Use the correct Fixes tag.  Add Greg to the CC list, because he
> > is maintaining this driver.
> 
> What driver?  (I am maintaining drivers/ptp/ptp_clock.c)
>  
> >  drivers/ptp/ptp_clock.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/ptp/ptp_clock.c b/drivers/ptp/ptp_clock.c
> > index 8a81eecc0ecd..48f3594a7458 100644
> > --- a/drivers/ptp/ptp_clock.c
> > +++ b/drivers/ptp/ptp_clock.c
> > @@ -265,8 +265,8 @@ struct ptp_clock *ptp_clock_register(struct ptp_clock_info *info,
> >  		pps.mode = PTP_PPS_MODE;
> >  		pps.owner = info->owner;
> >  		ptp->pps_source = pps_register_source(&pps, PTP_PPS_DEFAULTS);
> > -		if (!ptp->pps_source) {
> > -			err = -EINVAL;
> > +		if (IS_ERR(ptp->pps_source)) {
> > +			err = PTR_ERR(ptp->pps_source);
> >  			pr_err("failed to register pps source\n");
> >  			goto no_pps;
> >  		}
> 
> YueHaibing's patch has the following hunk.  It really is already
> there.  I don't see it yet on Linus' master branch, but the patch
> should update drivers/pps/kapi.c and the callers all in one commit.
> 
> diff --git a/drivers/ptp/ptp_clock.c b/drivers/ptp/ptp_clock.c
> index 8a81eec..48f3594 100644
> --- a/drivers/ptp/ptp_clock.c
> +++ b/drivers/ptp/ptp_clock.c
> @@ -265,8 +265,8 @@ struct ptp_clock *ptp_clock_register(struct ptp_clock_info *info,
>  		pps.mode = PTP_PPS_MODE;
>  		pps.owner = info->owner;
>  		ptp->pps_source = pps_register_source(&pps, PTP_PPS_DEFAULTS);
> -		if (!ptp->pps_source) {
> -			err = -EINVAL;
> +		if (IS_ERR(ptp->pps_source)) {
> +			err = PTR_ERR(ptp->pps_source);
>  			pr_err("failed to register pps source\n");
>  			goto no_pps;
>  		}
> 
> Thanks,
> Richard
