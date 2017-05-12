From: Helge Deller <deller@gmx.de>
Date: Fri, 12 May 2017 07:16:00 +0000
Subject: Re: [PATCH] parisc: fix spelling mistake: "page_tye" -> "page_type"
Message-Id: <99ebb069-a0da-db2a-3934-ae53b6fe897c@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170512055028.3030-1-colin.king@canonical.com>
In-Reply-To: <20170512055028.3030-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, "James E . J . Bottomley" <jejb@parisc-linux.org>, linux-parisc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 12.05.2017 07:50, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Trivial fix to spelling mistake in a pr_warn message.

Thanks Colin,

Interestingly, your patch is against my for-next git tree which I
haven't pushed upstream yet.
I'll fix it before pushing.

Btw, your patch title is wrong, it should be "error_tye" instead of "patch_tye"...

Thanks,
Helge



> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  arch/parisc/kernel/pdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/parisc/kernel/pdt.c b/arch/parisc/kernel/pdt.c
> index 261e134ee7f8..6362614c5160 100644
> --- a/arch/parisc/kernel/pdt.c
> +++ b/arch/parisc/kernel/pdt.c
> @@ -131,7 +131,7 @@ void __init pdc_pdt_init(void)
>  	}
>  
>  	for (i = 0; i < pdt_status.pdt_entries; i++) {
> -		pr_warn("PDT: BAD PAGE at 0x%08lx (error_tye = %lu)\n",
> +		pr_warn("PDT: BAD PAGE at 0x%08lx (error_type = %lu)\n",
>  			pdt_entry[i] & PAGE_MASK,
>  			pdt_entry[i] & 1);
>  
> 

