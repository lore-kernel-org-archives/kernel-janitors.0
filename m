From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 12 Jul 2014 09:30:43 +0000
Subject: Re: [PATCH] reformat_with_checkpatch: Add automation to checkpatch
Message-Id: <20140712093043.GG25880@mwanda>
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
> 
> > Heh, I should just run this myself to clean up
> > staging and beat everyone else to it...
> 
> At least for the whitespace noise, you could
> but I hope it'll encourage a few more people
> to try kernel patching instead.

I have always hate the idea of automated patches from random people
because I don't trust them to not be malicious so I have to review them
manually.  There is a story that back in the day the US government paid
someone to send tons of checkpatch style patches to BSD.  The guy
thought he was "cleaning up the code" but actually he was part of a
larger scheme to flood the maintainers with patches so another person
could slip in some malicious code.

It's better if someone just ran this on all new staging code before
adding it to the tree.

regards,
dan carpenter

