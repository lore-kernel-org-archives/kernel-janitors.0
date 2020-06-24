From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 24 Jun 2020 14:26:43 +0000
Subject: Re: ARM: imx6: add missing put_device() call in imx6q_suspend_init()
Message-Id: <770ba40a-920a-19c6-10bf-74c8a9739596@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cf810c93-297c-c02c-9bba-8c3d097b8e31@web.de>
 <2ab2cc9f-c720-75ca-e20c-0e4236ff45fd@huawei.com>
 <1542979d-f7f6-bcf1-53c3-22b7c076ddc7@web.de> <20200623073220.GV30139@dragon>
 <5300cb30-2243-9bfe-125c-96e720cd1f29@web.de> <20200623110222.GX30139@dragon>
 <9f429c51-0fa9-16dc-4d62-d456551c5376@web.de> <20200623120919.GE30139@dragon>
 <66038b6c-6691-eda2-af15-f315270d4bee@web.de>
 <CAJBJ56J9NfYPxnqtLfbeCHkRy2-xPEUJq7r3RvM8yi434AQF2Q@mail.gmail.com>
In-Reply-To: <CAJBJ56J9NfYPxnqtLfbeCHkRy2-xPEUJq7r3RvM8yi434AQF2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Shawn Guo <shawnguo@kernel.org>, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Cc: Anson Huang <Anson.Huang@nxp.com>, Yi Zhang <yi.zhang@huawei.com>, Sascha Hauer <s.hauer@pengutronix.de>, kernel-janitors@vger.kernel.org, Russell King <linux@armlinux.org.uk>, LKML <linux-kernel@vger.kernel.org>, Yu Kuai <yukuai3@huawei.com>, Fabio Estevam <festevam@gmail.com>

>> Are you going to compare the published patches any further?
…
>> Which patch variant will be integrated finally?
>
> Just picked up Yu Kuai's patch.

Is it interesting anyhow that you committed a change description
which contained a typo (on 2020-06-23 20:11:30 +0800)?
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/arch/arm/mach-imx/pm-imx6.c?id=0f92519843a05e97b58c6076edb23d747e8be262

Would it have been helpful to add the tag “Fixes”?

Regards,
Markus
