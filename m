From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 16 Aug 2012 18:16:50 +0000
Subject: Re: [char-misc:char-misc-next 17/29] drivers/w1/masters/w1-gpio.c:72:7: error: 'struct w1_gpio_platf
Message-Id: <20120816181650.GA31978@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <502d3586.bFwIUoxLKw1xpfKw%fengguang.wu@intel.com>
In-Reply-To: <502d3586.bFwIUoxLKw1xpfKw%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Aug 17, 2012 at 02:01:42AM +0800, Fengguang Wu wrote:
> Hi Daniel,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-next
> head:   877cdf3949cc67d00677a1dfb913001f324ac40d
> commit: 5f3d1382e3ca39a54032784414f0ad4e7078b37e [17/29] onewire: w1-gpio: add DT bindings
> config: i386-randconfig-k729 (attached as .config)
> 
> All related error/warning messages:
> 
> drivers/w1/masters/w1-gpio.c: In function 'w1_gpio_probe_dt':
> drivers/w1/masters/w1-gpio.c:72:7: error: 'struct w1_gpio_platform_data' has no member named 'ext_pullup_enable_pin'
> 
> vim +72 drivers/w1/masters/w1-gpio.c
>     69			pdata->is_open_drain = 1;
>     70	
>     71		pdata->pin = of_get_gpio(np, 0);
>   > 72		pdata->ext_pullup_enable_pin = of_get_gpio(np, 1);
>     73		pdev->dev.platform_data = pdata;
>     74	
>     75		return 0;
> 
> ---
> 0-DAY kernel build testing backend         Open Source Technology Centre

You aren't kidding about 0 day kernel build testing, very nice job.

Yes, I got patches mixed up again, out of order, my fault, the patch
after this one should fix the build, right?

If not, please let us know.

greg k-h
