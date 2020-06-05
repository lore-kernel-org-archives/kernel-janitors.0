From: "yukuai (C)" <yukuai3@huawei.com>
Date: Fri, 05 Jun 2020 09:08:37 +0000
Subject: Re: [PATCH] ARM: imx6: add missing put_device() call in imx6q_suspend_init()
Message-Id: <2ab2cc9f-c720-75ca-e20c-0e4236ff45fd@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cf810c93-297c-c02c-9bba-8c3d097b8e31@web.de>
In-Reply-To: <cf810c93-297c-c02c-9bba-8c3d097b8e31@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Cc: Anson Huang <Anson.Huang@nxp.com>, Yi Zhang <yi.zhang@huawei.com>, Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, kernel-janitors@vger.kernel.org, Russell King <linux@armlinux.org.uk>, LKML <linux-kernel@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>

On 2020/6/5 3:07, Markus Elfring wrote:
>> if of_find_device_by_node() succeed, imx6q_suspend_init() doesn't have a
>> corresponding put_device(). Thus add a jump target to fix the exception
>> handling for this function implementation.
> 
> Do you find a previous update suggestion useful?
> 
> ARM: imx6: Add missing put_device() call in imx6q_suspend_init()
> https://lore.kernel.org/linux-arm-kernel/5acd7308-f6e1-4b1e-c744-bb2e5fdca1be@web.de/
> https://lore.kernel.org/patchwork/patch/1151158/
> https://lkml.org/lkml/2019/11/9/125

Hi, Markus

It is useful indeed. Although I didn't run cocci script, since it can 
produce too many false result which is hard to filter out.

BTW, I see you haver done the work already, I guess I won't send any 
patches related to 'missing put_device after of_find_device_by_node()'. 
Any idea why these pathes didn't get applied ?

Best regards,
Yu Kuai
