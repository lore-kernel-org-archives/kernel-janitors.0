From: David Miller <davem@davemloft.net>
Date: Thu, 31 Oct 2019 17:38:13 +0000
Subject: Re: [PATCH] cxgb4/l2t: Simplify 't4_l2e_free()' and '_t4_l2e_free()'
Message-Id: <20191031.103813.2043786873046546149.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191031055345.32487-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20191031055345.32487-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: vishal@chelsio.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 31 Oct 2019 06:53:45 +0100

> Use '__skb_queue_purge()' instead of re-implementing it.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to net-next.
