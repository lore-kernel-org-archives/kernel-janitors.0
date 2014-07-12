From: Joe Perches <joe@perches.com>
Date: Sat, 12 Jul 2014 01:50:40 +0000
Subject: Re: [PATCH] reformat_with_checkpatch: Add automation to checkpatch
Message-Id: <1405129840.6751.28.camel@joe-AO725>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405128087.6751.12.camel@joe-AO725>
	<20140712014325.GB30781@kroah.com>
In-Reply-To: <20140712014325.GB30781@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernelnewbies@lists.kernelnewbies.org

On Fri, 2014-07-11 at 18:43 -0700, Greg KH wrote:
> On Fri, Jul 11, 2014 at 06:21:27PM -0700, Joe Perches wrote:
> > A simple script to run checkpatch --fix for various types of
> > of cleanups.
[]
> If I pick drivers/staging/lustre/include/linux/lnet/types.h, then I get:
> 
> 	staging: lnet: checkpatch cleanup: whitespace neatening
> 
> and no 'types.h' here, is that intentional?  If so, why?

Yes, it's how it's written.
It uses just the directory name, not any basename($file)

It can be changed if that's what's desired.

> And this is fun, I'm going to let this rip on the lustre code...

It doesn't autocommit, it does show the various changes
it makes and asks you to accept them.

I suppose that could be automated with something better
than "yes", but I didn't want it to be completely automatic.

