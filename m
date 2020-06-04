From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 04 Jun 2020 19:07:55 +0000
Subject: Re: [PATCH] ARM: imx6: add missing put_device() call in imx6q_suspend_init()
Message-Id: <cf810c93-297c-c02c-9bba-8c3d097b8e31@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5acd7308-f6e1-4b1e-c744-bb2e5fdca1be@web.de>
In-Reply-To: <5acd7308-f6e1-4b1e-c744-bb2e5fdca1be@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yu Kuai <yukuai3@huawei.com>, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Cc: Anson Huang <Anson.Huang@nxp.com>, Fabio Estevam <festevam@gmail.com>, Russell King <linux@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Yi Zhang <yi.zhang@huawei.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

> if of_find_device_by_node() succeed, imx6q_suspend_init() doesn't have a
> corresponding put_device(). Thus add a jump target to fix the exception
> handling for this function implementation.

Do you find a previous update suggestion useful?

ARM: imx6: Add missing put_device() call in imx6q_suspend_init()
https://lore.kernel.org/linux-arm-kernel/5acd7308-f6e1-4b1e-c744-bb2e5fdca1be@web.de/
https://lore.kernel.org/patchwork/patch/1151158/
https://lkml.org/lkml/2019/11/9/125

Regards,
Markus
