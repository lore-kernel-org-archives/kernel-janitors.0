From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 03 Apr 2020 19:02:50 +0000
Subject: Re: [PATCH] ipmi: bt-bcm: Use platform_get_irq_optional()
Message-Id: <e5d4574d-cc8d-a24d-9c76-f32390b0472b@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Tang Bin <tangbin@cmss.chinamobile.com>, Arnd Bergmann <arnd@arndb.de>, Corey Minyard <minyard@acm.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openipmi-developer@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> In this function's reference function 'bt_bmc_probe()',

I have got understanding difficulties for this information.
Would you like to refer to the function “bt_bmc_config_irq”?


> there are judgments of print message about 'bt_bmc->irq',

Would an other wording be nicer?


> so use platform_get_irq_optional() instead of platform_get_irq()
> to avoid redundant dev_err() message.

Will a separate sentence be helpful?

How do you think about another bit of fine-tuning for the commit message?

Regards,
Markus
