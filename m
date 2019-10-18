From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 18 Oct 2019 07:00:14 +0000
Subject: iommu/rockchip: Checking a device_link_add() call in rk_iommu_add_device()
Message-Id: <c4a1fdd2-4383-dd0f-1d4b-f27ab62b383e@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>, =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, kernel-janitors@vger.kernel.org, Stephen McCamant <smccaman@umn.edu>, Kangjie Lu <kjlu@umn.edu>, LKML <linux-kernel@vger.kernel.org>, Navid Emamdoost <emamd001@umn.edu>, Aditya Pakki <pakki001@umn.edu>

Hello,

I tried another script for the semantic patch language out.
This source code analysis approach points out that the implementation
of the function “rk_iommu_add_device” contains still
an unchecked call of the function “device_link_add”.
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/iommu/rockchip-iommu.c?id=3ef845da3c3b180ddd386e228ac3228d84a522d3#n1075
https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/iommu/rockchip-iommu.c#L1071

How do you think about to improve it?

Which error code would you like to return for a failed
device link addition at this place?

Regards,
Markus
