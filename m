From: David Miller <davem@davemloft.net>
Date: Sun, 21 Jul 2019 18:42:50 +0000
Subject: Re: [PATCH] tipc: Fix a typo
Message-Id: <20190721.114250.1893607784895600131.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190721103811.29724-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190721103811.29724-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: jon.maloy@ericsson.com, ying.xue@windriver.com, netdev@vger.kernel.org, tipc-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 21 Jul 2019 12:38:11 +0200

> s/tipc_toprsv_listener_data_ready/tipc_topsrv_listener_data_ready/
> (r and s switched in topsrv)
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> The function name could also be removed from the comment. It does not
> bring any useful information IMHO.

Applied, thanks Christophe.
