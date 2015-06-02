From: Joerg Roedel <joro@8bytes.org>
Date: Tue, 02 Jun 2015 13:45:18 +0000
Subject: Re: [patch] iommu/vt-d: unlock on error in intel_iommu_load_translation_tables()
Message-Id: <20150602134505.GA20381@8bytes.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150602100958.GC11247@mwanda>
In-Reply-To: <20150602100958.GC11247@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Li@mwanda, Zhen-Hua <zhen-hual@hp.com>, iommu@lists.linux-foundation.org, kernel-janitors@vger.kernel.org

On Tue, Jun 02, 2015 at 01:09:58PM +0300, Dan Carpenter wrote:
> Smatch found some error paths that don't unlock.  Also we can return
> -ENOMEM instead of -1 if we don't have an old root entry.
> 
> Fixes: 5908f10af4b9 ('iommu/vt-d: datatypes and functions used for kdump')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.

> Releasing the lock is good, but we might need to do other error handling
> as well.  Presumably this function always succeeds anyway?  It seems
> like it might be essential for booting.

What do you mean by 'other error handling'? In error case a negative
value is returned and the caller checks that.


	Joerg

