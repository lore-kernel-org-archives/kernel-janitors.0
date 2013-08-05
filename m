From: David Miller <davem@davemloft.net>
Date: Mon, 05 Aug 2013 18:08:43 +0000
Subject: Re: [PATCH] net/vmw_vsock/af_vsock.c: drop unneeded semicolon
Message-Id: <20130805.110843.938924468911400543.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1375714059-29567-1-git-send-email-Julia.Lawall@lip6.fr>
	<1375714059-29567-4-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1375714059-29567-4-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon,  5 Aug 2013 16:47:38 +0200

> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Drop the semicolon at the end of the list_for_each_entry loop header.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
> Not tested, but I can't imagine how the current code could work, since vsk
> should end up pointing to a dummy value.

This bug has been there since the code was first checked in, and indeed
it's going to work on garbage since it's going to pass in the list
head transformed into a vsock structure.

Applied, thanks Julia.
