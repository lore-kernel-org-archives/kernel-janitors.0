From: Joe Perches <joe@perches.com>
Date: Sat, 12 Jul 2014 01:57:24 +0000
Subject: Re: [PATCH] reformat_with_checkpatch: Add automation to checkpatch
Message-Id: <1405130244.6751.32.camel@joe-AO725>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405128087.6751.12.camel@joe-AO725>
	<20140712015327.GA26496@kroah.com>
In-Reply-To: <20140712015327.GA26496@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernelnewbies@lists.kernelnewbies.org

On Fri, 2014-07-11 at 18:53 -0700, Greg KH wrote:
> On Fri, Jul 11, 2014 at 06:21:27PM -0700, Joe Perches wrote:
> > A simple script to run checkpatch --fix for various types of
> > of cleanups.
[]
> Anyway, try running this script on
> drivers/staging/lustre/lnet/lnet/acceptor.c to see how this build fails.

lustre doesn't use "normal" kernel makefiles.

I supposed that the entire staging/lustre/
path could be built for every change, but for
most of staging, and nearly all of the rest
of the kernel tree, using:

	make <path>file.o

works.

I know there can be many enhancements to the
reformat script, but I think a minimally
acceptable version is a decent start.

So, thanks for trying it out.

And keep the complaints coming.

cheers, Joe

