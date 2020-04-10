From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 10 Apr 2020 05:45:40 +0000
Subject: Re: Input: ep93xx_keypad: Checking for a failed platform_get_irq() call in ep93xx_keypad_probe()
Message-Id: <279dd87a-bbc4-685d-b557-7914e4132b15@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <11aecb68-d243-2eeb-0cc8-50e1ec22bd71@web.de>
 <20200409204819.GR75430@dtor-ws>
In-Reply-To: <20200409204819.GR75430@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: Allison Randal <allison@lohutok.net>, Arnd Bergmann <arnd@arndb.de>, H Hartley Sweeten <hsweeten@visionengravers.com>, Olof Johansson <olof@lixom.net>, Thomas Gleixner <tglx@linutronix.de>, Tang Bin <tangbin@cmss.chinamobile.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, linux-doc@vger.kernel.org

> Platform code historically allowed creating IRQ resources with IRQ
> number 0 to indicate "no interrupt assigned", so this driver tries to
> filter out such conditions. The negative IRQs (errors) will be rejected
> by request_irq() but I guess we can lose -EPROBE_DEFER.

Thanks for this explanation.

* Should such information be better represented in the description for
  these programming interfaces?

* Can the software documentation become clearer anyhow?


> or, maybe we should take a look at platform_get_irq() and see if we can
> stop it returning 0 interrupt numbers and clean up the drivers.

Will further collateral evolution become interesting?

Regards,
Markus
