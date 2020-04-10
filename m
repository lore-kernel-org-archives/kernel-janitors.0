From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 10 Apr 2020 08:30:11 +0000
Subject: Re: usb: gadget: fsl: Fix a wrong judgment in fsl_udc_probe()
Message-Id: <aa7006c9-8b83-5f30-86a6-8d60d290f824@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200410015832.8012-1-tangbin@cmss.chinamobile.com>
 <be8cd229-884a-40e6-3363-7c4680a51b30@web.de>
 <0b718268-d330-dfc1-aca3-3dd3203363d7@cmss.chinamobile.com>
In-Reply-To: <0b718268-d330-dfc1-aca3-3dd3203363d7@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Tang Bin <tangbin@cmss.chinamobile.com>, linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Li Yang <leoyang.li@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>, Shengju Zhang <zhangshengju@cmss.chinamobile.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> Hardware experiments show that the negative return value is not just "-EPROBE_DEFER".

How much will this specific error code influence our understanding
of the discussed software situation?


>>> +        ret = udc_controller->irq ? : -ENODEV;
>> Will it be clearer to specify values for all cases in such a conditional operator
>> (instead of leaving one case empty)?
>
> I don't know what you mean of "instead of leaving one case empty".

I suggest to reconsider also the proposed specification “… ? : …”.

Regards,
Markus
