From: Shawn Guo <shawnguo@kernel.org>
Date: Tue, 23 Jun 2020 11:02:23 +0000
Subject: Re: ARM: imx6: add missing put_device() call in imx6q_suspend_init()
Message-Id: <20200623110222.GX30139@dragon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cf810c93-297c-c02c-9bba-8c3d097b8e31@web.de>
 <2ab2cc9f-c720-75ca-e20c-0e4236ff45fd@huawei.com>
 <1542979d-f7f6-bcf1-53c3-22b7c076ddc7@web.de>
 <20200623073220.GV30139@dragon>
 <5300cb30-2243-9bfe-125c-96e720cd1f29@web.de>
In-Reply-To: <5300cb30-2243-9bfe-125c-96e720cd1f29@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, Yu Kuai <yukuai3@huawei.com>, Anson Huang <Anson.Huang@nxp.com>, Fabio Estevam <festevam@gmail.com>, Russell King <linux@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>, Yi Zhang <yi.zhang@huawei.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, Jun 23, 2020 at 09:48:52AM +0200, Markus Elfring wrote:
> >>>> Do you find a previous update suggestion useful?
> >>>>
> >>>> ARM: imx6: Add missing put_device() call in imx6q_suspend_init()
> >>>> https://lore.kernel.org/linux-arm-kernel/5acd7308-f6e1-4b1e-c744-bb2e5fdca1be@web.de/
> >>>> https://lore.kernel.org/patchwork/patch/1151158/
> >>>> https://lkml.org/lkml/2019/11/9/125
> >> …
> >>> It is useful indeed.
> …
> >>> Any idea why these pathes didn't get applied ?
> >>
> >> I can make assumptions about the reasons for the possibly questionable handling
> >> of such patches.
> >
> > Markus,
> >
> > Could you resend it to my kernel.org address?
> 
> You can get relevant information from the referenced message archive interfaces,
> can't you?

Well, I'm asking you to resend to make sure the following:

 - Use correct maintainer mailbox address.
 - You still care about the patch.
 - The patch applies to v5.8-rc.

Shawn
