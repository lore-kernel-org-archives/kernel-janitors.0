From: David Miller <davem@davemloft.net>
Date: Fri, 27 Sep 2019 07:59:43 +0000
Subject: Re: [PATCH net] net: aquantia: Fix aq_vec_isr_legacy() return value
Message-Id: <20190927.095943.808126689307036272.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925105430.GA3264@mwanda>
In-Reply-To: <20190925105430.GA3264@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: igor.russkikh@aquantia.com, vomlehn@texas.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Sep 2019 13:54:30 +0300

> The irqreturn_t type is an enum or an unsigned int in GCC.  That
> creates to problems because it can't detect if the
> self->aq_hw_ops->hw_irq_read() call fails and at the end the function
> always returns IRQ_HANDLED.
> 
> drivers/net/ethernet/aquantia/atlantic/aq_vec.c:316 aq_vec_isr_legacy() warn: unsigned 'err' is never less than zero.
> drivers/net/ethernet/aquantia/atlantic/aq_vec.c:329 aq_vec_isr_legacy() warn: always true condition '(err >= 0) => (0-u32max >= 0)'
> 
> Fixes: 970a2e9864b0 ("net: ethernet: aquantia: Vector operations")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
