From: Greg KH <gregkh@linuxfoundation.org>
Date: Sat, 12 Jul 2014 01:57:06 +0000
Subject: Re: [PATCH] reformat_with_checkpatch: Add automation to checkpatch
Message-Id: <20140712020114.GA12301@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405128087.6751.12.camel@joe-AO725>
	<20140712013927.GA30781@kroah.com>
	<1405129612.6751.24.camel@joe-AO725>
In-Reply-To: <1405129612.6751.24.camel@joe-AO725>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernelnewbies@lists.kernelnewbies.org

On Fri, Jul 11, 2014 at 06:46:52PM -0700, Joe Perches wrote:
> On Fri, 2014-07-11 at 18:39 -0700, Greg KH wrote:
> > On Fri, Jul 11, 2014 at 06:21:27PM -0700, Joe Perches wrote:
> > > A simple script to run checkpatch --fix for various types of
> > > of cleanups.
> ]
> > drivers/staging/lustre/include/linux/lnet/api.h has no obvious style problems and is ready for submission.
> > file: <drivers/staging/lustre/include/linux/lnet/api.h> description: <update c90 comment style> types:<c99_comments>
> > Useless use of greediness modifier '+' in regex; marked by <-- HERE in m/(^\+.*) {8,8}+ <-- HERE \t/ at ./scripts/checkpatch.pl line 2217.
> []
> > drivers/staging/lustre/include/linux/lnet/api.h has no obvious style problems and is ready for submission.
> []
> > Is that expected?
> 
> No, I haven't seen that.
> 
> Can you tell me what git tree you're working on?

My staging-next branch of staging.git on git.kernel.org

> Also, can you use the scripts/checkpatch from -next
> tag next-20140711

that will take a bit to checkout, I'll do that afterward.

> My system has:
> 
> $ perl --version 
> 
> This is perl 5, version 18, subversion 2 (v5.18.2) built for i686-linux-gnu-thread-multi-64int
> (with 41 registered patches, see perl -V for more detail)

I think this started showing up for me for perl 5.20.  Let me go
checkout linux-next and see if that fixes anything or not...

thanks,

greg k-h
