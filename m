From: Matthew Wilcox <willy@debian.org>
Date: Sat, 14 Feb 2004 17:41:14 +0000
Subject: Re: [Kernel-janitors] [PATCH] - 2.6.2 - security.h - compiler cleanups
Message-Id: <20040214174114.GX31168@parcelfarce.linux.theplanet.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200402122141.59608.ron@rongage.org>
In-Reply-To: <200402122141.59608.ron@rongage.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Feb 14, 2004 at 05:16:46PM +0000, Christoph Hellwig wrote:
> On Sat, Feb 14, 2004 at 04:53:02PM +0000, Matthew Wilcox wrote:
> > It doesn't warn in that case.
> > 
> > static int foo(int x, int __attribute__((unused)) y)
> > {
> >         return x + y;
> > }
> > 
> > Possibly we should call it __optional instead of __unused?
> 
> What about finding a gcc switch to turn that silly warning off instead?
> It's quite natural at least for method vectors to have unused arguments.
> Dito for all kinds of state machines implemented as array of function
> pointers, etc...
> 
> Basically everywhere where we implement the OO Virtual baseclass paradigm.

Sure, it's -Wno-unused.  However, that implies it's a worthless warning,
and I don't think that's true.  Last time I looked at these warnings,
there were some places that could lose an argument entirely, but I
haven't looked in ~3 years.

I don't think it's an unreasonable burden to add __optional to the unused
arguments of a method call anyway.  I prefer the plan9 C approach of simply
not naming them (ie

static void my_write_inode(struct inode *inode, int)
{
	...
}

But we're stuck with ISO C where you can't do that.  Is it really that
ugly to write

static void my_write_inode(struct inode *inode, int __optional wait)
{
	...
}

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
