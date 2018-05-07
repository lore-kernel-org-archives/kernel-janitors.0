From: Vinod Koul <vinod.koul@linaro.org>
Date: Mon, 07 May 2018 08:16:29 +0000
Subject: Re: [PATCH -next] dmaengine: sprd: Fix potential NULL dereference in sprd_dma_probe()
Message-Id: <20180507080429.GA14832@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1525657234-88256-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1525657234-88256-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, May 07, 2018 at 01:40:34AM +0000, Wei Yongjun wrote:
> platform_get_resource() may fail and return NULL, so we should
> better check it's return value to avoid a NULL pointer dereference
> a bit later in the code.
> 
> This is detected by Coccinelle semantic patch.

Applied, thanks

-- 
~Vinod
