From: David Miller <davem@davemloft.net>
Date: Wed, 21 Aug 2013 06:22:40 +0000
Subject: Re: [PATCH 5/7] bcm63xx_enet: replace devm_request_and_ioremap by devm_ioremap_resource
Message-Id: <20130820.232240.98227185752652907.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376911241-27720-1-git-send-email-Julia.Lawall@lip6.fr>
	<1376911241-27720-6-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376911241-27720-6-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 19 Aug 2013 13:20:39 +0200

> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Use devm_ioremap_resource instead of devm_request_and_ioremap.
> 
> This was done using the semantic patch
> scripts/coccinelle/api/devm_ioremap_resource.cocci
> 
> The relevant call to platform_get_resource was manually moved down to the
> call to devm_ioremap_resource.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied to net-next, thanks.
