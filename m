From: David Miller <davem@davemloft.net>
Date: Mon, 09 Jul 2012 22:24:49 +0000
Subject: Re: [PATCH 1/7] drivers/isdn/mISDN/stack.c: remove invalid reference to list iterator variable
Message-Id: <20120709.152449.1208146051989927045.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1341747464-1772-1-git-send-email-Julia.Lawall@lip6.fr>
	<1341747464-1772-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1341747464-1772-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: isdn@linux-pingi.de, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun,  8 Jul 2012 13:37:38 +0200

> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> If list_for_each_entry, etc complete a traversal of the list, the iterator
> variable ends up pointing to an address at an offset from the list head,
> and not a meaningful structure.  Thus this value should not be used after
> the end of the iterator.  The dereferences are just deleted from the
> debugging statement.
> 
> This problem was found using Coccinelle (http://coccinelle.lip6.fr/).
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied.
