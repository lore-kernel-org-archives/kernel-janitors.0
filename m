From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 18 Oct 2019 06:30:42 +0000
Subject: iommu/exynos: Checking a device_link_add() call in exynos_iommu_add_device()
Message-Id: <dfb07352-877b-0ed2-ea1b-5a4885cd740b@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, kernel-janitors@vger.kernel.org, Stephen McCamant <smccaman@umn.edu>, Kangjie Lu <kjlu@umn.edu>, LKML <linux-kernel@vger.kernel.org>, Navid Emamdoost <emamd001@umn.edu>, Aditya Pakki <pakki001@umn.edu>

Hello,

I tried another script for the semantic patch language out.
This source code analysis approach points out that the implementation
of the function “exynos_iommu_add_device” contains still
an unchecked call of the function “device_link_add”.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/iommu/exynos-iommu.c?id=0e2adab6cf285c41e825b6c74a3aa61324d1132c#n1253
https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/iommu/exynos-iommu.c#L1253

How do you think about to improve it?

* Which error code would you like to return for a failed
  device link addition at this place?

* Will it be needed to delete any links as exception handling?

Regards,
Markus
