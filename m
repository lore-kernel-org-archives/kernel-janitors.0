From: Tang Bin <tangbin@cmss.chinamobile.com>
Date: Fri, 10 Apr 2020 02:52:50 +0000
Subject: Re: Input: ep93xx_keypad: Checking for a failed platform_get_irq()call in ep93xx_keypad_probe()
Message-Id: <55fdfd83-dc4f-36e9-b8a7-96ad4881a2ce@cmss.chinamobile.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <11aecb68-d243-2eeb-0cc8-50e1ec22bd71@web.de>
 <20200409204819.GR75430@dtor-ws>
In-Reply-To: <20200409204819.GR75430@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Markus Elfring <Markus.Elfring@web.de>
Cc: linux-input@vger.kernel.org, Allison Randal <allison@lohutok.net>, Arnd Bergmann <arnd@arndb.de>, H Hartley Sweeten <hsweeten@visionengravers.com>, Olof Johansson <olof@lixom.net>, Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi Dmitry:

On 2020/4/10 4:48, Dmitry Torokhov wrote:
> Platform code historically allowed creating IRQ resources with IRQ
> number 0 to indicate "no interrupt assigned", so this driver tries to
> filter out such conditions. The negative IRQs (errors) will be rejected
> by request_irq() but I guess we can lose -EPROBE_DEFER. We could do
>
> 	if (keypad->irq <= 0) {
> 		err = keypad->irq ?: -ENXIO : keypad->irq;
> 		goto failed_free;
> 	}
>
>
I have been aware of this problem for a few days, and by doing 
experiments on the hardware, I have found the following ways that maybe 
suitable：

     if (keypad->irq <= 0) {
         err = keypad->irq ? : -ENXIO;
         goto failed_free;
     }
     or
     if (keypad->irq <= 0) {
         err = keypad->irq < 0 ? keypad->irq : -ENXIO;
         goto failed_free;
     }

If you think it's usefull, I will send this patch to fix it.

Thanks

Tang Bin


>
