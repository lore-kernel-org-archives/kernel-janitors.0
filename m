From: Vinod Koul <vkoul@kernel.org>
Date: Sun, 20 Jan 2019 05:35:50 +0000
Subject: Re: [PATCH -next] dmaengine: xilinx_dma: remove set but not used variable 'tail_segment'
Message-Id: <20190120052350.GM4635@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1547035837-87800-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1547035837-87800-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Dan Williams <dan.j.williams@intel.com>, Michal Simek <michal.simek@xilinx.com>, Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>, Andrea Merello <andrea.merello@gmail.com>, Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org

On 09-01-19, 12:10, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/dma/xilinx/xilinx_dma.c: In function 'xilinx_vdma_start_transfer':
> drivers/dma/xilinx/xilinx_dma.c:1104:33: warning:
>  variable 'tail_segment' set but not used [-Wunused-but-set-variable]
> 
> It not used since commit b8349172b400 ("dmaengine: xilinx_dma: Drop SG support
> for VDMA IP")

Applied, thanks

-- 
~Vinod
