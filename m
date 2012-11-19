From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 19 Nov 2012 13:39:13 +0000
Subject: Re: [PATCH] staging: dgrp: dgrp_tty.c: Audit the return values of get/put_user()
Message-Id: <20121119133913.GA11248@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1353322531-10092-1-git-send-email-gmate.amit@gmail.com>
 <20121119111553.GC6186@mwanda>
 <20121119130829.GB3275@gmail.com>
In-Reply-To: <20121119130829.GB3275@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kumar amit mehta <gmate.amit@gmail.com>
Cc: gregkh@linuxfoundation.org, alan@lxorguk.ukuu.org.uk, wfp5p@virginia.edu, geert@linux-m68k.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org

On Mon, Nov 19, 2012 at 06:38:29PM +0530, Kumar amit mehta wrote:
> On Mon, Nov 19, 2012 at 02:15:54PM +0300, Dan Carpenter wrote:
> > On Mon, Nov 19, 2012 at 04:25:31PM +0530, Kumar Amit Mehta wrote:
> > > -- fix for missing audits for return values of get_user() and put_user().
> > > -- Remove the TIOCSSOFTCAR ioctl handling from dgrp driver.
> > 
> > These should be done in separate commits.
> > 
> > Are the calls to access_ok() still needed if we check get_user() and
> > put_user()?
> >
> You are right, access_ok() would become redundant if we check get/put_user().
> Also, After sending one patch for removing TIOCSSOFTCAR ioctl handler from dgrp
> driver, I realized that I should be sending two patches as patch series. Please
> correct me if I'm wrong.

Patch series are better, yes.  But in this case it's not a big deal
and should apply fine so don't bother resending.

regards,
dan carpenter

