From: Alexey Kardashevskiy <aik@ozlabs.ru>
Date: Sun, 28 Jun 2015 23:41:30 +0000
Subject: Re: [PATCH 2/2] vfio: powerpc/spapr: One function call less in tce_iommu_attach_group() after kzallo
Message-Id: <5590862A.3010603@ozlabs.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <55901E68.80205@users.sourceforge.net>
 <55901FAC.1090109@users.sourceforge.net>
In-Reply-To: <55901FAC.1090109@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, Alex Williamson <alex.williamson@redhat.com>, kvm@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Michael Ellerman <mpe@ellerman.id.au>

On 06/29/2015 02:24 AM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 28 Jun 2015 17:58:42 +0200
>
> The kfree() function was called even if a previous memory allocation
> try failed.

tcegrp will be NULL and kfree() can handle this just fine (is not it the 
whole point of this patchset - remove the check and just call kfree() even 
if the pointer is NULL?). And if you wanted another label, than the 
existing one should have been renamed to "free_exit" or "free_unlock_exit" 
and new one would be "unlock_exit".



> This implementation detail could be improved by the introduction
> of another jump label.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>   drivers/vfio/vfio_iommu_spapr_tce.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/vfio/vfio_iommu_spapr_tce.c b/drivers/vfio/vfio_iommu_spapr_tce.c
> index 50ddfac..2523075 100644
> --- a/drivers/vfio/vfio_iommu_spapr_tce.c
> +++ b/drivers/vfio/vfio_iommu_spapr_tce.c
> @@ -1200,7 +1200,7 @@ static int tce_iommu_attach_group(void *iommu_data,
>   	tcegrp = kzalloc(sizeof(*tcegrp), GFP_KERNEL);
>   	if (!tcegrp) {
>   		ret = -ENOMEM;
> -		goto unlock_exit;
> +		goto unlock_container;
>   	}
>
>   	if (!table_group->ops || !table_group->ops->take_ownership ||
> @@ -1217,7 +1217,7 @@ static int tce_iommu_attach_group(void *iommu_data,
>   unlock_exit:
>   	if (ret)
>   		kfree(tcegrp);
> -
> +unlock_container:
>   	mutex_unlock(&container->lock);
>
>   	return ret;
>


-- 
Alexey
