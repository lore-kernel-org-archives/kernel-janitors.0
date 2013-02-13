From: David Miller <davem@davemloft.net>
Date: Wed, 13 Feb 2013 18:41:53 +0000
Subject: Re: [PATCH] net: ethernet: ti: remove redundant NULL check.
Message-Id: <20130213.134153.631152881474627822.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130212.170650.89534546100043269.davem@davemloft.net>
	<1360709550-821-1-git-send-email-tipecaml@gmail.com>
In-Reply-To: <1360709550-821-1-git-send-email-tipecaml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tipecaml@gmail.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, mugunthanvnm@ti.com, zonque@gmail.com, hotforest@gmail.com, Julia.Lawall@lip6.fr, netdev@vger.kernel.org

From: Cyril Roelandt <tipecaml@gmail.com>
Date: Tue, 12 Feb 2013 23:52:30 +0100

> cpdma_chan_destroy() on a NULL pointer is a no-op, so the NULL check in
> cpdma_ctlr_destroy() can safely be removed.
> 
> Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>

Applied, thanks.
