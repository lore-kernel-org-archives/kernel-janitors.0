From: Vinod Koul <vkoul@kernel.org>
Date: Mon, 14 Oct 2019 08:40:17 +0000
Subject: Re: [PATCH] dmaengine: iop-adma: make array 'handler' static const, makes object smaller
Message-Id: <20191014082817.GO2654@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190905163726.19690-1-colin.king@canonical.com>
In-Reply-To: <20190905163726.19690-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 05-09-19, 17:37, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the array 'handler' on the stack but instead make it
> static const. Makes the object code smaller by 80 bytes.
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   38225	   9084	     64	  47373	   b90d	drivers/dma/iop-adma.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>   38081	   9148	     64	  47293	   b8bd	drivers/dma/iop-adma.o
> 
> (gcc version 9.2.1, amd64)

Applied, thanks

-- 
~Vinod
