From: "Koul, Vinod" <vinod.koul@intel.com>
Date: Fri, 15 Oct 2010 05:51:54 +0000
Subject: RE: [patch 1/2] Staging: intel_sst: return -EFAULT if
Message-Id: <438BB0150E931F4B9CE701519A44630104BE7633EE@bgsmsx502.gar.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101015034407.GI6614@bicker>
In-Reply-To: <20101015034407.GI6614@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> > > @@ -938,7 +940,7 @@ long intel_sst_ioctl(struct file *file_ptr, unsigned int
> cmd,
> > > unsigned long arg)
> > >  		retval = copy_to_user((struct snd_sst_vol *)arg,
> > >  						&get_vol, sizeof(get_vol));
> > >  		if (retval) {
> > > -			retval = -EIO;
> > > +			retval = -EFAULT;
> > >  			break;
> > >  		}
> > >  		/*sst_print_get_vol_info(str_id, &get_vol);*/
> > Since retval is not used and value assigned is supposed to be -EFAULT,
> > how about this?
> > 	if(copy_to_user())
> > 			return -EIO;
> >
> 
> No. No.  retval is used.  We can't return directly because we need to
> call unlock_kernel().
Kernel locking is already gone :) [1].

The point here was we don't need to store return value from this function
Anyway you could have done it this way
	if(copy_to_user()) {
		retval = -EIO;
		break;
	}


~Vinod

[1]: http://mailman.alsa-project.org/pipermail/alsa-devel/2010-October/032690.html

