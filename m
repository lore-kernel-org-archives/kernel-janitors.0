From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 17 Sep 2019 06:23:12 +0000
Subject: Re: [PATCH] iommu/qcom: Simplify a test in 'qcom_iommu_add_device()'
Message-Id: <20190917062312.GF18977@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190916202936.30403-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190916202936.30403-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: agross@kernel.org, robdclark@gmail.com, joro@8bytes.org, linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Sep 16, 2019 at 10:29:36PM +0200, Christophe JAILLET wrote:
> 'iommu_group_get_for_dev()' never returns NULL, so this test can be
> simplified a bit.
> 

It used to until commit 72dcac633475 ("iommu: Warn once when device_group
callback returns NULL").

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter
