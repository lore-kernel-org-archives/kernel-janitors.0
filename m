From: Samuel Ortiz <sameo@linux.intel.com>
Date: Sun, 23 Sep 2012 19:01:03 +0000
Subject: Re: [mfd:for-next 68/75] drivers/mfd/palmas.c:392:49: error: 'struct palmas_platform_data' has no me
Message-Id: <20120923190103.GD28670@sortiz-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120922002556.GC5959@localhost>
In-Reply-To: <20120922002556.GC5959@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Fengguang,

On Sat, Sep 22, 2012 at 08:25:56AM +0800, Fengguang Wu wrote:
> Hi Graeme,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/sameo/mfd-2.6.git for-next
> head:   e8aa34dea0abcfb57cf814998b38b09ea97fc8dc
> commit: 44002179d60eba74d30d6a8f867b9de1a58a4bfb [68/75] mfd: palmas: Add pdata/data for rest of children
> config: x86_64-randconfig-s364 (attached as .config)
> 
> All related error/warning messages:
> 
> drivers/mfd/palmas.c: In function 'palmas_i2c_probe':
> drivers/mfd/palmas.c:392:49: error: 'struct palmas_platform_data' has no member named 'gpadc_pdata'
> drivers/mfd/palmas.c:393:54: error: 'struct palmas_platform_data' has no member named 'gpadc_pdata'
> drivers/mfd/palmas.c:395:52: error: 'struct palmas_platform_data' has no member named 'resource_pdata'
> drivers/mfd/palmas.c:397:17: error: 'struct palmas_platform_data' has no member named 'resource_pdata'
> drivers/mfd/palmas.c:399:47: error: 'struct palmas_platform_data' has no member named 'usb_pdata'
> drivers/mfd/palmas.c:400:52: error: 'struct palmas_platform_data' has no member named 'usb_pdata'
> drivers/mfd/palmas.c:402:47: error: 'struct palmas_platform_data' has no member named 'clk_pdata'
> drivers/mfd/palmas.c:403:52: error: 'struct palmas_platform_data' has no member named 'clk_pdata'
>
I forgot a git add...This is all fixed now, thanks for catching this up.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
