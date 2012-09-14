From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 14 Sep 2012 04:18:26 +0000
Subject: Re: [gpio:for-next 9/33] ERROR: "irq_set_chip_and_handler_name" [drivers/gpio/gpio-pcf857x.ko] undef
Message-Id: <20120914041826.GA14274@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120914035026.GA14169@localhost>
In-Reply-To: <20120914035026.GA14169@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Sep 13, 2012 at 09:10:20PM -0700, Kuninori Morimoto wrote:
> 
> Hi Fengguang
> 
> Thank you for contacting me
> 
> > FYI, kernel build failed on
> > 
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git for-next
> > head:   c9bcf5cde5267509957099558f00400ede028cc5
> > commit: 6e20a0a429bd4dc07d6de16d9c247270e04e4aa0 [9/33] gpio: pcf857x: enable gpio_to_irq() support
> > config: x86_64-randconfig-s313 (attached as .config)
> > 
> > All related error/warning messages:
> > 
> > ERROR: "irq_set_chip_and_handler_name" [drivers/gpio/gpio-pcf857x.ko] undefined!
> > ERROR: "dummy_irq_chip" [drivers/gpio/gpio-pcf857x.ko] undefined!
> 
> I believe this issue was solved by these patches
> 
>   http://git.kernel.org/tip/17d83127d4c2b322dd8f217e0ac08c66eb403779
>   http://git.kernel.org/tip/b3ae66f209e8929db62b5a5f874ab2cdcf5ef1d4
> 
> These are accepted by Thomas

OK. Sorry I just added the gpio tree to auto build tests and it seems
the system is currently working on the old commits..

Thanks,
Fengguang
