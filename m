From: Matthew Wilcox <willy@debian.org>
Date: Fri, 13 Feb 2004 22:45:24 +0000
Subject: Re: [Kernel-janitors] [PATCH] - 2.6.2 - security.h - compiler cleanups
Message-Id: <20040213224524.GS31168@parcelfarce.linux.theplanet.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200402122141.59608.ron@rongage.org>
In-Reply-To: <200402122141.59608.ron@rongage.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Feb 13, 2004 at 01:57:57PM -0800, Greg KH wrote:
> On Fri, Feb 13, 2004 at 04:20:27PM -0500, Ron Gage wrote:
> > 
> > Well, I guess I shouldn't have presumed to fix all the warnings.  My bad... 
> > Sorry about that...
> 
> Just fix the warnings that make sense :)
> 
> This one doesn't really...

I think there's a case for fixing all the *headers* that don't compile
cleanly with -W.  That way people can enable -W for their own drivers
without being flooded with errors that are nothing to do with them.

The patches that Ron submitted are one way to fix it, but I've always
hated the foo = foo "feature" of C, ever since I inadvertently found
out about it (that would be a couple of years ago).  We can use gcc
extensions to stop warning about it:

static int foo(int x, int y __attribute__((unused)))
{
        return x;
}

Obviously we wouldn't want to write that out because it's even more
ugly, but with a suitable define, we could do something like:

static int foo(int x, unused(int y))

or

static int foo(int x, int y __unused)

What do you think?


... hmm, the documentation is unclear, but:

static int foo(int x, int __unused y)

also doesn't warn, and that's the same syntax as __user, which gives me
the warm fuzzies.

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
