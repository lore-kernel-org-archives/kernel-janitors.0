From: James Simmons <jsimmons@infradead.org>
Date: Fri, 06 Feb 2004 23:26:26 +0000
Subject: [Kernel-janitors] Re: [PATCH] drivers/video/vfb.c fb_alloc_cmap()
Message-Id: <Pine.LNX.4.44.0402062325480.19559-100000@phoenix.infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1076106883.11883.1091.camel@ibm-d.pdx.osdl.net>
In-Reply-To: <1076106883.11883.1091.camel@ibm-d.pdx.osdl.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Good catch. Alot of drivers are broken in this way :-( will fix.


On Fri, 6 Feb 2004, Leann Ogasawara wrote:

> Hi All,
> 
> Patch audits fb_alloc_cmap() and adds error path.  Feedback welcome. 
> Thanks,
> 
> Leann
> 
> diffed against 2.6.2
> 
> === drivers/video/vfb.c 1.27 vs edited ==> --- 1.27/drivers/video/vfb.c	Thu Apr 24 03:30:41 2003
> +++ edited/drivers/video/vfb.c	Thu Feb  5 11:04:16 2004
> @@ -437,17 +437,28 @@
>  	fb_info.pseudo_palette = &vfb_pseudo_palette;
>  	fb_info.flags = FBINFO_FLAG_DEFAULT;
>  
> -	fb_alloc_cmap(&fb_info.cmap, 256, 0);
> +	retval = fb_alloc_cmap(&fb_info.cmap, 256, 0);
> +	if (retval) {
> +		retval = -ENOMEM;
> +		goto err_alloc_cmap;
> +	}
>  
>  	if (register_framebuffer(&fb_info) < 0) {
> -		vfree(videomemory);
> -		return -EINVAL;
> +		retval = -EINVAL;
> +		goto err_reg_fb;
>  	}
>  
>  	printk(KERN_INFO
>  	       "fb%d: Virtual frame buffer device, using %ldK of video
> memory\n",
>  	       fb_info.node, videomemorysize >> 10);
>  	return 0;
> +
> + err_reg_fb:
> +	fb_dealloc_cmap(&fb_info.cmap);
> +
> + err_alloc_cmap:
> +	vfree(videomemory);
> +	return retval;
>  }
>  
>  #ifdef MODULE
> @@ -455,6 +466,7 @@
>  static void __exit vfb_cleanup(void)
>  {
>  	unregister_framebuffer(&fb_info);
> +	fb_dealloc_cmap(&fb_info.cmap);
>  	vfree(videomemory);
>  }
>  
> 
> 
> 

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
