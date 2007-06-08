From: "Denver Gingerich" <denver@ossguy.com>
Date: Fri, 08 Jun 2007 21:33:30 +0000
Subject: Re: [KJ] [PATCH] Drop the superfluous test for an old version of gcc.
Message-Id: <6defe8840706081433w644f8b63y7533ebd36fd59d24@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0706071336540.1235@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0706071336540.1235@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 6/7/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
>
> The header file <linux/compiler.h> already enforces a suitably recent
> version of gcc, so there's no point checking for that again.
>
> Signed-off-by: Robert P. J. Day <rpjday@mindspring.com>
>
> ---
>
> diff --git a/init/main.c b/init/main.c
> index eb8bdba..522b305 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -69,15 +69,7 @@
>  /*
>   * This is one of the first .c files built. Error out early if we have compiler
>   * trouble.
> - *
> - * Versions of gcc older than that listed below may actually compile and link
> - * okay, but the end product can have subtle run time bugs.  To avoid associated
> - * bogus bug reports, we flatly refuse to compile with a gcc that is known to be
> - * too old from the very beginning.
>   */
> -#if (__GNUC__ < 3) || (__GNUC__ = 3 && __GNUC_MINOR__ < 2)
> -#error Sorry, your GCC is too old. It builds incorrect kernels.
> -#endif
>
>  #if __GNUC__ = 4 && __GNUC_MINOR__ = 1 && __GNUC_PATCHLEVEL__ = 0
>  #warning gcc-4.1.0 is known to miscompile the kernel.  A different compiler version is recommended.
> --

If compiler.h already enforces a suitably recent version of gcc, then
why does main.c still have the check for gcc 4.1.0?  Shouldn't all
kernel version checks be done in the same place?

Denver
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
