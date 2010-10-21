From: Dan Carpenter <error27@gmail.com>
Date: Thu, 21 Oct 2010 18:01:04 +0000
Subject: Re: [patch 2/3] Staging: sst: more dereferencing user pointers
Message-Id: <20101021180104.GG5985@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101019055704.GD5839@bicker>
In-Reply-To: <20101019055704.GD5839@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Oct 21, 2010 at 07:45:45PM +0530, Koul, Vinod wrote:
> >  	case _IOC_NR(SNDRV_SST_STREAM_SET_PARAMS): {
> > -		struct snd_sst_params *str_param = (struct snd_sst_params *)arg;
> > +		struct snd_sst_params str_param;
> Now this is a struct...
> > 
> [snip]
> > +
> >  		if (!str_id) {
> So this becomes bogus check, can be removed :-)

The check for str_id?  That comes from near the start of the function
and it's still needed.

> > 
> > +				retval = copy_to_user(dest, &retval, sizeof(__u32));
> >  				if (retval)
> >  					retval = -EFAULT;
> Trivial but this can be changed to 
> 				if (copy_to_user())
> 					retval = -EFAULT;	
> 
retval is the str_id here so you'd need an else statement as well.
				else
					retval = 0;
I can send a separate patch for this.

> Overall its good, tested it as well,

Thanks for that.

regards,
dan carpenter

