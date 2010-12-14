From: Thiago Farina <tfransosi@gmail.com>
Date: Tue, 14 Dec 2010 16:17:26 +0000
Subject: Re: [PATCH] checkpatch.pl: fix 2 of 2 errors in ./kernek/panic.c
Message-Id: <AANLkTi=32w8Td-0ajaB5A9E6bE7g1-_hKk=oGcULHyFK@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1292333615-17860-1-git-send-email-toralf.foerster@gmx.de>
In-Reply-To: <1292333615-17860-1-git-send-email-toralf.foerster@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?UTF-8?Q?Toralf_F=C3=B6rster?= <toralf.foerster@gmx.de>
Cc: kernel-janitors@vger.kernel.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org

2010/12/14 Toralf Förster <toralf.foerster@gmx.de>:
>
> Signed-off-by: Toralf Förster <toralf.foerster@gmx.de>
> ---
>  kernel/panic.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/panic.c b/kernel/panic.c
> index 4c13b1a..13623e4 100644
> --- a/kernel/panic.c
> +++ b/kernel/panic.c
> @@ -56,7 +56,7 @@ EXPORT_SYMBOL(panic_blink);
>  *
>  *     This function never returns.
>  */
> -NORET_TYPE void panic(const char * fmt, ...)
> +NORET_TYPE void panic(const char *fmt, ...)
>  {
>        static char buf[1024];
>        va_list args;
> @@ -75,7 +75,7 @@ NORET_TYPE void panic(const char * fmt, ...)
>        va_start(args, fmt);
>        vsnprintf(buf, sizeof(buf), fmt, args);
>        va_end(args);
> -       printk(KERN_EMERG "Kernel panic - not syncing: %s\n",buf);
> +       printk(KERN_EMERG "Kernel panic - not syncing: %s\n", buf);
>  #ifdef CONFIG_DEBUG_BUGVERBOSE
>        dump_stack();
>  #endif

Can you put in the change log message the description of those errors
and resend?  Looking at this patch it seems they are just whitespace
changes or something very trivial like this.

The subject line could be something more like:
kernek/panic.c: Fix two checkpatch.pl errors:
