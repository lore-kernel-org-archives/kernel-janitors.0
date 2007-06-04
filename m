From: Matthew Wilcox <matthew@wil.cx>
Date: Mon, 04 Jun 2007 13:48:12 +0000
Subject: Re: [KJ] another project or two
Message-Id: <20070604134812.GC23968@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0706040528251.31127@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0706040528251.31127@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jun 04, 2007 at 09:27:55AM -0400, Robert P. J. Day wrote:
> true.  it's not clear that there's an overwhelming benefit of
> centralizing content that *just happens* to be the same, but i think
> there's benefit for centralizing content that must *necessarily* be
> the same.

Right.  Or can usefully be made the same (see my recent-ish patch to
centralise the definitions of CONFIG_LBD/CONFIG_LSF for an example where
it made no sense to keep things separate).

>   as you can see, any arch-specific ioctl.h file would simply define
> what differs from the generic, then include the asm-generic version,
> and there are at least a few of those files for which this patch would
> be perfectly appropriate.  is that the sort of thing you were thinking
> about?

I think that's fine.  It's a bit more clean-up-the-past than
plan-for-the-future (which was what I was trying to get at with my last
message), but it's not horribly obfuscating like the errno patches were.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
