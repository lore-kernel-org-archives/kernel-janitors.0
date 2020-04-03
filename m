From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 03 Apr 2020 19:45:21 +0000
Subject: Re: [PATCH] mailbox: armada-37xx-rwtm: Remove duplicate error messages in armada_37xx_mbox_probe()
Message-Id: <2f136a63-72d5-43ef-2a73-67d6984b848d@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tang Bin <tangbin@cmss.chinamobile.com>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> In this function,we don't need dev_err() message because when something
> goes wrong,platform_get_irq() and devm_platform_ioremap_resource() have
> print an error message itself, so we should remove duplicate dev_err().

I suggest further fine-tuning also for this commit message.

Regards,
Markus
