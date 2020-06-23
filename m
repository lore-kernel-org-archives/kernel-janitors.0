From: Shawn Guo <shawnguo@kernel.org>
Date: Tue, 23 Jun 2020 07:32:21 +0000
Subject: Re: ARM: imx6: add missing put_device() call in imx6q_suspend_init()
Message-Id: <20200623073220.GV30139@dragon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cf810c93-297c-c02c-9bba-8c3d097b8e31@web.de>
 <2ab2cc9f-c720-75ca-e20c-0e4236ff45fd@huawei.com>
 <1542979d-f7f6-bcf1-53c3-22b7c076ddc7@web.de>
In-Reply-To: <1542979d-f7f6-bcf1-53c3-22b7c076ddc7@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Yu Kuai <yukuai3@huawei.com>, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, Anson Huang <Anson.Huang@nxp.com>, Fabio Estevam <festevam@gmail.com>, Russell King <linux@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>, Yi Zhang <yi.zhang@huawei.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Jun 05, 2020 at 12:15:32PM +0200, Markus Elfring wrote:
> >> Do you find a previous update suggestion useful?
> >>
> >> ARM: imx6: Add missing put_device() call in imx6q_suspend_init()
> >> https://lore.kernel.org/linux-arm-kernel/5acd7308-f6e1-4b1e-c744-bb2e5=
fdca1be@web.de/
> >> https://lore.kernel.org/patchwork/patch/1151158/
> >> https://lkml.org/lkml/2019/11/9/125
> =E2=80=A6
> > It is useful indeed.
>=20
> Thanks for your positive feedback.
>=20
>=20
> > Although I didn't run cocci script, since it can produce too many false=
 result
> > which is hard to filter out.
>=20
> Would you like to clarify any corresponding software analysis options?
>=20
>=20
> > BTW, I see you haver done the work already, I guess I won't send any pa=
tches
> > related to 'missing put_device after of_find_device_by_node()'.
>=20
> You may continue also with contributions in such a direction.
> I would like to point out that other developers occasionally got into the=
 mood
> to improve implementation details in similar ways already.
>=20
>=20
> > Any idea why these pathes didn't get applied ?
>=20
> I can make assumptions about the reasons for the possibly questionable ha=
ndling
> of such patches.

Markus,

Could you resend it to my kernel.org address?

Shawn
