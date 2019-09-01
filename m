From: David Miller <davem@redhat.com>
Date: Sun, 01 Sep 2019 19:11:09 +0000
Subject: Re: [PATCH] net: seeq: Fix the function used to release some memory in an error handling path
Message-Id: <20190901.121109.1164811815017267709.davem@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190831071751.1479-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190831071751.1479-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: yuehaibing@huawei.com, tglx@linutronix.de, gregkh@linuxfoundation.org, tbogendoerfer@suse.de, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 31 Aug 2019 09:17:51 +0200

> In commit 99cd149efe82 ("sgiseeq: replace use of dma_cache_wback_inv"),
> a call to 'get_zeroed_page()' has been turned into a call to
> 'dma_alloc_coherent()'. Only the remove function has been updated to turn
> the corresponding 'free_page()' into 'dma_free_attrs()'.
> The error hndling path of the probe function has not been updated.
> 
> Fix it now.
> 
> Rename the corresponding label to something more in line.
> 
> Fixes: 99cd149efe82 ("sgiseeq: replace use of dma_cache_wback_inv")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.

> If 'dma_alloc_coherent()' fails, maybe the message in printk could be
> improved. The comment above may also not be relevant.

Memory allocation failures already give a stack backtrack down deep in the
memory allocators, therefore printing messages at allocation call sites
are veboten.
