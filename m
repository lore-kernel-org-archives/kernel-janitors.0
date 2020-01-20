From: David Miller <davem@davemloft.net>
Date: Mon, 20 Jan 2020 13:39:07 +0000
Subject: Re: [PATCH] ide: tx4939ide: Fix the name used in a 'devm_request_mem_region()' call
Message-Id: <20200120.143907.404082019388749442.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190724220145.17282-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190724220145.17282-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 25 Jul 2019 00:01:45 +0200

> This should be "tx4939ide" instead of "tx4938ide", but here MODNAME is even
> better.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
