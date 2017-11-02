From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 02 Nov 2017 21:06:44 +0000
Subject: Re: [PATCH] ARM: meson: fix spelling mistake: "Couln't" -> "Couldn't"
Message-Id: <CAFBinCAHRg8y-=ELPu3_tRnskjgPe6gXAG67tmEt75OeSBn-sw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171102092737.16957-1-colin.king@canonical.com>
In-Reply-To: <20171102092737.16957-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linus-amlogic@lists.infradead.org

On Thu, Nov 2, 2017 at 10:27 AM, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Trivial fix to spelling mistake in pr_err error message
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

thank you for catching and fixing this!

> ---
>  arch/arm/mach-meson/platsmp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-meson/platsmp.c b/arch/arm/mach-meson/platsmp.c
> index 2555f9056a33..cad7ee8f0d6b 100644
> --- a/arch/arm/mach-meson/platsmp.c
> +++ b/arch/arm/mach-meson/platsmp.c
> @@ -102,7 +102,7 @@ static void __init meson_smp_prepare_cpus(const char *scu_compatible,
>
>         scu_base = of_iomap(node, 0);
>         if (!scu_base) {
> -               pr_err("Couln't map SCU registers\n");
> +               pr_err("Couldn't map SCU registers\n");
>                 return;
>         }
>
> --
> 2.14.1
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

Regards
Martin
