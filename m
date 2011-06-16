From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Jun 2011 17:23:25 +0000
Subject: Re: [PATCH] m68k: remove unnecessary code
Message-Id: <BANLkTimLFpdy=bOE4wYd0EpORj0O_X4gZQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1308242527-28971-1-git-send-email-Gregory.Dietsche@cuw.edu>
In-Reply-To: <1308242527-28971-1-git-send-email-Gregory.Dietsche@cuw.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Greg Dietsche <Gregory.Dietsche@cuw.edu>
Cc: linux-m68k@lists.linux-m68k.org, kernel-janitors@vger.kernel.org

On Thu, Jun 16, 2011 at 18:42, Greg Dietsche <Gregory.Dietsche@cuw.edu> wrote:
> remove unnecessary code that matches this coccinelle pattern
>        if (...)
>                return ret;
>        return ret;
>
> Signed-off-by: Greg Dietsche <Gregory.Dietsche@cuw.edu>

Thanks, will queue for 3.1.

> ---
>  arch/m68k/math-emu/fp_log.c |    3 ---
>  1 files changed, 0 insertions(+), 3 deletions(-)
>
> diff --git a/arch/m68k/math-emu/fp_log.c b/arch/m68k/math-emu/fp_log.c
> index 367ecee..3384a52 100644
> --- a/arch/m68k/math-emu/fp_log.c
> +++ b/arch/m68k/math-emu/fp_log.c
> @@ -105,9 +105,6 @@ fp_fetoxm1(struct fp_ext *dest, struct fp_ext *src)
>
>        fp_monadic_check(dest, src);
>
> -       if (IS_ZERO(dest))
> -               return dest;
> -
>        return dest;
>  }
>
> --
> 1.7.2.5
>
>



-- 
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
