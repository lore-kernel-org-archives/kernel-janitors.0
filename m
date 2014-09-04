From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 04 Sep 2014 12:23:02 +0000
Subject: Re: [patch] Btrfs: kfree()ing ERR_PTRs
Message-Id: <20140904122302.GP6549@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140904110915.GB21504@mwanda>
 <540856D4.8010903@bfs.de>
In-Reply-To: <540856D4.8010903@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <jbacik@fb.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Sep 04, 2014 at 02:11:00PM +0200, walter harms wrote:
> >  	ret = btrfs_ioctl_snap_create_transid(file, vol_args->name,
> >  					      vol_args->fd, subvol, ptr,
> >  					      readonly, inherit);
> > +	if (ret)
> > +		goto free_inherit;
> >  
> > -	if (ret = 0 && ptr &&
> > -	    copy_to_user(arg +
> > -			 offsetof(struct btrfs_ioctl_vol_args_v2,
> > -				  transid), ptr, sizeof(*ptr)))
> > +	if (ptr && copy_to_user(arg +
> > +				offsetof(struct btrfs_ioctl_vol_args_v2,
> > +					transid),
> > +				ptr, sizeof(*ptr)))
> >  		ret = -EFAULT;
> 
> 
> this is hard to read.
> perhaps it would help to move ptr into the other other
> 
> if (ret || !ptr )
>   goto free_inherit;

I don't think that's an improvement.

> 
> both are modified by the call btrfs_ioctl_snap_create_transid().
> 

I think you are mixing up ptr and *ptr so that's why you're confused.

regards,
dan carpenter

