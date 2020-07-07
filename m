From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 07 Jul 2020 06:04:54 +0000
Subject: Re: [RFC PATCH] vfio: type1: fix kthread use case
Message-Id: <f29f7008-6489-0db3-86b3-5f83f5ed7770@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200706104915.11460-1-hdanton@sina.com>
 <20200706124241.4392-1-hdanton@sina.com>
 <20200707011420.1416-1-hdanton@sina.com>
In-Reply-To: <20200707011420.1416-1-hdanton@sina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Hillf Danton <hdanton@sina.com>, iommu@lists.linux-foundation.org
Cc: Kevin Tian <kevin.tian@intel.com>, Yan Zhao <yan.y.zhao@intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>, Christoph Hellwig <hch@lst.de>

…
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -2798,7 +2798,7 @@ static int vfio_iommu_type1_dma_rw_chunk
…
> -	bool kthread = current->mm == NULL;
> +	bool kthread_load_mm;
>  	size_t offset;

How do you think about to reduce the scope for such variables?
https://refactoring.com/catalog/reduceScopeOfVariable.html


…
> @@ -2812,11 +2812,12 @@ static int vfio_iommu_type1_dma_rw_chunk
…
>  	if (!mm)
>  		return -EPERM;
…
> +	kthread_load_mm = current->flags & PF_KTHREAD &&
> +				current->mm == NULL;
…

Would you like to apply a more succinct code variant?

+	kthread_load_mm = current->flags & PF_KTHREAD && !current->mm;


Regards,
Markus
