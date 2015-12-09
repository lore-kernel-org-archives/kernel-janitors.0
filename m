From: David Miller <davem@davemloft.net>
Date: Wed, 09 Dec 2015 04:28:13 +0000
Subject: Re: [PATCH] chelsio: constify cmac_ops structures
Message-Id: <20151208.232813.1321813358408853992.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1449607329-7572-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1449607329-7572-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue,  8 Dec 2015 21:42:09 +0100

> The cmac_ops structures are never modified, so declare them as const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied, thanks.
