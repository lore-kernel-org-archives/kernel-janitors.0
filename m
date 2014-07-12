From: Joe Perches <joe@perches.com>
Date: Sat, 12 Jul 2014 01:40:16 +0000
Subject: Re: [PATCH] reformat_with_checkpatch: Add automation to checkpatch
Message-Id: <1405129216.6751.18.camel@joe-AO725>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405128087.6751.12.camel@joe-AO725>
	<20140712013444.GA30368@kroah.com>
In-Reply-To: <20140712013444.GA30368@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernelnewbies@lists.kernelnewbies.org

On Fri, 2014-07-11 at 18:34 -0700, Greg KH wrote:
> On Fri, Jul 11, 2014 at 06:21:27PM -0700, Joe Perches wrote:
> > A simple script to run checkpatch --fix for various types of
> > of cleanups.
> > 
> > This script is useful primarily for staging.
> > 
> > This reformats code to a more CodingStyle conforming style,
> > compiles it, verifies that the object code hasn't changed,
> > and git commits it too.
> 
> And 'git commits' it?

The thought I had was to made it easier to
submit "my first kernel patch" correctly.
like that tuxradar article you wrote a few
years ago.

http://www.tuxradar.com/content/newbies-guide-hacking-linux-kernel

> Heh, I should just run this myself to clean up
> staging and beat everyone else to it...

At least for the whitespace noise, you could
but I hope it'll encourage a few more people
to try kernel patching instead.

> I know some people already have private versions of these things, might
> as well make it public for all to abuse :)

And I hope they can improve it too as it's
just a brainless little script.

