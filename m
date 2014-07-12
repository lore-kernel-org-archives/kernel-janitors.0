From: Greg KH <gregkh@linuxfoundation.org>
Date: Sat, 12 Jul 2014 08:08:57 +0000
Subject: Re: [PATCH] reformat_with_checkpatch: Add automation to checkpatch
Message-Id: <20140712080857.GA17634@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405128087.6751.12.camel@joe-AO725>
	<20140712015327.GA26496@kroah.com>
	<1405130244.6751.32.camel@joe-AO725>
In-Reply-To: <1405130244.6751.32.camel@joe-AO725>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernelnewbies@lists.kernelnewbies.org

On Fri, Jul 11, 2014 at 06:57:24PM -0700, Joe Perches wrote:
> On Fri, 2014-07-11 at 18:53 -0700, Greg KH wrote:
> > On Fri, Jul 11, 2014 at 06:21:27PM -0700, Joe Perches wrote:
> > > A simple script to run checkpatch --fix for various types of
> > > of cleanups.
> []
> > Anyway, try running this script on
> > drivers/staging/lustre/lnet/lnet/acceptor.c to see how this build fails.
> 
> lustre doesn't use "normal" kernel makefiles.

Ok, I've fixed all of the lustre Makefile crud up and checked it into my
staging-next branch.  In doing so, it exposed just what a horrid mess
the lustre include files are, which is good, hopefully people will
notice and start fixing it up.

And with the fixes, this script now properly can build and test lustre
files.

thanks,

greg k-h
