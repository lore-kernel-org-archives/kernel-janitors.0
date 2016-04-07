From: Joerg Roedel <joro@8bytes.org>
Date: Thu, 07 Apr 2016 12:52:24 +0000
Subject: Re: [patch] iommu/vt-d: silence an uninitialized variable warning
Message-Id: <20160407125224.GC31146@8bytes.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160406183856.GB9593@mwanda>
In-Reply-To: <20160406183856.GB9593@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Woodhouse <dwmw2@infradead.org>, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Apr 06, 2016 at 09:38:56PM +0300, Dan Carpenter wrote:
> My static checker complains that "dma_alias" is uninitialized unless we
> are dealing with a pci device.  This is true but harmless.  Anyway, we
> can flip the condition around to silence the warning.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.

