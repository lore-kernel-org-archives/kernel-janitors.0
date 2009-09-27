From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Date: Sun, 27 Sep 2009 18:21:50 +0000
Subject: Re: [PATCH] arch/parisc: correct use of SHF_ALLOC
Message-Id: <20090927182149.GA23464@hiauly1.hia.nrc.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0908042226231.3737@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0908042226231.3737@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Helge Deller <deller@gmx.de>, Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Kyle,

I noticed today that this change is not in 2.6.31.1.

Dave

On Tue, 04 Aug 2009, Julia Lawall wrote:

> From: Julia Lawall <julia@diku.dk>
> 
> SHF_ALLOC is suitable for testing against the sh_flags field, not the
> sh_type field.
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> 
> ---
>  arch/parisc/kernel/module.c         |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/parisc/kernel/module.c b/arch/parisc/kernel/module.c
> index ef5caf2..c904817 100644
> --- a/arch/parisc/kernel/module.c
> +++ b/arch/parisc/kernel/module.c
> @@ -853,7 +853,7 @@ int module_finalize(const Elf_Ehdr *hdr,
>  	 * ourselves */
>  	for (i = 1; i < hdr->e_shnum; i++) {
>  		if(sechdrs[i].sh_type = SHT_SYMTAB
> -		   && (sechdrs[i].sh_type & SHF_ALLOC)) {
> +		   && (sechdrs[i].sh_flags & SHF_ALLOC)) {
>  			int strindex = sechdrs[i].sh_link;
>  			/* FIXME: AWFUL HACK
>  			 * The cast is to drop the const from
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
