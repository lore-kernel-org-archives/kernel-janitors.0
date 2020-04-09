From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 09 Apr 2020 06:28:28 +0000
Subject: Re: usb: gadget: fsl_udc_core: Checking for a failed platform_get_irq() call in fsl_udc_probe()
Message-Id: <8fdf250a-8a69-b875-db43-b228db202f98@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <36341bb1-1e00-5eb1-d032-60dcc614ddaf@web.de>
 <CADRPPNRe=YxwjCOYbEjKg4LCOx2suK5WxZp17NJhTm76szdU0w@mail.gmail.com>
In-Reply-To: <CADRPPNRe=YxwjCOYbEjKg4LCOx2suK5WxZp17NJhTm76szdU0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Li Yang <leoyang.li@nxp.com>, linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tang Bin <tangbin@cmss.chinamobile.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

>> Would you like to reconsider the shown condition check?
>
> Thanks for the finding.  This is truly a software issue that need to
> be fixed.

I was unsure if I noticed another programming mistake.


> Would you submit a patch for it

Do other contributors know the affected software module better than me?


> or you want us to fix it?

I would find it nice if another developer will convert the bug report
into corresponding improvements.

Regards,
Markus
