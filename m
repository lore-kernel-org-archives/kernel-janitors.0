From: David Miller <davem@davemloft.net>
Date: Mon, 09 Jul 2012 22:25:01 +0000
Subject: Re: [PATCH 6/7] drivers/net/ethernet/broadcom/cnic.c: remove invalid reference to list iterator vari
Message-Id: <20120709.152501.1160923865998069512.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1341747464-1772-1-git-send-email-Julia.Lawall@lip6.fr>
	<1341747464-1772-7-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1341747464-1772-7-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun,  8 Jul 2012 13:37:43 +0200

> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> If list_for_each_entry, etc complete a traversal of the list, the iterator
> variable ends up pointing to an address at an offset from the list head,
> and not a meaningful structure.  Thus this value should not be used after
> the end of the iterator.  There does not seem to be a meaningful value to
> provide to netdev_warn.  Replace with pr_warn, since pr_err is used
> elsewhere.
> 
> This problem was found using Coccinelle (http://coccinelle.lip6.fr/).
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied.
