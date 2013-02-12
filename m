From: David Miller <davem@davemloft.net>
Date: Tue, 12 Feb 2013 22:06:50 +0000
Subject: Re: [PATCH] net: ethernet: ti: remove redundant NULL check.
Message-Id: <20130212.170650.89534546100043269.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1360706086-31506-1-git-send-email-tipecaml@gmail.com>
In-Reply-To: <1360706086-31506-1-git-send-email-tipecaml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tipecaml@gmail.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, mugunthanvnm@ti.com, zonque@gmail.com, hotforest@gmail.com, Julia.Lawall@lip6.fr, netdev@vger.kernel.org

From: Cyril Roelandt <tipecaml@gmail.com>
Date: Tue, 12 Feb 2013 22:54:46 +0100

> cpdma_chan_destroy() on a NULL pointer is a no-op, so the NULL check in
> cpdma_ctlr_destroy() can safely be removed.
> 
> Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>
 ...
> @@ -450,8 +450,7 @@ int cpdma_ctlr_destroy(struct cpdma_ctlr *ctlr)
>  		cpdma_ctlr_stop(ctlr);
>  
>  	for (i = 0; i < ARRAY_SIZE(ctlr->channels); i++) {
> -		if (ctlr->channels[i])
> -			cpdma_chan_destroy(ctlr->channels[i]);
> +		cpdma_chan_destroy(ctlr->channels[i]);
>  	}

SInce this is now a single statement basic block, remove the
surrounding braces.
