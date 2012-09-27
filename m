From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Thu, 27 Sep 2012 05:00:09 +0000
Subject: RE: [staging:staging-next 253/267] drivers/staging/comedi/drivers/s626.c:2516 s626_attach_pci() warn
Message-Id: <ADE657CA350FB648AAC2C43247A983F00206B1D33323@AUSP01VMBX24.collaborationhost.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120927011122.GC7205@localhost>
In-Reply-To: <20120927011122.GC7205@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wednesday, September 26, 2012 6:11 PM, Fengguang Wu wrote:
>
> FYI, there are new smatch warnings show up in
>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-next
> head:   3cd73bc1cf59b2c9232d9889ba2b148e262054b6
> commit: 8c7e4277c1197d31c0b34dbaf23e6edddb5978f7 [253/267] staging: comedi: s626: cleanup request_irq in s626_attach_pci()
>
>   drivers/staging/comedi/drivers/s626.c:1428 s626_ai_cmd() Error invalid range 4096 to -1
>   drivers/staging/comedi/drivers/s626.c:1448 s626_ai_cmd() Error invalid range 4096 to -1
>   drivers/staging/comedi/drivers/s626.c:1649 s626_ai_cmdtest() Error invalid range 4096 to -1
>   drivers/staging/comedi/drivers/s626.c:1656 s626_ai_cmdtest() Error invalid range 4096 to -1
>   drivers/staging/comedi/drivers/s626.c:2504 s626_attach_pci() warn: '(dev->private)->base_addr' was not released on error
>   drivers/staging/comedi/drivers/s626.c:2516 s626_attach_pci() warn: '(dev->private)->base_addr' was not released on error
> + drivers/staging/comedi/drivers/s626.c:2516 s626_attach_pci() warn: 'pcidev->irq' was not released on error

These shouldn't be "new" warnings. The logic of the code has
not been changed. Its just been shuffled around.

I'll take a look at the first four tommorrow just to make sure.
They may actually be a problem but they shouldn't be new.

The last three warnings should exist in _every_ comedi driver.
The comedi drivers are designed _not_ to release anything in
the "attach" functions. Everything gets released either in the
"detach" function or by the comedi core itself. I think it was
orignally modeled on the tty subsystem.

I plan on looking into if it would be cleaner for the "attach"
functions to cleanup after themselves on error. My initial
impression is that the patch to "fix" this is going to be huge...

Regards,
Hartley