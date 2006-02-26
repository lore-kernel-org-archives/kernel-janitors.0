From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Sun, 26 Feb 2006 04:50:13 +0000
Subject: Re: [KJ] [PATCH] check request_region return value
Message-Id: <1140929413.8088.10.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============70386160515893703=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200602242249.22568.tim@aapopfiets.nl>
In-Reply-To: <200602242249.22568.tim@aapopfiets.nl>
To: kernel-janitors@vger.kernel.org

--===============70386160515893703==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2006-02-24 at 22:49 +0100, Tim Cooijmans wrote:
> From: Tim Cooijmans <tim@aapopfiets.nl>
> 
> Check request_region return value in arch/powerpc/platform/chrp/setup.c.  
> Passed compilation.
> 
> Signed-off-by: Tim Cooijmans <tim@aapopfiets.nl>
> ---
> +
> +out_dma2:
> +	release_region(0x80,0x10);
> +out_dma_page_reg:
> +	release_region(0x40,0x20);
> +out_timer:
> +	release_region(0x00,0x20);
> +out_dma1:
> +	release_region(0xa0,0x20);
> +out_pic2:
> +	release_region(0x20,0x20);
> +out_pic1:
> +	return;
>  }
>  

This might sound a bit stupid, but why are you doing release_region
here ? As you can't warn the upstream code, it will presumably try to
use the regions anyway. Wouldn't it be better to just to warn on a
failure, and keep going as normal? leaving all the regions (that were
acquired) mapped, keeping breakage/(usage of unmapped regions) to a
minimum?

Darren Jenkins


--===============70386160515893703==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============70386160515893703==--
