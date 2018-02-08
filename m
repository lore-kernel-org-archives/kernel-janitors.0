From: David Miller <davem@davemloft.net>
Date: Thu, 08 Feb 2018 02:46:43 +0000
Subject: Re: [PATCH] cxgb4: Fix error handling path in 'init_one()'
Message-Id: <20180207.214643.1455087255402471687.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180206201717.27412-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20180206201717.27412-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: ganeshgr@chelsio.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue,  6 Feb 2018 21:17:17 +0100

> Commit baf5086840ab1 ("cxgb4: restructure VF mgmt code") has reordered
> some code but an error handling label has not been updated accordingly.
> So fix it and free 'adapter' if 't4_wait_dev_ready()' fails.
> 
> Fixes: baf5086840ab1 ("cxgb4: restructure VF mgmt code")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thank you.
