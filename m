From: David Miller <davem@davemloft.net>
Date: Sat, 03 Nov 2012 19:43:34 +0000
Subject: Re: [PATCH 10/16] drivers/net/ethernet/ibm/emac/mal.c: use WARN
Message-Id: <20121103.154334.44159507206649735.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351940317-14812-1-git-send-email-Julia.Lawall@lip6.fr>
	<1351940317-14812-11-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1351940317-14812-11-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat,  3 Nov 2012 11:58:31 +0100

> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Use WARN rather than printk followed by WARN_ON(1), for conciseness.
> 
> A simplified version of the semantic patch that makes this transformation
> is as follows: (http://coccinelle.lip6.fr/)
 ...
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied.
