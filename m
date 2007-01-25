From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 25 Jan 2007 21:36:54 +0000
Subject: Re: [KJ] [RFC][PATCH] Add extra power-of-2 functionality,
Message-Id: <Pine.LNX.4.64.0701251633030.14241@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701241503260.28433@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701241503260.28433@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 25 Jan 2007, Tobias Klauser wrote:

> On 2007-01-24 at 21:08:22 +0100, Robert P. J. Day <rpjday@mindspring.com> wrote:
> [...]
> >   this is just asking for feedback, to see if anyone can see anything
> > obviously wrong with this patch.  it adds the previously-discussed
> > functionality to log2.h, and also removes a few local definitions of
> > an is_power_of_2() macro to avoid redefinitions.
> >
> >   since there was no earlier rounding down functionality, there was
> > nothing to remove *there*.
>
> Are there any potential users around in the tree for the rounding down
> functions? IMHO it wouldn't make much sense to add them just to have
> them in the tree but noone is using them.

i know i've seen examples in the tree that were implemented with the
obvious loop.  i can't recall exactly where i saw them.  anyone else
know off the top of their head?

rday

p.s.  i've already submitted this as a patch to the LKML, based on
some correspondence i've had with the author of the log2.h file, who
i'm sure would have told me if it was a bad idea.

-- 

====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://www.fsdev.dreamhosters.com/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
