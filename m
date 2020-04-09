From: Jason Wang <jasowang@redhat.com>
Date: Thu, 09 Apr 2020 06:20:38 +0000
Subject: Re: virtio-mmio: Delete an error message in vm_find_vqs()
Message-Id: <6c94db13-ae46-cf8e-f3c4-6f270112ad87@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9e27bc4a-cfa1-7818-dc25-8ad308816b30@web.de>
 <03b19e72-0021-dc6b-77c4-ed3c4e13d526@redhat.com>
 <96031fc7-dced-95bd-fc57-a5fe890638f4@web.de>
In-Reply-To: <96031fc7-dced-95bd-fc57-a5fe890638f4@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, "Michael S. Tsirkin" <mst@redhat.com>, virtualization@lists.linux-foundation.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javierm@redhat.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>, Stephen Boyd <swboyd@chromium.org>, Tang Bin <tangbin@cmss.chinamobile.com>


On 2020/4/9 下午2:02, Markus Elfring wrote:
>>> The function “platform_get_irq” can log an error already.
>>> Thus omit a redundant message for the exception handling in the
>>> calling function.
>> It looks to me that not all error path of platform_get_irq() were loggd.
> How do you think about to clarify the handling of the error code “-EPROBE_DEFER” any more?
> https://elixir.bootlin.com/linux/v5.6.3/source/drivers/base/platform.c#L202


Aha, it looks to me that I'm on the wrong branch. Sorry.


>
>
>> And git grep told me there're other users of platform_get_irq() that check and log by themselves.
> Source code analysis can point further update candidates out, can't it?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/base/platform.c?id=7723f4c5ecdb8d832f049f8483beb0d1081cedf6


Yes, it can.


>
> Would you like to achieve collateral evolution?


Yes and it's probably be better to put all the fixes in one series.

For this patch.

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks


>
> Regards,
> Markus
>
