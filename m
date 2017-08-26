From: David Miller <davem@davemloft.net>
Date: Sat, 26 Aug 2017 03:07:25 +0000
Subject: Re: [PATCH] net: sxgbe: check memory allocation failure
Message-Id: <20170825.200725.549810070391118977.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170825053551.31672-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170825053551.31672-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: bh74.an@samsung.com, ks.giri@samsung.com, vipul.pandya@samsung.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 25 Aug 2017 07:35:51 +0200

> Check memory allocation failure and return -ENOMEM in such a case, as
> already done few lines below for another memory allocation.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thank you.
