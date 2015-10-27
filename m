From: David Miller <davem@davemloft.net>
Date: Tue, 27 Oct 2015 04:52:32 +0000
Subject: Re: [PATCH 0/8] add missing of_node_put
Message-Id: <20151026.220848.1827888098875824300.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1445781427-7110-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1445781427-7110-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 25 Oct 2015 14:56:59 +0100

> The various for_each device_node iterators performs an of_node_get on each
> iteration, so a break out of the loop requires an of_node_put.
> 
> The complete semantic patch that fixes this problem is
> (http://coccinelle.lip6.fr):
 ...

Series applied, thanks a lot Julia.
