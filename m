From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 09 Jun 2013 17:15:20 +0000
Subject: Re: [PATCH] mtd: orion_nand: Improve error handling in orion_nand_probe
Message-Id: <CAHp75VftwuS4ZTFP5D90PhyzrAMoHVxDiSCg0jrMGp+r0eRfzA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1370768902-20239-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1370768902-20239-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Emil Goode <emilgoode@gmail.com>
Cc: andrew@lunn.ch, artem.bityutskiy@linux.intel.com, Jingoo Han <jg1.han@samsung.com>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bill Pemberton <wfp5p@virginia.edu>, linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>

On Sun, Jun 9, 2013 at 12:08 PM, Emil Goode <emilgoode@gmail.com> wrote:
> This patch fixes some issues in the error handling and simplifies
> the code by converting to devm* functions.
>
> If the kzalloc call fails it is unnecessary to use the label no_res
> and pass a NULL pointer to kfree. If the devm_kzalloc call fails on
> line 110 we forgett to call iounmap for the previous ioremap call.

"forget" (typo here)

> The following changes are introduced:
> - Convert to devm_kzalloc and remove calls to kfree.
> - Convert to devm_ioremap_resource that adds a missing call to
>   *request_mem_region and remove calls to iounmap.
> - The devm_ioremap_resource function checks the passed resource so
>   we can remove the NULL check after the platform_get_resource call.

What about another patch (that I guess should go first)  that converts
printk to dev_* or pr_*?

--
With Best Regards,
Andy Shevchenko
