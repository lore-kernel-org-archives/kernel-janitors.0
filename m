From: Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Thu, 03 Sep 2020 09:05:09 +0000
Subject: Re: [PATCH][next] staging: media: atomisp: fix memory leak of object flash
Message-Id: <20200903110509.4542cdad@coco.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200902165852.201155-1-colin.king@canonical.com>
 <CAHp75Vda5jRqmgsCV=Z5e5NdwHiebBy_Xdb6dq2D7L-mqqsC_g@mail.gmail.com>
In-Reply-To: <CAHp75Vda5jRqmgsCV=Z5e5NdwHiebBy_Xdb6dq2D7L-mqqsC_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Colin King <colin.king@canonical.com>, Linux Media Mailing List <linux-media@vger.kernel.org>

Em Wed, 2 Sep 2020 21:15:31 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:

> On Wed, Sep 2, 2020 at 8:02 PM Colin King <colin.king@canonical.com> wrote:
> >
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > In the case where the call to lm3554_platform_data_func returns an
> > error there is a memory leak on the error return path of object
> > flash.  Fix this by adding an error return path that will free
> > flash and rename labels fail2 to fail3 and fail1 to fail2.
> >  
> 
> Wouldn't be proper fix to move to devm_kmalloc() and return
> dev_err_probe() where appropriate?

Actually, we prefer not using devm_*() at media subsystem.

Once we started migrating alloc stuff to use it. We end needing
to revert those, as it caused side effects related to lifecycle
management: some object were de-allocating too late. Others
with multiple interfaces (USB, pci) had even worse troubles.

Thanks,
Mauro
