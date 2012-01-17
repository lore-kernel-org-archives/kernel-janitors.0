From: Kumar Gala <galak@kernel.crashing.org>
Date: Tue, 17 Jan 2012 22:41:59 +0000
Subject: Re: [PATCH 12/15] arch/powerpc/sysdev/fsl_pci.c: add missing iounmap
Message-Id: <7BBF25FC-7FFA-4B35-A064-04D616327F12@kernel.crashing.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1326362117-29371-12-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1326362117-29371-12-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org


On Jan 12, 2012, at 3:55 AM, Julia Lawall wrote:

> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Add missing iounmap in error handling code, in a case where the function
> already preforms iounmap on some other execution path.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression e;
> statement S,S1;
> int ret;
> @@
> e = \(ioremap\|ioremap_nocache\)(...)
> ... when != iounmap(e)
> if (<+...e...+>) S
> ... when any
>    when != iounmap(e)
> *if (...)
>   { ... when != iounmap(e)
>     return ...; }
> ... when any
> iounmap(e);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
> arch/powerpc/sysdev/fsl_pci.c |    5 +++--
> 1 file changed, 3 insertions(+), 2 deletions(-)

applied to merge

- k
