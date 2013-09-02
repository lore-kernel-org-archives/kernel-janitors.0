From: Vinod Koul <vinod.koul@intel.com>
Date: Mon, 02 Sep 2013 12:19:39 +0000
Subject: Re: [PATCH 4/7] dma: replace devm_request_and_ioremap by devm_ioremap_resource
Message-Id: <20130902120739.GR7376@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376911241-27720-1-git-send-email-Julia.Lawall@lip6.fr>
 <1376911241-27720-5-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376911241-27720-5-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Dan Williams <djbw@fb.com>, linux-kernel@vger.kernel.org

On Mon, Aug 19, 2013 at 01:20:38PM +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Use devm_ioremap_resource instead of devm_request_and_ioremap.
> 
> This was done using the semantic patch
> scripts/coccinelle/api/devm_ioremap_resource.cocci
> 
> The relevant call to platform_get_resource was manually moved down to the
> call to devm_ioremap_resource.
Applied, thanks

~Vinod

