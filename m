From: David Miller <davem@davemloft.net>
Date: Tue, 06 Aug 2019 18:34:36 +0000
Subject: Re: [PATCH] net: cxgb3_main: Fix a resource leak in a error path in 'init_one()'
Message-Id: <20190806.113436.87450273064586797.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190806085512.11729-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190806085512.11729-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: vishal@chelsio.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue,  6 Aug 2019 10:55:12 +0200

> A call to 'kfree_skb()' is missing in the error handling path of
> 'init_one()'.
> This is already present in 'remove_one()' but is missing here.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Looks good, applied, thanks.
