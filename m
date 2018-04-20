From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Fri, 20 Apr 2018 04:33:49 +0000
Subject: Re: [PATCH 08/61] dmaengine: dw: simplify getting .drvdata
Message-Id: <20180420042149.GH24576@vireshk-i7>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419140641.27926-9-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180419140641.27926-9-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vinod.koul@intel.com>, dmaengine@vger.kernel.org

On 19-04-18, 16:05, Wolfram Sang wrote:
> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Build tested only. buildbot is happy. Please apply individually.
> 
>  drivers/dma/dw/platform.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
