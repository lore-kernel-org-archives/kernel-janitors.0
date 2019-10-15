From: Joerg Roedel <joro@8bytes.org>
Date: Tue, 15 Oct 2019 09:51:14 +0000
Subject: Re: [PATCH] iommu/qcom: Simplify a test in 'qcom_iommu_add_device()'
Message-Id: <20191015095113.GA14518@8bytes.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190916202936.30403-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190916202936.30403-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: agross@kernel.org, robdclark@gmail.com, linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Sep 16, 2019 at 10:29:36PM +0200, Christophe JAILLET wrote:
> 'iommu_group_get_for_dev()' never returns NULL, so this test can be
> simplified a bit.
> 
> This way, the test is consistent with all other calls to
> 'iommu_group_get_for_dev()'.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/iommu/qcom_iommu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.
