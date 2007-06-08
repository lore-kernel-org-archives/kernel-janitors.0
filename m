From: walter harms <wharms@bfs.de>
Date: Fri, 08 Jun 2007 09:21:42 +0000
Subject: Re: [KJ] remove all content specific to GCC < 3.2??
Message-Id: <46691FA6.8000705@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0706071212280.29467@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0706071212280.29467@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Robert P. J. Day wrote:
> On Thu, 7 Jun 2007, Adrian Bunk wrote:
> 
>> On Thu, Jun 07, 2007 at 12:17:42PM -0400, Robert P. J. Day wrote:
>>>   is it relatively safe to strip the kernel tree of any content that
>>> is conditional upon unacceptably old versions of GCC?
>>>
>>>   the header file linux/compiler.h already rejects the use of old gnu
>>> compilers:
>>> ...
>>> so clearly any gcc < 3.2 is dead in the water, which suggests that any
>>> content dependent on that can be tossed as well.  as a starting point,
>>> one can search for the macro __GNUC_MINOR__ to find:
>>> ...
>>>   seems like a lot of that can be removed.  anyone want to deal with
>>> that if it seems like a viable project?
>> None of the lines you have quoted could be removed because they'd
>> deal with gcc < 3.2 (the compiler.h and init/main.c #error's should
>> stay).
> 
> ah, yes, you're right.  i just saw all those comparisons and assumed
> that some of them would represent old stuff.  i didn't take the time
> to look more closely.
> 
> however, i still think some of those errors could be updated.  for
> instance, consider this from arch/arm/kernel/asm-offsets.c:
> 
> ...
> #if (__GNUC__ = 3 && __GNUC_MINOR__ < 3)
> #error Your compiler is too buggy; it is known to miscompile kernels.
> #error    Known good compilers: 3.3
> #endif
> ...
> 
> it seems inconsistent that compiler.h *accepts* gcc-3.2, while this
> source file *rejects* it.  if gcc-3.2 is too buggy just for the ARM
> architecture, then the error message should probably say that, rather
> than suggest that it's too buggy *in general*.
> 
> also, from init/main.c, this looks like it can be tossed:
> 
> #if (__GNUC__ < 3) || (__GNUC__ = 3 && __GNUC_MINOR__ < 2)
> #error Sorry, your GCC is too old. It builds incorrect kernels.
> #endif
> 
> just being pedantic.  :-)


there are no stupid questions just stupid answers :)

It is useful to have different architectures check for different gcc versions since some bugs may
be present in certain architectures only.
it *is* stupid to have a general gcc check ABOVE this level. Since linux will refuse to compile at all.
In general it is a question of policy since certain gcc version are still in use because they are known
to create good code for certain architecture (e.g. gcc-2.95 for arm).

Is there are table available gcc-version vs kernel vs architecture that evaluates this ?
This could be translated into a small code that checks the current

re,
 wh






_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
