From: Adrian Bunk <bunk@fs.tum.de>
Date: Sun, 15 Feb 2004 06:35:16 +0000
Subject: Re: [Kernel-janitors] [PATCH] - 2.6.2 - security.h - compiler cleanups
Message-Id: <20040215063516.GO1308@fs.tum.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200402122141.59608.ron@rongage.org>
In-Reply-To: <200402122141.59608.ron@rongage.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Feb 14, 2004 at 05:41:14PM +0000, Matthew Wilcox wrote:
> >...
> > What about finding a gcc switch to turn that silly warning off instead?
> > It's quite natural at least for method vectors to have unused arguments.
> > Dito for all kinds of state machines implemented as array of function
> > pointers, etc...
> > 
> > Basically everywhere where we implement the OO Virtual baseclass paradigm.
> 
> Sure, it's -Wno-unused.  However, that implies it's a worthless warning,
> and I don't think that's true.  Last time I looked at these warnings,
> there were some places that could lose an argument entirely, but I
> haven't looked in ~3 years.
> 
> I don't think it's an unreasonable burden to add __optional to the unused
> arguments of a method call anyway.  I prefer the plan9 C approach of simply
> not naming them (ie
>...

You said you checked such cases some time ago.

With your __optional suggestion, most likely _all_ such unused
parameters will be marked __optional without a deeper checking by some
Janitors. This way, the effect would be similar to simply using
-Wno-unused when using -W .

IMHO a better approach than silenting all -W warnings would be to add
selected warning options to the default built and clean the code for
them, but completely silenting a -W compile isn't worth the effort. E.g.
some time ago I checked -Wundef. Silenting -Wundef would be possible
although it requires some work (but I gave up after looking at XFS).

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
