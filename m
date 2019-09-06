From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 06 Sep 2019 07:40:44 +0000
Subject: Re: [PATCH -next] coccinelle: platform_get_irq: Fix parse error
Message-Id: <970643a9-5f19-29ee-dde6-5b81c9038a04@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5d71eb6f.1c69fb81.31bc8.da2d@mx.google.com>
 <7818ad20-615c-2ce9-c0d1-3f7a09bedf34@web.de>
 <alpine.DEB.2.21.1909060857290.2975@hadrien>
In-Reply-To: <alpine.DEB.2.21.1909060857290.2975@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, cocci@systeme.lip6.fr
Cc: Stephen Boyd <swboyd@chromium.org>, YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Denis Efremov <efremov@linux.com>, Gilles Muller <Gilles.Muller@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Javier Martinez Canillas <javierm@redhat.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mark Brown <broonie@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>

>> I proposed something also during the development for this SmPL script.
>> https://lkml.org/lkml/2019/7/24/274
>> https://lore.kernel.org/r/c98b8f50-1adf-ea95-a91c-ec451e9fefe2@web.de/
>
> Markus,
>
> This is not the first time you have suggested to someone to do something
> that was simply incorrect.

We come along different application expectations.


> Please actually test your suggestions before proposing them.

I dare to express also “questionable” development ideas.


>> Should disjunctions eventually work in the semantic patch language also together with
>> comparison operators?
>> https://github.com/coccinelle/coccinelle/issues/40
>
> No.

Can a similar effect be achieved by using a SmPL constraint for
a metavariable of the type “binary operator”?
https://github.com/coccinelle/coccinelle/blob/b4509f6e7fb06d5616bb19dd5a110b203fd0e566/docs/manual/cocci_syntax.tex#L266


>> Will any additional software adjustments be taken into account?
>
> No.

I imagine that this view can change over time according to remaining feature requests.

Regards,
Markus
