From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 09 Jun 2013 19:17:32 +0000
Subject: Re: [PATCH] mtd: orion_nand: Improve error handling in orion_nand_probe
Message-Id: <20130609191732.GK28112@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1370768902-20239-1-git-send-email-emilgoode@gmail.com>
 <CAHp75VftwuS4ZTFP5D90PhyzrAMoHVxDiSCg0jrMGp+r0eRfzA@mail.gmail.com>
In-Reply-To: <CAHp75VftwuS4ZTFP5D90PhyzrAMoHVxDiSCg0jrMGp+r0eRfzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: andrew@lunn.ch, Bill Pemberton <wfp5p@virginia.edu>, artem.bityutskiy@linux.intel.com, Jingoo Han <jg1.han@samsung.com>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Emil Goode <emilgoode@gmail.com>, linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>

On Sun, Jun 09, 2013 at 08:15:20PM +0300, Andy Shevchenko wrote:
> On Sun, Jun 9, 2013 at 12:08 PM, Emil Goode <emilgoode@gmail.com> wrote:
> > This patch fixes some issues in the error handling and simplifies
> > the code by converting to devm* functions.
> >
> > If the kzalloc call fails it is unnecessary to use the label no_res
> > and pass a NULL pointer to kfree. If the devm_kzalloc call fails on
> > line 110 we forgett to call iounmap for the previous ioremap call.
> 
> "forget" (typo here)
> 
> > The following changes are introduced:
> > - Convert to devm_kzalloc and remove calls to kfree.
> > - Convert to devm_ioremap_resource that adds a missing call to
> >   *request_mem_region and remove calls to iounmap.
> > - The devm_ioremap_resource function checks the passed resource so
> >   we can remove the NULL check after the platform_get_resource call.
> 
> What about another patch (that I guess should go first)  that converts
> printk to dev_* or pr_*?
> 

Huh, what?  Those are two totally unrelated things.  Emil's patch is
a bug fix.

Patches are applied in first come first serve order anyway, so I'm
not sure what you are saying.

regards,
dan carpenter

