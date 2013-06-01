From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 01 Jun 2013 13:15:03 +0000
Subject: Re: [PATCH] usb: musb: Fix format specifier warning
Message-Id: <CAHp75Vd3frBwPa=DQiKrkkcPdOooBGUS=tYC6STw+o1gW1zf6Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1370031778-25965-1-git-send-email-emilgoode@gmail.com>
	<CAHp75VciHQKcyj-ANLdg=mg2C71zn=09Eentf22q+otGu=rp3w@mail.gmail.com>
	<51A926A4.5010800@infradead.org>
In-Reply-To: <51A926A4.5010800@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Emil Goode <emilgoode@gmail.com>, balbi@ti.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, USB <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, Jun 1, 2013 at 1:39 AM, Randy Dunlap <rdunlap@infradead.org> wrote:
> On 05/31/13 15:34, Andy Shevchenko wrote:
>> On Fri, May 31, 2013 at 11:22 PM, Emil Goode <emilgoode@gmail.com> wrote:
>>> This patch fixes a format specifier warning. dma_addr_t can be either
>>> u32 or u64 so we should cast to the largest type and change the format
>>> specifier to %llx.
>>
>> dma_addr_t is derived from phys_addr_t, thus you may use %pa specifier
>> which is available from v3.8(?).
>>
>> Something like this:
>> dma_addr_t src_addr;
>> dev_dbg(dev, "DMA addr: %pa\n", src_addr);
>
> Isn't that:
>
>   deb_dbg(dev, "DMA addr: %pa\n", &src_addr);

It's.
You are right.

--
With Best Regards,
Andy Shevchenko
