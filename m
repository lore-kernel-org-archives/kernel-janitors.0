From: Vinod <vkoul@kernel.org>
Date: Thu, 28 Jun 2018 06:39:34 +0000
Subject: Re: [PATCH] dmaengine: k3dma: Off by one in k3_of_dma_simple_xlate()
Message-Id: <20180628062734.GR22377@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180622111547.urjjagjf6rxbobpq@kili.mountain>
In-Reply-To: <20180622111547.urjjagjf6rxbobpq@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Zhangfei Gao <zhangfei.gao@linaro.org>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org

On 22-06-18, 14:15, Dan Carpenter wrote:
> The d->chans[] array has d->dma_requests elements so the > should be
> >= here.

Applied, thanks

-- 
~Vinod
