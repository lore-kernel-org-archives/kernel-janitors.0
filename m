From: Vinod Koul <vkoul@kernel.org>
Date: Wed, 13 May 2020 12:15:42 +0000
Subject: Re: [PATCH -next] dmaengine: moxart-dma: Drop pointless static qualifier in moxart_probe()
Message-Id: <20200513120342.GH14092@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200505101353.195446-1-yuehaibing@huawei.com>
In-Reply-To: <20200505101353.195446-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org

On 05-05-20, 10:13, YueHaibing wrote:
> There is no need to have the 'void __iomem *dma_base_addr' variable
> static since new value always be assigned before use it.

Applied, thanks

-- 
~Vinod
