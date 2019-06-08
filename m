From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sat, 08 Jun 2019 17:26:35 +0000
Subject: Re: Coccinelle: api: add devm_platform_ioremap_resource script
Message-Id: <alpine.DEB.2.21.1906081925090.2543@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190406061112.31620-1-himanshujha199640@gmail.com>
 <f09006a3-691c-382a-23b8-8e9ff5b4a5f1@web.de>
In-Reply-To: <f09006a3-691c-382a-23b8-8e9ff5b4a5f1@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Nicolas Palix <nicolas.palix@imag.fr>, Michal Marek <michal.lkml@markovi.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, cocci@systeme.lip6.fr



On Sat, 8 Jun 2019, Markus Elfring wrote:

> > +- e1 = devm_ioremap_resource(arg4, id);
> > ++ e1 = devm_platform_ioremap_resource(arg1, arg3);
>
> Can the following specification variant matter for the shown SmPL
> change approach?
>
> + e1 > +-     devm_ioremap_resource(arg4, id
> ++     devm_platform_ioremap_resource(arg1, arg3
> +                           );

In the latter case, the original formatting of e1 will be preserved.  But
there is not usually any interesting formatting on the left side of an
assignment (ie typically no newlines or comments).  I can see no purpose
to factorizing the right parenthesis.

julia
