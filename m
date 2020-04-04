From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 04 Apr 2020 16:01:57 +0000
Subject: Re: [PATCH] ARM: pxa: ssp: Delete an error message in pxa_ssp_probe()
Message-Id: <c6790c2f-7b10-8d7f-5bc7-84d07fd96632@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <524ae90a-a7cb-feee-6107-743c52c2b1e4@web.de>
 <CAHp75VcBKEJtEZg9wUVdqnSHWb3gaOx493GGWMtisdTAwxmGkA@mail.gmail.com>
In-Reply-To: <CAHp75VcBKEJtEZg9wUVdqnSHWb3gaOx493GGWMtisdTAwxmGkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andy.shevchenko@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Tang Bin <tangbin@cmss.chinamobile.com>, kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, Russell King <linux@armlinux.org.uk>, LKML <linux-kernel@vger.kernel.org>, Enrico Weigelt <lkml@metux.net>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Allison Randal <allison@lohutok.net>

>>         ssp->irq = platform_get_irq(pdev, 0);
>> -       if (ssp->irq < 0) {
>> -               dev_err(dev, "no IRQ resource defined\n");
>> +       if (ssp->irq < 0)
>>                 return -ENODEV;
>> -       }
>
> At the same time we can unshadow the error code, i.e.
>   return ssp->irq;

Have you got any preferences for the order of possible change combinations?

Regards,
Markus
