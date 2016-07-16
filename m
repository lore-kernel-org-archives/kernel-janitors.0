From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 16 Jul 2016 15:27:37 +0000
Subject: Re: [patch] kconfig: Add some missing curly braces
Message-Id: <CAK7LNAS7EP+rJ2i8jxwRSA=LtXo-tCMkVez6QGg0DjkH7pwJ4w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160713223433.GA20475@mwanda>
In-Reply-To: <20160713223433.GA20475@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, "Luis R. Rodriguez" <mcgrof@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Michal Marek <mmarek@suse.com>

2016-07-14 7:34 GMT+09:00 Dan Carpenter <dan.carpenter@oracle.com>:
> There are missing curly braces here so we print some stuff to stderr
> which we hadn't intended.
>
> Fixes: 1c199f2878f6 ('kbuild: document recursive dependency limitation / resolution')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index 2432298..ff0feab 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -1127,11 +1127,12 @@ static void sym_check_print_recursive(struct symbol *last_sym)
>                                         break;
>                         }
>                 }
> -               if (stack->sym = last_sym)
> +               if (stack->sym = last_sym) {
>                         fprintf(stderr, "%s:%d:error: recursive dependency detected!\n",
>                                 prop->file->name, prop->lineno);
>                         fprintf(stderr, "For a resolution refer to Documentation/kbuild/kconfig-language.txt\n");
>                         fprintf(stderr, "subsection \"Kconfig recursive dependency limitations\"\n");
> +               }
>                 if (stack->expr) {
>                         fprintf(stderr, "%s:%d:\tsymbol %s %s value contains %s\n",
>                                 prop->file->name, prop->lineno,



Good catch!


BTW, another solution is to concatenate three messages into one.

if (stack->sym = last_sym)
         fprintf(stderr,
                 "%s:%d:error: recursive dependency detected!\n"
                 "For a resolution refer to
Documentation/kbuild/kconfig-language.txt\n"
                 "subsection \"Kconfig recursive dependency limitations\"\n",
                 prop->file->name, prop->lineno);


Personally, I prefer this.
It may be a matter of taste, though.

-- 
Best Regards
Masahiro Yamada
