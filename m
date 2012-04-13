From: David Miller <davem@davemloft.net>
Date: Fri, 13 Apr 2012 15:05:38 +0000
Subject: Re: [PATCH] net/key/af_key.c: add missing kfree_skb
Message-Id: <20120413.110538.449625213257927113.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1333960870-19735-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1333960870-19735-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon,  9 Apr 2012 10:41:10 +0200

> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> At the point of this error-handling code, alloc_skb has succeded, so free
> the resulting skb by jumping to the err label.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied.
