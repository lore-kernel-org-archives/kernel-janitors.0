From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 17 Jan 2007 17:06:29 +0000
Subject: Re: [KJ] what's the value of "__deprecated_for_modules"?
Message-Id: <Pine.LNX.4.64.0701171203500.2311@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701171108490.1461@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701171108490.1461@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 17 Jan 2007, Adrian Bunk wrote:

> On Wed, Jan 17, 2007 at 11:11:46AM -0500, Robert P. J. Day wrote:
> >
> >   is there really an overwhelming rationale for the following?
> >
> > include/linux/compiler.h:
> > -------------------------
> > ...
> > #ifdef MODULE
> > #define __deprecated_for_modules __deprecated
> > #else
> > #define __deprecated_for_modules
> > #endif
> > ...
>
> This translates to "this EXPORT_SYMBOL will soon cvanish".
>
> > when there's only one usage of that macro in the entire tree?
> >
> >   include/linux/pagemap.h:
> > 	extern __deprecated_for_modules struct page * find_trylock_page(
> >
> > it just seems odd that a "useful" macro would have only one
> > application throughout the entire kernel.
>
> This depends on the tree you are looking at.  ;-)

personally, always the latest "git pull", being the bleeding edge kind
of guy that i am.  :-)

> E.g. in 2.6.19 include/linux/crypto.h contained half a dozen
> additional ones.
>
> One point about deprecated code it that it will be removed - which
> can make the number of concurrent users quite low.

i guess i was curious about the very existence of that macro -- is
there really a rationale for suggesting that something should be
deprecated only for modules?  i just found that surprising.  i guess
what i was getting at was whether that macro itself was due for
deletion some day once that final invocation goes away.

rday
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
