From: David Miller <davem@davemloft.net>
Date: Mon, 23 Nov 2015 20:49:39 +0000
Subject: Re: [PATCH] net: atm: constify in_cache_ops and eg_cache_ops structures
Message-Id: <20151123.154939.938227313695257772.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1448126885-7666-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1448126885-7666-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 21 Nov 2015 18:28:05 +0100

> The in_cache_ops and eg_cache_ops structures are never modified, so declare
> them as const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied.
