From: Vinod Koul <vkoul@kernel.org>
Date: Fri, 10 Jan 2020 07:58:05 +0000
Subject: Re: [PATCH][next][V2] dmaengine: ti: omap-dma: don't allow a null od->plat pointer to be dereference
Message-Id: <20200110074605.GD2818@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200109131953.157154-1-colin.king@canonical.com>
In-Reply-To: <20200109131953.157154-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Dan Williams <dan.j.williams@intel.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Tony Lindgren <tony@atomide.com>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 09-01-20, 13:19, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently when the call to dev_get_platdata returns null the driver issues
> a warning and then later dereferences the null pointer.  Avoid this issue
> by returning -ENODEV errror rather when the platform data is null and

s/errror/error :) never thought would correct Colin on spelling :)

With the typo fixes:

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
