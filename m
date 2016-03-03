From: Vinod Koul <vinod.koul@intel.com>
Date: Thu, 03 Mar 2016 15:55:46 +0000
Subject: Re: [patch] dma/mic_x100_dma: IS_ERR() vs PTR_ERR() typo
Message-Id: <20160303154346.GP11154@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160229095107.GA32061@mwanda>
In-Reply-To: <20160229095107.GA32061@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sudeep Dutt <sudeep.dutt@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Feb 29, 2016 at 12:51:07PM +0300, Dan Carpenter wrote:
> This is harmless because the caller only cares about zero vs non-zero
> but we should be returning PTR_ERR() here.

Applied thanks

-- 
~Vinod
