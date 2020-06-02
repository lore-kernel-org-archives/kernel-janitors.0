From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 02 Jun 2020 08:00:13 +0000
Subject: Re: [PATCH v2] iommu: Improve exception handling in iommu_group_alloc()
Message-Id: <c6f587ac-aebe-3aae-da0e-087dc7f78ac5@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Baolin Wang <baolin.wang@linux.alibaba.com>, =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>, iommu@lists.linux-foundation.org
Cc: Kangjie Lu <kjlu@umn.edu>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Qiushi Wu <wu000273@umn.edu>

> Improve the exception handling to free the resources correctly when
> failed to allocate an iommu group.

I propose to avoid the specification of duplicate function calls.
Will it become helpful to add a few jump targets?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/process/coding-style.rst?id=F359287765c04711ff54fbd11645271d8e5f=
f763#n455


> ---
>  drivers/iommu/iommu.c | 10 ++++++++--

I suggest to replace the triple dashes before this diffstat
by a blank line.

Regards,
Markus
