From: David Miller <davem@davemloft.net>
Date: Mon, 23 Nov 2015 20:49:46 +0000
Subject: Re: [PATCH] VSOCK: constify vmci_transport_notify_ops structures
Message-Id: <20151123.154946.1373634995645161672.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1448127557-22280-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1448127557-22280-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 21 Nov 2015 18:39:17 +0100

> The vmci_transport_notify_ops structures are never modified, so declare
> them as const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied.
