From: Joe Perches <joe@perches.com>
Date: Sun, 13 Jul 2014 03:06:36 +0000
Subject: Re: [PATCH] reformat_with_checkpatch: Add automation to checkpatch
Message-Id: <1405220796.9132.31.camel@joe-AO725>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405128087.6751.12.camel@joe-AO725>
	<20140712013444.GA30368@kroah.com> <1405129216.6751.18.camel@joe-AO725>
	<20140712093043.GG25880@mwanda> <20140712175526.GA17077@kroah.com>
	<1405189777.9132.27.camel@joe-AO725> <20140712192846.GB25649@kroah.com>
In-Reply-To: <20140712192846.GB25649@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernelnewbies@lists.kernelnewbies.org

On Sat, 2014-07-12 at 12:28 -0700, Greg KH wrote:
> On Sat, Jul 12, 2014 at 11:29:37AM -0700, Joe Perches wrote:
> > On Sat, 2014-07-12 at 10:55 -0700, Greg KH wrote:
> > > Yes, the warnings are all due to line-length, but Joe, you shouldn't add
> > > a patch that causes more checkpatch warnings than before :)
> > 
> > Yeah, that was intentional though.
> > 
> > This script does a series of relatively discrete changes.
> > 
> > Lindent would more or less work, but it's _horrible_ at
> > wrapping overlong lines and merges all types of changes
> > together.
> 
> Oh I agree, I don't want to see Lindent, but maybe, if the patch adds
> checkpatch warnings, it should be at least "flagged" as maybe a problem?

The script I submitted does run checkpatch
before any commit is done.

> Would you want to be on the receiving end of this patch script?

You might have noticed I don't have a kernel.org
account.


