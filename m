From: Shawn Guo <shawnguo@kernel.org>
Date: Tue, 23 Jun 2020 12:36:37 +0000
Subject: Re: ARM: imx6: add missing put_device() call in imx6q_suspend_init()
Message-Id: <CAJBJ56J9NfYPxnqtLfbeCHkRy2-xPEUJq7r3RvM8yi434AQF2Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cf810c93-297c-c02c-9bba-8c3d097b8e31@web.de> <2ab2cc9f-c720-75ca-e20c-0e4236ff45fd@huawei.com>
 <1542979d-f7f6-bcf1-53c3-22b7c076ddc7@web.de> <20200623073220.GV30139@dragon>
 <5300cb30-2243-9bfe-125c-96e720cd1f29@web.de> <20200623110222.GX30139@dragon>
 <9f429c51-0fa9-16dc-4d62-d456551c5376@web.de> <20200623120919.GE30139@dragon> <66038b6c-6691-eda2-af15-f315270d4bee@web.de>
In-Reply-To: <66038b6c-6691-eda2-af15-f315270d4bee@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>, Yu Kuai <yukuai3@huawei.com>, Anson Huang <Anson.Huang@nxp.com>, Fabio Estevam <festevam@gmail.com>, Russell King <linux@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>, Yi Zhang <yi.zhang@huawei.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, Jun 23, 2020 at 8:29 PM Markus Elfring <Markus.Elfring@web.de> wrot=
e:
>
> >>>>>>>> ARM: imx6: Add missing put_device() call in imx6q_suspend_init()
> >>>>>>>> https://lore.kernel.org/linux-arm-kernel/5acd7308-f6e1-4b1e-c744=
-bb2e5fdca1be@web.de/
> >>>>>>>> https://lore.kernel.org/patchwork/patch/1151158/
> >>>>>>>> https://lkml.org/lkml/2019/11/9/125
> =E2=80=A6
> >>>  - The patch applies to v5.8-rc.
> >>
> >> Would you like to try it out if my proposal is still valid?
>
> Are you going to compare the published patches any further?
>
>
> >> Does the change approach by Yu Kuai supersede it?
>
> Which patch variant will be integrated finally?

Just picked up Yu Kuai's patch.

Shawn
