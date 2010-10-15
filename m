From: Alan Cox <alan@linux.intel.com>
Date: Fri, 15 Oct 2010 12:59:48 +0000
Subject: Re: [patch 1/2] Staging: intel_sst: return -EFAULT if
Message-Id: <20101015135948.4458c532@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101015034407.GI6614@bicker>
In-Reply-To: <20101015034407.GI6614@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 15 Oct 2010 07:29:01 +0200
Dan Carpenter <error27@gmail.com> wrote:

> On Fri, Oct 15, 2010 at 09:53:57AM +0530, Koul, Vinod wrote:
> > > @@ -938,7 +940,7 @@ long intel_sst_ioctl(struct file *file_ptr,
> > > unsigned int cmd, unsigned long arg)
> > >  		retval = copy_to_user((struct snd_sst_vol *)arg,
> > >  						&get_vol,
> > > sizeof(get_vol)); if (retval) {
> > > -			retval = -EIO;
> > > +			retval = -EFAULT;
> > >  			break;
> > >  		}
> > >  		/*sst_print_get_vol_info(str_id, &get_vol);*/
> > Since retval is not used and value assigned is supposed to be
> > -EFAULT, how about this?
> > 	if(copy_to_user())
> > 			return -EIO;
> > 
> 
> No. No.  retval is used.  We can't return directly because we need to
> call unlock_kernel().

Dan - your tree is a couple of patches stale at this point if it has
the lock_kernel in it - the lock_kernel has gone in the latest
submission.
