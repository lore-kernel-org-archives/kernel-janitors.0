From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 12 Mar 2010 18:34:51 +0000
Subject: Re: [PATCH 1/3] arch/mips/txx9/generic: init dynamic bin_attribute
Message-Id: <20100312183450.GC8736@core.coreip.homeip.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1268377431-11671-1-git-send-email-w.sang@pengutronix.de>
 <1268377431-11671-2-git-send-email-w.sang@pengutronix.de>
In-Reply-To: <1268377431-11671-2-git-send-email-w.sang@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <w.sang@pengutronix.de>
Cc: kernel-janitors@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, "Eric W. Biederman" <ebiederm@xmission.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org

On Fri, Mar 12, 2010 at 08:03:49AM +0100, Wolfram Sang wrote:
> Commit 6992f5334995af474c2b58d010d08bc597f0f2fe introduced this requirement.
> Found with coccinelle, but fixed manually. Compile tested on X86 where
> possible.
> 

Regarding all 3 - it looks like these dynamically alocated attributes
could be converted to statically allocated ones. I'd recommend doing
that instead (in fact, I posted patch for the firmware_class couple days
ago).

> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Eric W. Biederman <ebiederm@xmission.com>
> ---
>  arch/mips/txx9/generic/setup.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/mips/txx9/generic/setup.c b/arch/mips/txx9/generic/setup.c
> index 7174d83..95184a0 100644
> --- a/arch/mips/txx9/generic/setup.c
> +++ b/arch/mips/txx9/generic/setup.c
> @@ -956,6 +956,7 @@ void __init txx9_sramc_init(struct resource *r)
>  	if (!dev->base)
>  		goto exit;
>  	dev->dev.cls = &txx9_sramc_sysdev_class;
> +	sysfs_bin_attr_init(&dev->bindata_attr);
>  	dev->bindata_attr.attr.name = "bindata";
>  	dev->bindata_attr.attr.mode = S_IRUSR | S_IWUSR;
>  	dev->bindata_attr.read = txx9_sram_read;

-- 
Dmitry
