From: Vinod Koul <vkoul@kernel.org>
Date: Wed, 18 Nov 2020 12:33:58 +0000
Subject: Re: [PATCH] dmaengine: fix error codes in channel_register()
Message-Id: <20201118122158.GT50232@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201113101631.GE168908@mwanda>
In-Reply-To: <20201113101631.GE168908@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dave Jiang <dave.jiang@intel.com>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org

On 13-11-20, 13:16, Dan Carpenter wrote:
> The error codes were not set on some of these error paths.
> 
> Also the error handling was more confusing than it needed to be so I
> cleaned it up and shuffled it around a bit.

Applied, thanks

-- 
~Vinod
