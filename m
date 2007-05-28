From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Mon, 28 May 2007 22:35:27 +0000
Subject: Re: [KJ] the standard for including header files?
Message-Id: <465B592F.7060105@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705281627190.15720@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705281627190.15720@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Robert P. J. Day wrote:
>   in my travels thru the source tree, i've noticed header files like
> the following (include/linux/ioctl.h):
>
> #ifndef _LINUX_IOCTL_H
> #define _LINUX_IOCTL_H
>
> #include <asm/ioctl.h>
>
> #endif /* _LINUX_IOCTL_H */
>
>   fair enough -- it simply includes the asm-specific form of that
> header file, so one can include either of those two header files to
> get exactly the same effect.
>
>   but what's the *correct* header file to include?  *at the moment*,
> those two includes are equivalent but nothing says they have to be
> that way forever.  perhaps some day some arch-independent content is
> added to linux/ioctl.h.  if that happens, those files that include
> *that* header file will pick up the additional content, while files
> that instead include asm/ioctl.h won't.
>
>   it may be that this will never be a problem, but there certainly is
> some variety of who is including what in the source tree:
>
> $ grep -r "include.*linux/ioctl.h" * | wc -l
> 131
> $ grep -r "include.*asm/ioctl.h" * | wc -l
> 40
>
>   there are a few other header files like that:  user.h, param.h, etc.
> i'm just wondering what the standard is.
>   
We want our drivers to be independent of the architectures and if there 
is a header in include/linux/, then what is the reason to include the 
include/asm/? Like types.h, where the generic header includes the 
arch-specific header to get [su]{8,16,32,64}-types. The only reason I 
can see when you want to include from include/asm/ is when a driver will 
only work on a subset of the architectures.

But as a wise man said; that is just my opinion, I could be wrong.
Richard Knutson

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
