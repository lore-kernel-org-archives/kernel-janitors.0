From: David Miller <davem@davemloft.net>
Date: Tue, 14 Jul 2020 21:11:59 +0000
Subject: Re: [PATCH] hippi: Fix a size used in a 'pci_free_consistent()' in an error handling path
Message-Id: <20200714.141159.1780768034773147896.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200714110027.301728-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200714110027.301728-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: jes@trained-monkey.org, kuba@kernel.org, linux-hippi@sunsite.dk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 14 Jul 2020 13:00:27 +0200

> The size used when calling 'pci_alloc_consistent()' and
> 'pci_free_consistent()' should match.
> 
> Fix it and have it consistent with the corresponding call in 'rr_close()'.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thank you.
