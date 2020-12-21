From: Vinod Koul <vkoul@kernel.org>
Date: Mon, 21 Dec 2020 14:11:05 +0000
Subject: Re: [PATCH] dmaengine: idxd: off by one in cleanup code
Message-Id: <20201221135905.GB3323@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X9nFeojulsNqUSnG@mwanda>
In-Reply-To: <X9nFeojulsNqUSnG@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dave Jiang <dave.jiang@intel.com>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org

On 16-12-20, 11:29, Dan Carpenter wrote:
> The clean up is off by one so this will start at "i" and it should start
> with "i - 1" and then it doesn't unregister the zeroeth elements in the
> array.

Applied, thanks

-- 
~Vinod
