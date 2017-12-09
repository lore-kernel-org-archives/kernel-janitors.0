From: Helge Deller <deller@gmx.de>
Date: Sat, 09 Dec 2017 15:22:31 +0000
Subject: Re: [PATCH] parisc: Add missing curly braces in puts()
Message-Id: <b9dec23a-cf0f-9aac-fa5d-4a201eafb38c@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171209114524.kwsvkd4ui5jei4r3@mwanda>
In-Reply-To: <20171209114524.kwsvkd4ui5jei4r3@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, "James E.J. Bottomley" <jejb@parisc-linux.org>
Cc: linux-parisc@vger.kernel.org, kernel-janitors@vger.kernel.org

On 09.12.2017 12:45, Dan Carpenter wrote:
> Static analysis tools complain that we intended to have curly braces
> around this indent block.  Which is true.

No, it's not.
I think the existing indenting is simply wrong and thus the static 
analysis tool assumes it wrongly.
I'll check and fix either way.

Helge
 
> Fixes: 2f3c7b8137ef ("parisc: Add core code for self-extracting kernel")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/arch/parisc/boot/compressed/misc.c b/arch/parisc/boot/compressed/misc.c
> index 9345b44b86f0..432d33804a86 100644
> --- a/arch/parisc/boot/compressed/misc.c
> +++ b/arch/parisc/boot/compressed/misc.c
> @@ -121,10 +121,11 @@ int puts(const char *s)
>  	const char *nuline = s;
>  
>  	while ((nuline = strchr(s, '\n')) != NULL) {
> -		if (nuline != s)
> +		if (nuline != s) {
>  			pdc_iodc_print(s, nuline - s);
>  			pdc_iodc_print("\r\n", 2);
>  			s = nuline + 1;
> +		}
>  	}
>  	if (*s != '\0')
>  		pdc_iodc_print(s, strlen(s));
> 

