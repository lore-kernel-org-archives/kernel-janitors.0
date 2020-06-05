From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 05 Jun 2020 10:15:32 +0000
Subject: Re: ARM: imx6: add missing put_device() call in imx6q_suspend_init()
Message-Id: <1542979d-f7f6-bcf1-53c3-22b7c076ddc7@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cf810c93-297c-c02c-9bba-8c3d097b8e31@web.de>
 <2ab2cc9f-c720-75ca-e20c-0e4236ff45fd@huawei.com>
In-Reply-To: <2ab2cc9f-c720-75ca-e20c-0e4236ff45fd@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Yu Kuai <yukuai3@huawei.com>, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Cc: Anson Huang <Anson.Huang@nxp.com>, Yi Zhang <yi.zhang@huawei.com>, Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, kernel-janitors@vger.kernel.org, Russell King <linux@armlinux.org.uk>, LKML <linux-kernel@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>

>> Do you find a previous update suggestion useful?
>>
>> ARM: imx6: Add missing put_device() call in imx6q_suspend_init()
>> https://lore.kernel.org/linux-arm-kernel/5acd7308-f6e1-4b1e-c744-bb2e5fd=
ca1be@web.de/
>> https://lore.kernel.org/patchwork/patch/1151158/
>> https://lkml.org/lkml/2019/11/9/125
=E2=80=A6
> It is useful indeed.

Thanks for your positive feedback.


> Although I didn't run cocci script, since it can produce too many false r=
esult
> which is hard to filter out.

Would you like to clarify any corresponding software analysis options?


> BTW, I see you haver done the work already, I guess I won't send any patc=
hes
> related to 'missing put_device after of_find_device_by_node()'.

You may continue also with contributions in such a direction.
I would like to point out that other developers occasionally got into the m=
ood
to improve implementation details in similar ways already.


> Any idea why these pathes didn't get applied ?

I can make assumptions about the reasons for the possibly questionable hand=
ling
of such patches.

Regards,
Markus
