From: Joe Perches <joe@perches.com>
Date: Sat, 12 Jul 2014 18:29:37 +0000
Subject: Re: [PATCH] reformat_with_checkpatch: Add automation to checkpatch
Message-Id: <1405189777.9132.27.camel@joe-AO725>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405128087.6751.12.camel@joe-AO725>
	<20140712013444.GA30368@kroah.com> <1405129216.6751.18.camel@joe-AO725>
	<20140712093043.GG25880@mwanda> <20140712175526.GA17077@kroah.com>
In-Reply-To: <20140712175526.GA17077@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernelnewbies@lists.kernelnewbies.org

On Sat, 2014-07-12 at 10:55 -0700, Greg KH wrote:
> Yes, the warnings are all due to line-length, but Joe, you shouldn't add
> a patch that causes more checkpatch warnings than before :)

Yeah, that was intentional though.

This script does a series of relatively discrete changes.

Lindent would more or less work, but it's _horrible_ at
wrapping overlong lines and merges all types of changes
together.

For now, people are probably better at line wrapping in
an acceptable way.

> While I always want to see more developers get involved with kernel
> development, there should be a minimum barrier to entry.  And that
> barrier is the knowledge of the C language, and knowledge of how to edit
> a text file, and use git.  This script takes that barrier away, for
> whitespace cleanups, with not much real use overall.
> 
> So, I'll keep my local copy of this script now, just to have fun with at
> times when I'm bored.  But I don't think it should be merged, as-is.

Dunno, I still think it's useful.

Maybe when you get new code, you might run it through a
script like this before committing it.


