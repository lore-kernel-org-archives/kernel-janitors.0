From: Greg KH <gregkh@linuxfoundation.org>
Date: Sat, 12 Jul 2014 02:15:29 +0000
Subject: Re: [PATCH] reformat_with_checkpatch: Add automation to checkpatch
Message-Id: <20140712021529.GA17548@kroah.com>
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

Well, it does, it just has a:
	subdir-ccflags-y := -I$(src)/include/
line in drivers/staging/lustre/Makefile that messes up making .o files
in subdirectories.

I'll go fix that include file mess up now to be able to remove that line
so the the .o file building will work.

thanks,

greg k-h
