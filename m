From: Joerg Roedel <joerg.roedel@amd.com>
Date: Thu, 05 Mar 2009 11:13:28 +0000
Subject: Re: [PATCH] IOMMU: use ANSI style function declaration for 'iommu_found'
Message-Id: <20090305111328.GA8751@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090302000010.14884.9400.stgit@localhost.localdomain>
In-Reply-To: <20090302000010.14884.9400.stgit@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Mar 02, 2009 at 01:00:41AM +0100, Hannes Eder wrote:
> Fix this sparse warning:
>   drivers/base/iommu.c:34:18: warning: non-ANSI function declaration of function 'iommu_found'
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> ---
>  drivers/base/iommu.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/base/iommu.c b/drivers/base/iommu.c
> index 5e039d4..c2d1eed 100644
> --- a/drivers/base/iommu.c
> +++ b/drivers/base/iommu.c
> @@ -31,7 +31,7 @@ void register_iommu(struct iommu_ops *ops)
>  	iommu_ops = ops;
>  }
>  
> -bool iommu_found()
> +bool iommu_found(void)
>  {
>  	return iommu_ops != NULL;
>  }

Applied, thanks.

Joerg

-- 
           | Advanced Micro Devices GmbH
 Operating | Karl-Hammerschmidt-Str. 34, 85609 Dornach bei München
 System    | 
 Research  | Geschäftsführer: Jochen Polster, Thomas M. McCoy, Giuliano Meroni
 Center    | Sitz: Dornach, Gemeinde Aschheim, Landkreis München
           | Registergericht München, HRB Nr. 43632

