From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 15 Aug 2013 20:02:37 +0000
Subject: Re: [PATCH 1/29] pinctrl: nomadik: simplify use of devm_ioremap_resource
Message-Id: <CACRpkdbHS5WTSgPqh4WAtQatH1U4thROqXqY07Sre2vxh2XJZw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376471493-22215-1-git-send-email-Julia.Lawall@lip6.fr>
 <1376471493-22215-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376471493-22215-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Wed, Aug 14, 2013 at 11:11 AM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:

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

Patch applied.

Yours,
Linus Walleij
