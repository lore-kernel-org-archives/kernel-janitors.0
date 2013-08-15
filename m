From: Guenter Roeck <linux@roeck-us.net>
Date: Thu, 15 Aug 2013 03:17:03 +0000
Subject: Re: [PATCH 10/29] drivers/watchdog/nuc900_wdt.c: simplify use of devm_ioremap_resource
Message-Id: <520C482F.5090806@roeck-us.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376471493-22215-1-git-send-email-Julia.Lawall@lip6.fr>
 <1376471493-22215-11-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376471493-22215-11-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On 08/14/2013 02:11 AM, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>
> Remove unneeded error handling on the result of a call to
> platform_get_resource when the value is passed to devm_ioremap_resource.
>
> A simplified version of the semantic patch that makes this change is as
> follows: (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @@
> expression pdev,res,n,e,e1;
> expression ret != 0;
> identifier l;
> @@
>
> - res = platform_get_resource(pdev, IORESOURCE_MEM, n);
>    ... when != res
> - if (res = NULL) { ... \(goto l;\|return ret;\) }
>    ... when != res
> + res = platform_get_resource(pdev, IORESOURCE_MEM, n);
>    e = devm_ioremap_resource(e1, res);
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>


