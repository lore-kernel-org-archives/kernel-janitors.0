From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 01 Jun 2020 12:38:05 +0000
Subject: Re: [PATCH] iommu: Improve exception handling in iommu_group_alloc()
Message-Id: <9f8d8308-2056-8e33-7b38-0b7d96e51c3c@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Baolin Wang <baolin.wang@linux.alibaba.com>, =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>, iommu@lists.linux-foundation.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

> Optimize the error handling to free the resources correctly when
> failed to allocate an iommu group.

* I would not categorise the desired completion of exception handling
  as a software optimisation.

* Would you like to add the tag “Fixes” to the commit message?

* I suggest to avoid the specification of duplicate function calls.
  Will it be helpful to add a few jump targets?
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=3d77e6a8804abcc0504c904bd6e5cdf3a5cf8162#n455

Regards,
Markus
