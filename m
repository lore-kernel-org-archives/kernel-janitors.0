From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Sat, 06 Jun 2015 23:35:02 +0000
Subject: Re: [17/29] drivers/rtc: simplify use of devm_ioremap_resource
Message-Id: <20150606233502.GC3563@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376471493-22215-18-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376471493-22215-18-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Alessandro Zummo <a.zummo@towertech.it>, kernel-janitors@vger.kernel.org, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org

On 14/08/2013 at 11:11:21 +0200, Julia Lawall wrote :
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Remove unneeded error handling on the result of a call to
> platform_get_resource when the value is passed to devm_ioremap_resource.
> 
> Move the call to platform_get_resource adjacent to the call to
> devm_ioremap_resource to make the connection between them more clear.
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
>   ... when != res
> - if (res = NULL) { ... \(goto l;\|return ret;\) }
>   ... when != res
> + res = platform_get_resource(pdev, IORESOURCE_MEM, n);
>   e = devm_ioremap_resource(e1, res);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Rebased and applied, thanks.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
