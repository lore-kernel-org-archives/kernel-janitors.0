From: Hiroshi Doyu <hdoyu@nvidia.com>
Date: Mon, 12 Nov 2012 07:39:35 +0000
Subject: Re: [PATCH 2/3] iommu/tegra-smmu.c: fix dentry reference leak in smmu_debugfs_stats_show().
Message-Id: <20121112.093935.1354253140075405263.hdoyu@nvidia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1352666971-13551-1-git-send-email-tipecaml@gmail.com><1352666971-13551-3-git-send-email-tipecaml@gmail.com>
In-Reply-To: <1352666971-13551-3-git-send-email-tipecaml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "tipecaml@gmail.com" <tipecaml@gmail.com>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "joro@8bytes.org" <joro@8bytes.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>

Cyril Roelandt <tipecaml@gmail.com> wrote @ Sun, 11 Nov 2012 21:49:30 +0100:

> Call to d_find_alias() needs a corresponding dput().
> 
> Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>
> ---

Thanks. Looks ok for me. Acked-by Hiroshi Doyu <hdoyu@nvidia.com>
