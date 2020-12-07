From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 07 Dec 2020 16:01:56 +0000
Subject: Re: [PATCH] media: i2c: ov02a10: fix an uninitialized return
Message-Id: <CACT4Y+a3MnDamodmVi6C79+fUEse+71DSG8xPQH7S3Eg4i=S_A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X84nbdgv0a/ak2ef@mwanda> <20201207131446.GA852@paasikivi.fi.intel.com>
 <CAHp75Vftvtn4DhOU73w7hgOYpw9pJbJCJ0dSW6wUrQHA5HMn-A@mail.gmail.com>
In-Reply-To: <CAHp75Vftvtn4DhOU73w7hgOYpw9pJbJCJ0dSW6wUrQHA5HMn-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Arnd Bergmann <arnd.bergmann@linaro.org>, kbuild test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>, Dongchun Zhu <dongchun.zhu@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, kernel-janitors@vger.kernel.org, workflows@vger.kernel.org, kernelci@groups.io

On Mon, Dec 7, 2020 at 4:55 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> +Cc: some people who involved in different kernel source checkers
>
> On Mon, Dec 7, 2020 at 3:19 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> > On Mon, Dec 07, 2020 at 04:00:29PM +0300, Dan Carpenter wrote:
> > > The "ret" variable isn't set on the no-op path where we are setting to
> > > on/off and it's in the on or off state already.
> > >
> > > Fixes: 91807efbe8ec ("media: i2c: add OV02A10 image sensor driver")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > Thanks for the patch.
> >
> > This issue has been fixed by another patch here:
> >
> > <URL:https://patchwork.linuxtv.org/project/linux-media/patch/20201204082037.1658297-1-arnd@kernel.org/>
>
> This has been reported by 3 or 4 different people. I'm wondering if
> it's possible to introduce a common database to somehow reduce the
> amount of patches against the same findings.

+workflows and kernelci re multiple reports/patches for the same kernel bug

I think KernelCI DB effort has a goal of fighting this duplication of
efforts. But as far as I understand the exact mechanism for
deduplication is an open question.
