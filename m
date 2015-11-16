From: Vinod Koul <vinod.koul@intel.com>
Date: Mon, 16 Nov 2015 03:54:24 +0000
Subject: Re: [PATCH v2] dmaengine: ioatdma: constify dca_ops structures
Message-Id: <20151116035805.GD25173@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1447410688-7213-1-git-send-email-Julia.Lawall@lip6.fr>
 <alpine.DEB.2.10.1511131244230.2561@hadrien>
In-Reply-To: <alpine.DEB.2.10.1511131244230.2561@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Dan Williams <dan.j.williams@intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org

On Fri, Nov 13, 2015 at 12:46:00PM +0100, Julia Lawall wrote:
> The dca_ops structure is never modified, so declare it as const.
> 
> Done with the help of Coccinelle.

Applied, thanks

-- 
~Vinod
