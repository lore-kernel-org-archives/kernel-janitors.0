From: "=?ISO-8859-2?Q?Marcin_=A6lusarz?=" <marcin.slusarz@gmail.com>
Date: Mon, 16 Apr 2007 20:45:32 +0000
Subject: Re: [KJ] Trivial patch:changing const char foo* to const char foo[]
Message-Id: <4bacf17f0704161345s2b800704j8c3e99fae7d433d4@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1176707983.13603.9.camel@bluegenie>
In-Reply-To: <1176707983.13603.9.camel@bluegenie>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

2007/4/16, surya.prabhakar@wipro.com <surya.prabhakar@wipro.com>:
> Files modified
>
> arch/i386/boot/compressed/relocs.c
> arch/i386/kernel/vmi.c
>
> As suggested by Jeff Garzik,
> ----
> >The string form [const] char *foo = "blah";
> >creates two variables in the final assembly output, a static string,
> >and
> >a char pointer to the static string. The alternate string form
> >[const] char foo[] = "blah"; is better because it declares a single
> >variable.
> ------
>
> Cleaned up for the new modifications.
>
>
> Signed-off-by: Surya Prabhakar <surya.prabhakar@wipro.com>
> ---
>
> diff --git a/arch/i386/boot/compressed/relocs.c
> b/arch/i386/boot/compressed/relocs.c
> index ce4fda2..0beeea1 100644
> --- a/arch/i386/boot/compressed/relocs.c
> +++ b/arch/i386/boot/compressed/relocs.c
> @@ -71,7 +71,7 @@ static const char *sym_type(unsigned type)
>                 SYM_TYPE(STT_TLS),
>  #undef SYM_TYPE
>         };
> -       const char *name = "unknown sym type name";
> +       const char name[] = "unknown sym type name";
>         if (type < ARRAY_SIZE(type_name)) {
>                 name = type_name[type];
>         }
> @@ -87,7 +87,7 @@ static const char *sym_bind(unsigned bind)
>                 SYM_BIND(STB_WEAK),
>  #undef SYM_BIND
>         };
> -       const char *name = "unknown sym bind name";
> +       const char name[] = "unknown sym bind name";
>         if (bind < ARRAY_SIZE(bind_name)) {
>                 name = bind_name[bind];
>         }
> @@ -104,7 +104,7 @@ static const char *sym_visibility(unsigned
> visibility)
>                 SYM_VISIBILITY(STV_PROTECTED),
>  #undef SYM_VISIBILITY
>         };
> -       const char *name = "unknown sym visibility name";
> +       const char name[] = "unknown sym visibility name";
>         if (visibility < ARRAY_SIZE(visibility_name)) {
>                 name = visibility_name[visibility];
>         }
> @@ -128,7 +128,7 @@ static const char *rel_type(unsigned type)
>                 REL_TYPE(R_386_GOTPC),
>  #undef REL_TYPE
>         };
> -       const char *name = "unknown type rel type name";
> +       const char name[] = "unknown type rel type name";
>         if (type < ARRAY_SIZE(type_name)) {
>                 name = type_name[type];
>         }
> diff --git a/arch/i386/kernel/vmi.c b/arch/i386/kernel/vmi.c
> index edc339f..895f546 100644
> --- a/arch/i386/kernel/vmi.c
> +++ b/arch/i386/kernel/vmi.c
> @@ -599,9 +599,9 @@ static inline int __init check_vmi_rom(struct
> vrom_header *rom)
>  {
>         struct pci_header *pci;
>         struct pnp_header *pnp;
> -       const char *manufacturer = "UNKNOWN";
> -       const char *product = "UNKNOWN";
> -       const char *license = "unspecified";
> +       const char manufacturer[] = "UNKNOWN";
> +       const char product[] = "UNKNOWN";
> +       const char license[] = "unspecified";
>
>         if (rom->rom_signature != 0xaa55)
>                 return 0;
>
>

i don't think you compiled it :/
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
