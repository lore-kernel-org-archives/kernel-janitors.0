From: Arnaldo Carvalho de Melo <acme@conectiva.com.br>
Date: Tue, 27 Jan 2004 21:53:47 +0000
Subject: Re: [Kernel-janitors] [PATCH] drivers/video/fbcmap.c kmalloc audit
Message-Id: <20040127220247.GA3586@conectiva.com.br>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1075239420.3744.18.camel@ibm-d.pdx.osdl.net>
In-Reply-To: <1075239420.3744.18.camel@ibm-d.pdx.osdl.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Em Tue, Jan 27, 2004 at 01:37:01PM -0800, Leann Ogasawara escreveu:
> Hi All,
> 
> Patch to audit kmalloc()'s and handle errors accordingly.  Thanks,
> 
> Leann
> 
> diffed against 2.6.2-rc2
> 
> === drivers/video/fbcmap.c 1.9 vs edited ==> --- 1.9/drivers/video/fbcmap.c	Mon Mar 31 13:51:12 2003
> +++ edited/drivers/video/fbcmap.c	Mon Jan 26 17:38:53 2004
> @@ -98,14 +98,14 @@
>  	if (!len)
>  	    return 0;
>  	if (!(cmap->red = kmalloc(size, GFP_ATOMIC)))
> -	    return -1;
> +	    goto err_red;
>  	if (!(cmap->green = kmalloc(size, GFP_ATOMIC)))
> -	    return -1;
> +	    goto err_green;
>  	if (!(cmap->blue = kmalloc(size, GFP_ATOMIC)))
> -	    return -1;
> +	    goto err_blue;
>  	if (transp) {
>  	    if (!(cmap->transp = kmalloc(size, GFP_ATOMIC)))
> -		return -1;
> +		goto err_transp;
>  	} else
>  	    cmap->transp = NULL;
>      }
> @@ -113,6 +113,17 @@
>      cmap->len = len;
>      fb_copy_cmap(fb_default_cmap(len), cmap, 0);
>      return 0;
> +
> + err_transp:
> +    kfree(cmap->blue);
> + err_blue:
> +    kfree(cmap->green);
> + err_green:
> +    kfree(cmap->red);
> + err_red:
> +    cmap->red = cmap->green = cmap->blue = cmap->transp = NULL;
> +    cmap->len = 0;
> +    return -1;

Looks good to me.

- Arnaldo
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
