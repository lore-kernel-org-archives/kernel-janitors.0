From: Dave Jiang <dave.jiang@intel.com>
Date: Mon, 09 Mar 2020 16:08:57 +0000
Subject: Re: [PATCH] MAINTAINERS: rectify the INTEL IADX DRIVER entry
Message-Id: <26c4fdca-4a36-d710-0504-569adf5ec079@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200307205737.5829-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200307205737.5829-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Vinod Koul <vkoul@kernel.org>
Cc: dmaengine@vger.kernel.org, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 3/7/20 1:57 PM, Lukas Bulwahn wrote:
> Commit bfe1d56091c1 ("dmaengine: idxd: Init and probe for Intel data
> accelerators") added the INTEL IADX DRIVER entry in MAINTAINERS, which
> mentions include/linux/idxd.h as file entry. However, this header file was
> not added in this commit, nor in any later one.
> 
> Hence, since then, ./scripts/get_maintainer.pl --self-test complains:
> 
>    warning: no file matches F: include/linux/idxd.h
> 
> Drop the file entry to the non-existing file in INTEL IADX DRIVER now.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Thanks. That was a mistake.

Acked-by: Dave Jiang <dave.jiang@intel.com>



> ---
> applies cleanly on current master and next-20200306
> 
>   MAINTAINERS | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c93e4937164c..303e1ea83484 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8478,7 +8478,6 @@ L:	dmaengine@vger.kernel.org
>   S:	Supported
>   F:	drivers/dma/idxd/*
>   F:	include/uapi/linux/idxd.h
> -F:	include/linux/idxd.h
>   
>   INTEL IDLE DRIVER
>   M:	Jacob Pan <jacob.jun.pan@linux.intel.com>
> 
