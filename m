From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 06 Jul 2020 14:04:13 +0000
Subject: Re: [RFC PATCH] vfio: type1: fix kthread use case
Message-Id: <69f9079f-b1b0-3296-4536-8f0a051a96c2@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200706104915.11460-1-hdanton@sina.com>
 <20200706124241.4392-1-hdanton@sina.com>
In-Reply-To: <20200706124241.4392-1-hdanton@sina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Hillf Danton <hdanton@sina.com>, Alex Williamson <alex.williamson@redhat.com>, iommu@lists.linux-foundation.org
Cc: Kevin Tian <kevin.tian@intel.com>, Yan Zhao <yan.y.zhao@intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

…
> +++ b/drivers/vfio/vfio_iommu_type1.c
…
> @@ -2812,11 +2815,10 @@ static int vfio_iommu_type1_dma_rw_chunk
…
>  	if (!mm)
>  		return -EPERM;
>
> -	if (kthread)
> +	if (kthread && use_mm)

Can another design approach make sense here?

+	bool thread_use_mm = ((current->flags & PF_KTHREAD) && !current->mm);
+	if (thread_use_mm)


>  		kthread_use_mm(mm);
…

Regards,
Markus
