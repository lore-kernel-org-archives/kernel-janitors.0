From: Jiri Slaby <jirislaby@gmail.com>
Date: Thu, 15 Jul 2010 06:46:29 +0000
Subject: Re: [PATCH 09/11] staging: comedi: formatting of pointers in printk()
Message-Id: <4C3EAEC5.8080908@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1279176172-5609-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1279176172-5609-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, Javier Martinez Canillas <martinez.javier@gmail.com>, Jiri Kosina <jkosina@suse.cz>, Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, Alexander Kurz <linux@kbdbabel.org>

On 07/15/2010 08:42 AM, Kulikov Vasiliy wrote:
> Use %p instead of %08x in printk().
> 
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

The name and parameters suggest to remove the function completely. (And
use print_hex_dump_bytes instead.)

>  
>  	for (i = 0; i < len; i++) {
>  		if (i % 16 = 0)
> -			printk("\n0x%08x:", (unsigned int)cptr);
> +			printk("\n%p:", cptr);
>  
>  		printk(" %02x", *(cptr++));
>  	}


-- 
js
