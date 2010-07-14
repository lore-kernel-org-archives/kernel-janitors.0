From: Joe Perches <joe@perches.com>
Date: Wed, 14 Jul 2010 18:21:44 +0000
Subject: Re: [PATCH 09/11] staging: msm: formatting of pointers in printk()
Message-Id: <1279131704.5816.3.camel@Joe-Laptop.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1279130717-15755-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1279130717-15755-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Dominik Brodowski <linux@dominikbrodowski.net>, Alexander Kurz <linux@kbdbabel.org>, Jiri Kosina <jkosina@suse.cz>, Javier Martinez Canillas <martinez.javier@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Wed, 2010-07-14 at 22:05 +0400, Kulikov Vasiliy wrote:
> Use %p instead of %08x in printk().
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
> ---
>  drivers/staging/comedi/drivers/quatech_daqp_cs.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/staging/comedi/drivers/quatech_daqp_cs.c b/drivers/staging/comedi/drivers/quatech_daqp_cs.c
> index 8d16380..8b49cb1 100644
> --- a/drivers/staging/comedi/drivers/quatech_daqp_cs.c
> +++ b/drivers/staging/comedi/drivers/quatech_daqp_cs.c
> @@ -208,7 +208,7 @@ static void hex_dump(char *str, void *ptr, int len)
>  
>  	for (i = 0; i < len; i++) {
>  		if (i % 16 = 0)
> -			printk("\n0x%08x:", (unsigned int)cptr);
> +			printk("\n%p:", cptr);
>  
>  		printk(" %02x", *(cptr++));
>  	}

I was originally going to suggest a conversion
to print_hex_dump, but this function isn't used
and it and daqp_dump might as well be removed.


