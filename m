From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 06 Jul 2020 11:32:18 +0000
Subject: Re: [RFC PATCH] vfio: type1: fix kthread use case
Message-Id: <83a37410-1740-1a50-9d2d-6ad7587b8532@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200706104915.11460-1-hdanton@sina.com>
In-Reply-To: <20200706104915.11460-1-hdanton@sina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Hillf Danton <hdanton@sina.com>, Alex Williamson <alex.williamson@redhat.com>, iommu@lists.linux-foundation.org
Cc: Kevin Tian <kevin.tian@intel.com>, Yan Zhao <yan.y.zhao@intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

…
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -2798,7 +2798,8 @@ static int vfio_iommu_type1_dma_rw_chunk
…
> -	bool kthread = current->mm == NULL;
> +	bool kthread = current->flags & PF_KTHREAD;
> +	bool use_mm = current->mm == NULL;
…

Can it be helpful to convert initialisations for these variables
into later assignments?

Regards,
Markus
