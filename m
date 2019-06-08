From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 08 Jun 2019 15:24:05 +0000
Subject: Re: Coccinelle: api: add devm_platform_ioremap_resource script
Message-Id: <f09006a3-691c-382a-23b8-8e9ff5b4a5f1@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190406061112.31620-1-himanshujha199640@gmail.com>
In-Reply-To: <20190406061112.31620-1-himanshujha199640@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Himanshu Jha <himanshujha199640@gmail.com>, Julia Lawall <julia.lawall@lip6.fr>
Cc: Nicolas Palix <nicolas.palix@imag.fr>, Michal Marek <michal.lkml@markovi.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, cocci@systeme.lip6.fr

> +- e1 = devm_ioremap_resource(arg4, id);
> ++ e1 = devm_platform_ioremap_resource(arg1, arg3);

Can the following specification variant matter for the shown SmPL
change approach?

+ e1 +-     devm_ioremap_resource(arg4, id
++     devm_platform_ioremap_resource(arg1, arg3
+                           );


Regards,
Markus
