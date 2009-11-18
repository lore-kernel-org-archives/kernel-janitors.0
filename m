From: Michael Spradling <mike@mspradling.com>
Date: Wed, 18 Nov 2009 12:13:14 +0000
Subject: Re: [PATCH 1/1] Removed Dead Code
Message-Id: <20091118121314.GD22619@MSServer>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20091117053847.GA19184@MSServer>
In-Reply-To: <20091117053847.GA19184@MSServer>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I did base my patch on the linux-next tree.  I think I will just sit back and
be patient.  I don't want to spam the list with patches that do fit with the
communities standards.

Thanks
Michael

On Wed, Nov 18, 2009 at 10:05:09AM +0100, Nicolas Palix wrote:
> On Wednesday 18 November 2009 01:12:22 Michael Spradling wrote:
> > Does anyone have any comments, how do I know if this patch is ever taken in...
> > Is there a server somewhere that shows integration status
> 
> Declare linux-next in your git repository with
> git remote add linux-next <url>
> 
> <url> can be one of the following:
> http://www.kernel.org/pub/scm/linux/kernel/git/sfr/linux-next.git
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> 
> Then, retrieve daily release with git remote update.
> You can use GUI, like qgit, or git log, and search for your name.
> 
> For info about linux-next, check
> http://linux.f-seidel.de/linux-next/pmwiki/pmwiki.php?n=Linux-next.Linux-next
> 
> Alternatively, you can check the gitweb server of linux-next
> http://git.kernel.org/?p=linux/kernel/git/next/linux-next.git;a=summary
> 
> > 
> > On Tue, Nov 17, 2009 at 12:38:47AM -0500, Michael Spradling wrote:
> > > Signed-off-by: Michael Spradling <mike@mspradling.com>
> > > 
> > > ---
> > >  drivers/video/s1d13xxxfb.c |   50 --------------------------------------------
> > >  1 files changed, 0 insertions(+), 50 deletions(-)
> > > 
> > > diff --git a/drivers/video/s1d13xxxfb.c b/drivers/video/s1d13xxxfb.c
> > > index 0deb0a8..d3059cd 100644
> > > --- a/drivers/video/s1d13xxxfb.c
> > > +++ b/drivers/video/s1d13xxxfb.c
> > > @@ -409,28 +409,6 @@ s1d13xxxfb_pan_display(struct fb_var_screeninfo *var, struct fb_info *info)
> > >   ************************************************************/
> > >  
> > >  /**
> > > - *	bltbit_wait_bitset - waits for change in register value
> > > - *	@info : framebuffer structure
> > > - *	@bit  : value expected in register
> > > - *	@timeout : ...
> > > - *
> > > - *	waits until value changes INTO bit
> > > - */
> > > -static u8
> > > -bltbit_wait_bitset(struct fb_info *info, u8 bit, int timeout)
> > > -{
> > > -	while (!(s1d13xxxfb_readreg(info->par, S1DREG_BBLT_CTL0) & bit)) {
> > > -		udelay(10);
> > > -		if (!--timeout) {
> > > -			dbg_blit("wait_bitset timeout\n");
> > > -			break;
> > > -		}
> > > -	}
> > > -
> > > -	return timeout;
> > > -}
> > > -
> > > -/**
> > >   *	bltbit_wait_bitclear - waits for change in register value
> > >   *	@info : frambuffer structure
> > >   *	@bit  : value currently in register
> > > @@ -453,34 +431,6 @@ bltbit_wait_bitclear(struct fb_info *info, u8 bit, int timeout)
> > >  	return timeout;
> > >  }
> > >  
> > > -/**
> > > - *	bltbit_fifo_status - checks the current status of the fifo
> > > - *	@info : framebuffer structure
> > > - *
> > > - *	returns number of free words in buffer
> > > - */
> > > -static u8
> > > -bltbit_fifo_status(struct fb_info *info)
> > > -{
> > > -	u8 status;
> > > -
> > > -	status = s1d13xxxfb_readreg(info->par, S1DREG_BBLT_CTL0);
> > > -
> > > -	/* its empty so room for 16 words */
> > > -	if (status & BBLT_FIFO_EMPTY)
> > > -		return 16;
> > > -
> > > -	/* its full so we dont want to add */
> > > -	if (status & BBLT_FIFO_FULL)
> > > -		return 0;
> > > -
> > > -	/* its atleast half full but we can add one atleast */
> > > -	if (status & BBLT_FIFO_NOT_FULL)
> > > -		return 1;
> > > -
> > > -	return 0;
> > > -}
> > > -
> > >  /*
> > >   *	s1d13xxxfb_bitblt_copyarea - accelerated copyarea function
> > >   *	@info : framebuffer structure
> > > -- 
> > > 1.6.5.2
> > > 
> > > 
> > > --
> > > To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> > > the body of a message to majordomo@vger.kernel.org
> > > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > 
> > --
> > To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > 
> 
> 
> -- 
> Nicolas Palix

