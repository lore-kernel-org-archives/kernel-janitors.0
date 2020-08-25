From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 25 Aug 2020 06:02:21 +0000
Subject: Re: [PATCH] MAINTAINERS: update QUALCOMM IOMMU after Arm SSMU drivers move
Message-Id: <alpine.DEB.2.21.2008250801050.5419@felia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200802065320.7470-1-lukas.bulwahn@gmail.com>
 <20200821161101.GF21517@willie-the-truck>
In-Reply-To: <20200821161101.GF21517@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, kernel-janitors@vger.kernel.org, iommu@lists.linux-foundation.org, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org, Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, kernel-team@android.com, linux-arm-kernel@lists.infradead.org



On Fri, 21 Aug 2020, Will Deacon wrote:

> On Sun, Aug 02, 2020 at 08:53:20AM +0200, Lukas Bulwahn wrote:
> > Commit e86d1aa8b60f ("iommu/arm-smmu: Move Arm SMMU drivers into their own
> > subdirectory") moved drivers/iommu/qcom_iommu.c to
> > drivers/iommu/arm/arm-smmu/qcom_iommu.c amongst other moves, adjusted some
> > sections in MAINTAINERS, but missed adjusting the QUALCOMM IOMMU section.
> > 
> > Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
> > 
> >   warning: no file matches    F:    drivers/iommu/qcom_iommu.c
> > 
> > Update the file entry in MAINTAINERS to the new location.
> > 
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> > Will, please ack.
> 
> Typo in subject: s/SSMU/SMMU/
> 
> With that:
> 
> Acked-by: Will Deacon <will@kernel.org>
> 
> > Joerg, please pick this minor non-urgent patch for your -next branch.
> 
> Joerg -- can you queue this as a fix for 5.9-rc, please?
>
Will, Joerg, I addressed the typo.

Ignore PATCH v1; and take v2 instead:

https://lore.kernel.org/lkml/20200825053828.4166-1-lukas.bulwahn@gmail.com/

Thanks,

Lukas
