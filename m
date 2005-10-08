From: Felix Oxley <lkml@oxley.org>
Date: Sat, 08 Oct 2005 19:08:03 +0000
Subject: Re: [KJ] Question re make
Message-Id: <200510082008.04991.lkml@oxley.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200510081802.35521.lkml@oxley.org>
In-Reply-To: <200510081802.35521.lkml@oxley.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


> You are "make"ing an object file, not a .c file. Makefiles' syntax is
> for the target, not the source.
>
> make drivers/telephony/ixj.o
>
I had tried this all ready and forgot to mention it, but it didn't work at the 
time.
>
> Please read the Makefile before posting.
>
Which file should I read?

> make M=drivers/telephony
>

This does the trick!

> > and
> >         # cc driver/telephony/ixj.cjust gives hundreds of errors.
>
> This is just plain silly and why we have a Makefile system in the first
> place.
>
I know, but  I was just trying to exaplan all the methods I had tried.
I think I must have cocked something up before but it is better now.

Thanks for your help.
Felix

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
