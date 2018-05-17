From: Vinod <vkoul@kernel.org>
Date: Thu, 17 May 2018 04:43:05 +0000
Subject: Re: [PATCH] dmaengine: sprd: fix an NULL vs IS_ERR() bug
Message-Id: <20180517043105.GR13271@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180516084807.GA23043@mwanda>
In-Reply-To: <20180516084807.GA23043@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dan Williams <dan.j.williams@intel.com>, Baolin Wang <baolin.wang@linaro.org>, Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org

On 16-05-18, 11:48, Dan Carpenter wrote:
> We recently cleaned this code up but we need to update the error
> handling as well.  The devm_ioremap_resource() returns error pointers on
> error, never NULL.

Applied, thanks

-- 
~Vinod
