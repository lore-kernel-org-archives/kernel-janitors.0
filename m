From: David Miller <davem@davemloft.net>
Date: Fri, 04 Jan 2019 20:46:26 +0000
Subject: Re: [PATCH] octeontx2-af: Fix a resource leak in an error handling path in 'cgx_probe()'
Message-Id: <20190104.124626.1177296586022194416.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181229164222.15791-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20181229164222.15791-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: sgoutham@marvell.com, lcherian@marvell.com, gakula@marvell.com, jerinj@marvell.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 29 Dec 2018 17:42:22 +0100

> If an error occurs after the call to 'pci_alloc_irq_vectors()', we must
> call 'pci_free_irq_vectors()' in order to avoid a	resource leak.
> 
> The same sequence is already in place in the corresponding 'cgx_remove()'
> function.
> 
> Fixes: 1463f382f58d ("octeontx2-af: Add support for CGX link management")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied and queued up for -stable.

Please fix the date and time on your computer, putting improper dates into
the email headers of your patch postings makes your patch appear out
of order in my patchwork queue.

Thank you.
