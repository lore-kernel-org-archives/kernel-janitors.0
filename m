From: Tony Lindgren <tony@atomide.com>
Date: Mon, 17 Sep 2012 16:56:43 +0000
Subject: Re: [omap:tmp-merge 31/47] drivers/mfd/twl-core.c:49:22: fatal error: plat/cpu.h: No such file or di
Message-Id: <20120917165643.GL4521@atomide.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120917003526.GB12394@localhost>
In-Reply-To: <20120917003526.GB12394@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: kernel-janitors@vger.kernel.org, linux-omap@vger.kernel.org

* Fengguang Wu <fengguang.wu@intel.com> [120916 17:41]:
> Hi Tony,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git tmp-merge
> head:   a742996f4643b4e9612fe081d146035964cfbd87
> commit: 7d7e1eba7e92c2f9c76db80adc24836e7a114bfb [31/47] ARM: OMAP2+: Prepare for irqs.h removal
> config: x86_64-randconfig-s331 (attached as .config)
> 
> All related error/warning messages:
> 
> drivers/mfd/twl-core.c:49:22: fatal error: plat/cpu.h: No such file or directory
> compilation terminated.
> 
> vim +49 drivers/mfd/twl-core.c
>     44	#include <linux/regulator/machine.h>
>     45	
>     46	#include <linux/i2c.h>
>     47	#include <linux/i2c/twl.h>
>     48	
>   > 49	#include <plat/cpu.h>
>     50	
>     51	#include "twl-core.h"
>     52	
>     53	/*
>     54	 * The TWL4030 "Triton 2" is one of a family of a multi-function "Power

OK thanks for letting me know. That include needs to be ifdeffed until
we remove all cpu_is_omap usage from drivers. I'll take a look and will
also check if other drivers may have the same issue.

Regards,

Tony
