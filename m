From: Will Deacon <will.deacon@arm.com>
Date: Wed, 21 Aug 2013 10:32:52 +0000
Subject: Re: [patch 1/2] iommu/arm-smmu: fix a signedness bug
Message-Id: <20130821103252.GC16380@mudshark.cambridge.arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130821083329.GF5240@elgon.mountain>
In-Reply-To: <20130821083329.GF5240@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Hi Dan,

On Wed, Aug 21, 2013 at 09:33:30AM +0100, Dan Carpenter wrote:
> Unsigned char is never equal to -1.

D'oh! Thanks for the patches.

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I can't compile this code.

I've compiled and tested both of them with an AArch32 MMU-500 model and they
work fine. I'll send this lot in Joerg's direction with the other patches I
currently have queued.

Cheers,

Will
