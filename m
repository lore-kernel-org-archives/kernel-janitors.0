From: Cripps <acripps@gmail.com>
Date: Tue, 22 May 2007 23:12:24 +0000
Subject: Re: [KJ] [PATCH] potential parse error in ifdef
Message-Id: <c6711b6b0705221624x1b2d7ee6va892e324822144d8@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87fy5q5dxr.fsf@wanadoo.fr>
In-Reply-To: <87fy5q5dxr.fsf@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

best way to answer that: try removing the code and testing with "make
allyesconfig" et al ... The big thing about removing said segments of
code is: where else are bits of code that rely on this hiding
throughout the kernel? Once everything is found, if all of the code
does nothing, haul 'er outta there, else, try and minimise the code
that *is* in there so that the remaining kernel code it "prettier."
-Aaron Cripps

P.S. that IS a good question ...once we have a working patch, that is
tested and does what it's supposed to do, *do* we send it upstream to
the LKML, or does someone work on making a digest of all the patches
sent to [KJ] and send that upstream?

On 5/22/07, Håkon Løvdal <hlovdal@gmail.com> wrote:
> On 21/05/07, Matthew Wilcox <matthew@wil.cx> wrote:
> > On Mon, May 21, 2007 at 06:39:12PM +0200, Yoann Padioleau wrote:
> > > I have made a tool to parse the kernel that does not pre-process the
> > > source. That means that my parser tries to parse all the code, including
> > > code in the #else branch or code that is not often compiled because
> > > the driver is not very used (or not used at all). So, my parser
> > > sometimes reports parse error not originally detected by gcc.
> > > Here is my (first) patch.
> >
> > These all look good to me.
>
> But one question. His tool has found some code segments
> that obviously never have been compiled and most likely are
> not included in the kernel in any way (because otherwise
> I would assume that allyesconfig would have caught them).
>
> Dead, unused code that theoretically would compile is
> probably better than dead, unused code that would not
> compile, but if the code in question is indeed dead and
> unused I would assume that the best option would be to
> remove it?
>
> BR Håkon Løvdal
>
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.linux-foundation.org
> https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
>

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
