From: Domen Puncer <domen@coderock.org>
Date: Fri, 06 Feb 2004 23:23:40 +0000
Subject: Re: [Kernel-janitors] [PATCH] drivers/video/radeonfb.c
Message-Id: <200402070023.40549.domen@coderock.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1075239420.3744.18.camel@ibm-d.pdx.osdl.net>
In-Reply-To: <1075239420.3744.18.camel@ibm-d.pdx.osdl.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Friday 06 of February 2004 23:31, Leann Ogasawara wrote:
> Hi all,
>
> Patch audits fb_alloc_cmap() and also incorporates an error path.
> Feedback appreciated.  Thanks,
>
...
> @@ -2806,7 +2809,9 @@
>  {
>  	struct radeonfb_info *rinfo;
>  	struct radeon_chip_info *rci = &radeon_chip_info[ent->driver_data];
> +        struct fb_info *info;

Spaces instead of tabs.
Do we really need this? It's only used once.

...

>  	/* map the regions */
>  	rinfo->mmio_base = (unsigned long) ioremap (rinfo->mmio_base_phys,
> RADEON_REGSIZE);

Turn off wordwrap.


	Domen

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
