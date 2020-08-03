From: David Miller <davem@davemloft.net>
Date: Mon, 03 Aug 2020 23:01:32 +0000
Subject: Re: [PATCH 2/2] net: spider_net: Remove a useless memset
Message-Id: <20200803.160132.173649007258760362.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200802135348.691046-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200802135348.691046-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: kou.ishizaki@toshiba.co.jp, kuba@kernel.org, linas@austin.ibm.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun,  2 Aug 2020 15:53:48 +0200

> Avoid a memset after a call to 'dma_alloc_coherent()'.
> This is useless since
> commit 518a2f1925c3 ("dma-mapping: zero memory returned from dma_alloc_*")
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
