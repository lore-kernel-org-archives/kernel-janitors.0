From: Vinod Koul <vkoul@kernel.org>
Date: Wed, 11 Mar 2020 09:42:02 +0000
Subject: Re: [PATCH] MAINTAINERS: rectify the INTEL IADX DRIVER entry
Message-Id: <20200311093002.GN4885@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200307205737.5829-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200307205737.5829-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Dave Jiang <dave.jiang@intel.com>, dmaengine@vger.kernel.org, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 07-03-20, 21:57, Lukas Bulwahn wrote:
> Commit bfe1d56091c1 ("dmaengine: idxd: Init and probe for Intel data
> accelerators") added the INTEL IADX DRIVER entry in MAINTAINERS, which
> mentions include/linux/idxd.h as file entry. However, this header file was
> not added in this commit, nor in any later one.
> 
> Hence, since then, ./scripts/get_maintainer.pl --self-test complains:
> 
>   warning: no file matches F: include/linux/idxd.h
> 
> Drop the file entry to the non-existing file in INTEL IADX DRIVER now.

Applied, thanks

-- 
~Vinod
