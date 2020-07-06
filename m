From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 06 Jul 2020 13:33:58 +0000
Subject: Re: [RFC PATCH] vfio: type1: fix kthread use case
Message-Id: <7ed25c44-bb51-2d8d-82d9-f11272f56424@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200706104915.11460-1-hdanton@sina.com>
 <20200706124241.4392-1-hdanton@sina.com>
In-Reply-To: <20200706124241.4392-1-hdanton@sina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Hillf Danton <hdanton@sina.com>, Alex Williamson <alex.williamson@redhat.com>, iommu@lists.linux-foundation.org
Cc: Kevin Tian <kevin.tian@intel.com>, Yan Zhao <yan.y.zhao@intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

>> Can it be helpful to convert initialisations for these variables
>> into later assignments?
>
> Perhaps. Then it looks like the below.


…
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -2798,9 +2798,12 @@ static int vfio_iommu_type1_dma_rw_chunk
…
> -	bool kthread = current->mm == NULL;
> +	bool kthread;
> +	bool use_mm;

I would prefer the following variable declarations then.

+	bool kthread, use_mm;


>  	size_t offset;
>
> +	kthread = current->flags & PF_KTHREAD;
> +	use_mm = current->mm == NULL;

I propose to move such assignments directly before the corresponding check.


…
>  	if (!mm)
>  		return -EPERM;


+	kthread = current->flags & PF_KTHREAD;
+	use_mm = !current->mm;

> -	if (kthread)
> +	if (kthread && use_mm)
>  		kthread_use_mm(mm);
…

Regards,
Markus
