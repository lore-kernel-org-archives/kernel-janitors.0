From: Paulo Marques <pmarques@grupopie.com>
Date: Wed, 03 Aug 2011 11:36:04 +0000
Subject: Re: [PATCH] Use resource_size()
Message-Id: <4E3932A4.7030101@grupopie.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312303347.2629.17.camel@localhost.localdomain>
In-Reply-To: <1312303347.2629.17.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Meyer <thomas@m3y3r.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Thomas Meyer wrote:
>  Use resource_size function on resource object
>  instead of explicit computation.
> 
>  The semantic patch that makes this output is available
>  in scripts/coccinelle/api/resource_size.cocci.
> 
>  More information about semantic patching is available at
>  http://coccinelle.lip6.fr/
> 

[...]

> diff -u -p a/drivers/xen/xen-pciback/conf_space_header.c b/drivers/xen/xen-pciback/conf_space_header.c
> --- a/drivers/xen/xen-pciback/conf_space_header.c 2011-07-26 00:46:09.730171570 +0200
> +++ b/drivers/xen/xen-pciback/conf_space_header.c 2011-08-01 23:02:39.180421787 +0200
> @@ -187,7 +187,7 @@ static inline void read_dev_bar(struct p
>  
>  	bar_info->val = res[pos].start |
>  			(res[pos].flags & PCI_REGION_FLAG_MASK);
> -	bar_info->len_val = res[pos].end - res[pos].start + 1;
> +	bar_info->len_val = resource_size(res);

I didn't look at the code around this, but looking just at the patch,
this seems like it should be:

bar_info->len_val = resource_size(&res[pos]);

or something like that...

-- 
Paulo Marques - www.grupopie.com

"As far as we know, our computer has never had an undetected error."
Weisert
