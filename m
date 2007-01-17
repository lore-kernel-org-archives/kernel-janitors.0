From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 17 Jan 2007 18:26:41 +0000
Subject: Re: [KJ] what's the value of "__deprecated_for_modules"?
Message-Id: <20070117182641.GH16312@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701171108490.1461@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701171108490.1461@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 17.01.2007 [12:06:29 -0500], Robert P. J. Day wrote:
> On Wed, 17 Jan 2007, Adrian Bunk wrote:
> 
> > On Wed, Jan 17, 2007 at 11:11:46AM -0500, Robert P. J. Day wrote:
> > >
> > >   is there really an overwhelming rationale for the following?
> > >
> > > include/linux/compiler.h:
> > > -------------------------
> > > ...
> > > #ifdef MODULE
> > > #define __deprecated_for_modules __deprecated
> > > #else
> > > #define __deprecated_for_modules
> > > #endif
> > > ...
> >
> > This translates to "this EXPORT_SYMBOL will soon cvanish".
> >
> > > when there's only one usage of that macro in the entire tree?
> > >
> > >   include/linux/pagemap.h:
> > > 	extern __deprecated_for_modules struct page * find_trylock_page(
> > >
> > > it just seems odd that a "useful" macro would have only one
> > > application throughout the entire kernel.
> >
> > This depends on the tree you are looking at.  ;-)
> 
> personally, always the latest "git pull", being the bleeding edge kind
> of guy that i am.  :-)

As Adrian pointed out, this does cause your perception of the kernel to
be slightly skewed, wrt to this infrastructure :)

> > E.g. in 2.6.19 include/linux/crypto.h contained half a dozen
> > additional ones.
> >
> > One point about deprecated code it that it will be removed - which
> > can make the number of concurrent users quite low.
> 
> i guess i was curious about the very existence of that macro -- is
> there really a rationale for suggesting that something should be
> deprecated only for modules?  i just found that surprising.

Yes, as Adrian said, it means the EXPORT_SYMBOL is going away, so
modules can't use the symbol (but built-in code can).

> i guess what i was getting at was whether that macro itself was due
> for deletion some day once that final invocation goes away.

No, the macro causes no overhead and allows further EXPORT_SYMBOLs to be
deprecated, without having to deprecate the underlying symbol as well
(which is not the intention).

I suppose there is the additional rationale that this shoots a warning
at all those folks that build out-of-tree modules and try to build
against a kernel with a symbol marked as deprecated. Means they need to
update their code :)

Thanks,
Nish

-- 
Nishanth Aravamudan <nacc@us.ibm.com>
IBM Linux Technology Center
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
