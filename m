From: Matthew Wilcox <willy@debian.org>
Date: Sat, 14 Feb 2004 16:53:02 +0000
Subject: Re: [Kernel-janitors] [PATCH] - 2.6.2 - security.h - compiler cleanups
Message-Id: <20040214165302.GU31168@parcelfarce.linux.theplanet.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200402122141.59608.ron@rongage.org>
In-Reply-To: <200402122141.59608.ron@rongage.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Feb 13, 2004 at 08:55:52PM -0800, Greg KH wrote:
> On Fri, Feb 13, 2004 at 10:45:24PM +0000, Matthew Wilcox wrote:
> > static int foo(int x, int __unused y)
> > 
> > also doesn't warn, and that's the same syntax as __user, which gives me
> > the warm fuzzies.
> 
> This is much more sane and nice.
> 
> Can we get a warning from the compiler if we actually use a variable
> marked __unused?

It doesn't warn in that case.

static int foo(int x, int __attribute__((unused)) y)
{
        return x + y;
}

Possibly we should call it __optional instead of __unused?

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
