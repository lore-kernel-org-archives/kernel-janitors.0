From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 28 Oct 2019 21:20:25 +0000
Subject: phy: tegra: xusb: Complete exception handling in five probe functions
Message-Id: <fe6868a4-01f5-2832-9081-7643be0ab4a1@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-tegra@vger.kernel.org, JC Kuo <jckuo@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>, Thierry Reding <treding@nvidia.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Kangjie Lu <kjlu@umn.edu>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>

Hello,

I have taken another look also at the implementations of five probe functio=
ns.
I have got the impression then that the exception handling is incomplete so=
 far
at these source code places.
https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/phy/tegra/xusb-teg=
ra124.c#L608
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/phy/tegra/xusb-tegra124.c?id=8005803a2ca0af49f36f6e9329b5ecda3df27347#=
n608

How do you think about to move kfree() calls to other jump targets
according to the Linux coding style?

Regards,
Markus
