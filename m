From: Joerg Roedel <joro@8bytes.org>
Date: Fri, 04 Sep 2020 09:21:14 +0000
Subject: Re: [PATCH v2] MAINTAINERS: update QUALCOMM IOMMU after Arm SMMU drivers move
Message-Id: <20200904092114.GJ6714@8bytes.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200825053828.4166-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200825053828.4166-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, kernel-team@android.com, kernel-janitors@vger.kernel.org, iommu@lists.linux-foundation.org, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org, Joe Perches <joe@perches.com>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org

On Tue, Aug 25, 2020 at 07:38:28AM +0200, Lukas Bulwahn wrote:
> Commit e86d1aa8b60f ("iommu/arm-smmu: Move Arm SMMU drivers into their own
> subdirectory") moved drivers/iommu/qcom_iommu.c to
> drivers/iommu/arm/arm-smmu/qcom_iommu.c amongst other moves, adjusted some
> sections in MAINTAINERS, but missed adjusting the QUALCOMM IOMMU section.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
> 
>   warning: no file matches    F:    drivers/iommu/qcom_iommu.c
> 
> Update the file entry in MAINTAINERS to the new location.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Acked-by: Will Deacon <will@kernel.org>

Applied, thanks.
