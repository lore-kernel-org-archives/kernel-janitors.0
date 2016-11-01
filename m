From: Jon Mason <jdmason@kudzu.us>
Date: Tue, 01 Nov 2016 20:35:37 +0000
Subject: Re: [patch] ntb_perf: potential info leak in debugfs
Message-Id: <20161101203536.GB25928@kudzu.us>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161014073418.GD15168@mwanda>
In-Reply-To: <20161014073418.GD15168@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Oct 14, 2016 at 10:07:13AM -0700, Dave Jiang wrote:
> 
> 
> On 10/14/2016 12:34 AM, Dan Carpenter wrote:
> > This is a static checker warning, not something I'm desperately
> > concerned about.  But snprintf() returns the number of bytes that
> > would have been copied if there were space.  We really care about the
> > number of bytes that actually were copied so we should use scnprintf()
> > instead.
> > 
> > It probably won't overrun, and in that case we may as well just use
> > sprintf() but these sorts of things make static checkers and code
> > reviewers happier.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Dave Jiang <dave.jiang@intel.com>

Sorry for the delay.  Pulled into my ntb branch.

Thanks,
Jon

> 
> > 
> > diff --git a/drivers/ntb/test/ntb_perf.c b/drivers/ntb/test/ntb_perf.c
> > index 6a50f20..2d9ca58 100644
> > --- a/drivers/ntb/test/ntb_perf.c
> > +++ b/drivers/ntb/test/ntb_perf.c
> > @@ -589,7 +589,7 @@ static ssize_t debugfs_run_read(struct file *filp, char __user *ubuf,
> >  		return -ENOMEM;
> >  
> >  	if (mutex_is_locked(&perf->run_mutex)) {
> > -		out_off = snprintf(buf, 64, "running\n");
> > +		out_off = scnprintf(buf, 64, "running\n");
> >  		goto read_from_buf;
> >  	}
> >  
> > @@ -600,14 +600,14 @@ static ssize_t debugfs_run_read(struct file *filp, char __user *ubuf,
> >  			break;
> >  
> >  		if (pctx->status) {
> > -			out_off += snprintf(buf + out_off, 1024 - out_off,
> > +			out_off += scnprintf(buf + out_off, 1024 - out_off,
> >  					    "%d: error %d\n", i,
> >  					    pctx->status);
> >  			continue;
> >  		}
> >  
> >  		rate = div64_u64(pctx->copied, pctx->diff_us);
> > -		out_off += snprintf(buf + out_off, 1024 - out_off,
> > +		out_off += scnprintf(buf + out_off, 1024 - out_off,
> >  			"%d: copied %llu bytes in %llu usecs, %llu MBytes/s\n",
> >  			i, pctx->copied, pctx->diff_us, rate);
> >  	}
> > 
