From: Greg KH <gregkh@linuxfoundation.org>
Date: Sat, 12 Jul 2014 02:34:21 +0000
Subject: Re: [PATCH] reformat_with_checkpatch: Add automation to checkpatch
Message-Id: <20140712023421.GA20583@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405128087.6751.12.camel@joe-AO725>
	<20140712013444.GA30368@kroah.com>
	<1405129216.6751.18.camel@joe-AO725>
In-Reply-To: <1405129216.6751.18.camel@joe-AO725>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernelnewbies@lists.kernelnewbies.org

On Fri, Jul 11, 2014 at 06:40:16PM -0700, Joe Perches wrote:
> On Fri, 2014-07-11 at 18:34 -0700, Greg KH wrote:
> > On Fri, Jul 11, 2014 at 06:21:27PM -0700, Joe Perches wrote:
> > > A simple script to run checkpatch --fix for various types of
> > > of cleanups.
> > > 
> > > This script is useful primarily for staging.
> > > 
> > > This reformats code to a more CodingStyle conforming style,
> > > compiles it, verifies that the object code hasn't changed,
> > > and git commits it too.
> > 
> > And 'git commits' it?
> 
> The thought I had was to made it easier to
> submit "my first kernel patch" correctly.
> like that tuxradar article you wrote a few
> years ago.
> 
> http://www.tuxradar.com/content/newbies-guide-hacking-linux-kernel

Yeah, but it's good for people to actually understand the change they
are making, and edit it themselves.  Or at least I think so, but I know
others don't, so I don't mind this script.

thanks,

greg k-h
