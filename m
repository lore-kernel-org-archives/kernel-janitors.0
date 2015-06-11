From: Joerg Roedel <joro@8bytes.org>
Date: Thu, 11 Jun 2015 07:43:53 +0000
Subject: Re: [patch -next] iommu: checking for NULL instead of IS_ERR
Message-Id: <20150611074353.GH20384@8bytes.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150610105926.GA21772@mwanda>
In-Reply-To: <20150610105926.GA21772@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: iommu@lists.linux-foundation.org, kernel-janitors@vger.kernel.org

On Wed, Jun 10, 2015 at 01:59:27PM +0300, Dan Carpenter wrote:
> The iommu_group_alloc() and iommu_group_get_for_dev() functions return
> error pointers, they never return NULL.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.
