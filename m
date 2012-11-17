From: Joerg Roedel <joro@8bytes.org>
Date: Sat, 17 Nov 2012 12:26:10 +0000
Subject: Re: [PATCH 2/3] iommu/tegra-smmu.c: fix dentry reference leak in smmu_debugfs_stats_show().
Message-Id: <20121117122610.GA11220@8bytes.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1352666971-13551-1-git-send-email-tipecaml@gmail.com>
 <1352666971-13551-3-git-send-email-tipecaml@gmail.com>
In-Reply-To: <1352666971-13551-3-git-send-email-tipecaml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cyril Roelandt <tipecaml@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, joerg.roedel@amd.com, hdoyu@nvidia.com, swarren@nvidia.com

On Sun, Nov 11, 2012 at 09:49:30PM +0100, Cyril Roelandt wrote:
> Call to d_find_alias() needs a corresponding dput().
> 
> Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>

Applied to iommu/fixes, thanks.

