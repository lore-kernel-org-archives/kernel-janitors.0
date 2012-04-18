From: David Miller <davem@davemloft.net>
Date: Wed, 18 Apr 2012 02:33:07 +0000
Subject: Re: [PATCH] drivers/net/wan/farsync.c: add missing iounmap
Message-Id: <20120417.223307.693772402010148380.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1334589732-25876-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1334589732-25876-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: kevin.curtis@farsite.co.uk, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 16 Apr 2012 17:22:12 +0200

> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Free card->mem in the error-handling code since it was successfully
> allocated just above.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied, thanks Julia.
