From: David Miller <davem@davemloft.net>
Date: Mon, 09 Jul 2012 22:24:55 +0000
Subject: Re: [PATCH 2/7] net/rxrpc/ar-peer.c: remove invalid reference to list iterator variable
Message-Id: <20120709.152455.950070482948785087.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1341747464-1772-1-git-send-email-Julia.Lawall@lip6.fr>
	<1341747464-1772-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1341747464-1772-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun,  8 Jul 2012 13:37:39 +0200

> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> If list_for_each_entry, etc complete a traversal of the list, the iterator
> variable ends up pointing to an address at an offset from the list head,
> and not a meaningful structure.  Thus this value should not be used after
> the end of the iterator.  This seems to be a copy-paste bug from a previous
> debugging message, and so the meaningless value is just deleted.
> 
> This problem was found using Coccinelle (http://coccinelle.lip6.fr/).
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied.
