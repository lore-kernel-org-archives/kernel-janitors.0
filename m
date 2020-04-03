From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 03 Apr 2020 19:26:47 +0000
Subject: Re: [PATCH] ipmi: bt-bmc: Avoid unnecessary judgement
Message-Id: <6a0e9e0c-e6f3-139e-ae21-83a2e293ef35@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tang Bin <tangbin@cmss.chinamobile.com>, openipmi-developer@lists.sourceforge.net, Arnd Bergmann <arnd@arndb.de>, Corey Minyard <minyard@acm.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> In this function,it will only trigger ifdevice and driver match,and
> the driver has already used the device tree, so the judgement here is
> unnecessary.

Please improve also this commit message (besides a typo).

Regards,
Markus
