From: Vinod Koul <vinod.koul@linux.intel.com>
Date: Wed, 22 Aug 2012 04:41:30 +0000
Subject: Re: [PATCH 2/5] drivers/dma/amba-pl08x.c: fix error return code
Message-Id: <1345609770.1895.81.camel@vkoul-udesk3>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1344949115-13266-1-git-send-email-Julia.Lawall@lip6.fr>
	 <1344949115-13266-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1344949115-13266-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org

On Tue, 2012-08-14 at 14:58 +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Convert a 0 error return code to a negative one, as returned elsewhere in the
> function.
Applied, thanks

-- 
~Vinod

