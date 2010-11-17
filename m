From: David Miller <davem@davemloft.net>
Date: Wed, 17 Nov 2010 20:40:43 +0000
Subject: Re: [PATCH] gianfar: fix signedness issue
Message-Id: <20101117.124043.52191671.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101115215942.354b0394@absol.kitzblitz>
In-Reply-To: <20101115215942.354b0394@absol.kitzblitz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: nikai@nikai.net
Cc: galak@kernel.crashing.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Nicolas Kaiser <nikai@nikai.net>
Date: Mon, 15 Nov 2010 21:59:42 +0100

> irq_of_parse_and_map() has an unsigned return type.
> Testing for a negative error value doesn't work here.
> 
> Signed-off-by: Nicolas Kaiser <nikai@nikai.net>
> ---
> I see that in numerous places the return value is tested
> for NO_IRQ. I hope it's the right thing to do here as well?

I think it is, applied, thank you.
