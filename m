From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 02 Nov 2016 15:41:49 +0000
Subject: Re: [PATCH 01/10] scripts/basic/bin2c: Complete error handling in main()
Message-Id: <CAK7LNATU4VrN6wCo8vzETMJu6aX+SK+0un03ryzCg7-BW_LxqA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net> <44402655-ef0d-1e2f-0587-f17295a08aa3@users.sourceforge.net>
In-Reply-To: <44402655-ef0d-1e2f-0587-f17295a08aa3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

2016-10-28 17:31 GMT+09:00 SF Markus Elfring <elfring@users.sourceforge.net>:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 27 Oct 2016 16:15:04 +0200
>
> Return values were not checked from five calls of the function "printf".
>
> This issue was detected also by using the Coccinelle software.
>
>
> * Add a bit of exception handling there.
>
> * Optimise this function implementation a bit.
>
>   - Replace two output calls with the functions "fputs" and "puts".
>
>   - Use the preincrement operator for the variable "total".
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  scripts/basic/bin2c.c | 26 ++++++++++++++++----------
>  1 file changed, 16 insertions(+), 10 deletions(-)
>
> diff --git a/scripts/basic/bin2c.c b/scripts/basic/bin2c.c
> index c3d7eef..c6c8860 100644
> --- a/scripts/basic/bin2c.c
> +++ b/scripts/basic/bin2c.c
> @@ -8,29 +8,35 @@
>   */
>
>  #include <stdio.h>
> +#include <errno.h>
>
>  int main(int argc, char *argv[])
>  {
>         int ch, total = 0;
>
>         if (argc > 1)
> -               printf("const char %s[] %s=\n",
> -                       argv[1], argc > 2 ? argv[2] : "");
> +               if (printf("const char %s[] %s=\n",
> +                          argv[1], argc > 2 ? argv[2] : "") < 16)
> +                       return errno;
>
>         do {
> -               printf("\t\"");
> +               if (fputs("\t\"", stdout) < 0)
> +                       return errno;
> +
>                 while ((ch = getchar()) != EOF) {
> -                       total++;
> -                       printf("\\x%02x", ch);
> -                       if (total % 16 = 0)
> +                       if (printf("\\x%02x", ch) < 4)
> +                               return errno;
> +                       if (++total % 16 = 0)
>                                 break;
>                 }
> -               printf("\"\n");
> +
> +               if (puts("\"") < 0)
> +                       return errno;


Is replacing printf("\"\n") with puts("\"") optimization?


Frankly, the result of this patch
seems extremely unreadable code.


-- 
Best Regards
Masahiro Yamada
