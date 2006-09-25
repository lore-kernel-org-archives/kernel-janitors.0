From: Tobias Klauser <tklauser@distanz.ch>
Date: Mon, 25 Sep 2006 09:25:28 +0000
Subject: Re: [KJ] [PATCH] misc_register error return handling
Message-Id: <20060925092528.GL10725@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1159174740.25016.36.camel@amol.verismonetworks.com>
In-Reply-To: <1159174740.25016.36.camel@amol.verismonetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amol Lad <amol@verismonetworks.com>
Cc: kernel Janitors <kernel-janitors@lists.osdl.org>, linux-kernel@vger.kernel.org

On 2006-09-25 at 10:59:00 +0200, Amol Lad <amol@verismonetworks.com> wrote:
> Ignore previous patch (mail client linewrap issue...)
> 
> Some drivers do not handle failure of misc_register. 
> 
> Added return value checks appropriately in defaulting drivers
> 
> Tested with:
> - allmodconfig
> - Manually tweaking Kconfig/Makefiles to make sure that the changed
> files compiles without any errors/warnings
> 
> Signed-off-by: Amol Lad <amol@verismonetworks.com>
> ---
>  arch/i386/kernel/apm.c             |   23 +++++++++++++++++------
>  arch/um/drivers/mmapper_kern.c     |    6 ++++--
>  arch/x86_64/kernel/mce.c           |    6 +++++-
>  drivers/char/watchdog/ep93xx_wdt.c |    4 ++++
>  drivers/input/misc/hp_sdc_rtc.c    |    7 ++++++-
>  drivers/macintosh/apm_emu.c        |    8 +++++++-
>  drivers/macintosh/smu.c            |   11 ++++++++---
>  drivers/macintosh/via-pmu.c        |   11 ++++++++---

Split up by driver/subsystem, please.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
