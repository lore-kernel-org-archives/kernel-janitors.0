From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 29 Apr 2020 09:13:15 +0000
Subject: Re: [PATCH] mailbox: Fix NULL vs IS_ERR() check in zynqmp_ipi_mbox_probe()
Message-Id: <1931070d-77fe-996c-3ce4-5400b1bd72cd@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>, Michal Simek <michal.simek@xilinx.com>, Wendy Liang <wendy.liang@xilinx.com>

> In case of error, the function devm_ioremap() returns NULL pointer
> not ERR_PTR().

Such information is helpful.


> The IS_ERR() test in the return value check should be replaced with NULL test.

Would you like to convert this description into an imperative wording?

Regards,
Markus
