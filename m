From: Vinod Koul <vkoul@kernel.org>
Date: Wed, 18 Dec 2019 06:23:06 +0000
Subject: Re: [PATCH -next] dmaengine: ti: edma: Fix error return code in edma_probe()
Message-Id: <20191218061106.GR2536@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191212114622.127322-1-weiyongjun1@huawei.com>
In-Reply-To: <20191212114622.127322-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Dan Williams <dan.j.williams@intel.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Chuhong Yuan <hslester96@gmail.com>, Arnd Bergmann <arnd@arndb.de>, YueHaibing <yuehaibing@huawei.com>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org

On 12-12-19, 11:46, Wei Yongjun wrote:
> Fix to return negative error code -ENOMEM from the error handling
> case instead of 0, as done elsewhere in this function.

Applied, thanks

-- 
~Vinod
