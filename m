From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 31 May 2013 22:34:54 +0000
Subject: Re: [PATCH] usb: musb: Fix format specifier warning
Message-Id: <CAHp75VciHQKcyj-ANLdg=mg2C71zn=09Eentf22q+otGu=rp3w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1370031778-25965-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1370031778-25965-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Emil Goode <emilgoode@gmail.com>
Cc: balbi@ti.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, USB <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, May 31, 2013 at 11:22 PM, Emil Goode <emilgoode@gmail.com> wrote:
> This patch fixes a format specifier warning. dma_addr_t can be either
> u32 or u64 so we should cast to the largest type and change the format
> specifier to %llx.

dma_addr_t is derived from phys_addr_t, thus you may use %pa specifier
which is available from v3.8(?).

Something like this:
dma_addr_t src_addr;
dev_dbg(dev, "DMA addr: %pa\n", src_addr);

--
With Best Regards,
Andy Shevchenko
