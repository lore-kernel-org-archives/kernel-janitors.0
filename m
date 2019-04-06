From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 06 Apr 2019 12:36:04 +0000
Subject: Re: [PATCH] coccinelle: api: add devm_platform_ioremap_resource script
Message-Id: <842596fe-56ee-5732-1501-85ee95364406@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190406061112.31620-1-himanshujha199640@gmail.com>
In-Reply-To: <20190406061112.31620-1-himanshujha199640@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Himanshu Jha <himanshujha199640@gmail.com>, Julia Lawall <julia.lawall@lip6.fr>
Cc: Nicolas Palix <nicolas.palix@imag.fr>, Michal Marek <michal.lkml@markovi.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, cocci@systeme.lip6.fr

> +// Copyright: (C) 2019 Himanshu Jha GPLv2.

How do you think about to use a SPDX identifier?


> +// ---…

I would prefer a SmPL script without such comment lines as delimiters here.


> +position j0;

Would the variable name “p” be nicer?


> +@script:python depends on report && !patch@
> +e1 << r2.e1;
> +j0 << r2.j0;
> +@@
> +
> +msg = "WARNING: Use devm_platform_ioremap_resource for %s" % (e1)
> +coccilib.report.print_report(j0[0], msg)

I suggest to print such a message without the extra variable “msg”
because the string format expression can be passed directly.

Regards,
Markus
