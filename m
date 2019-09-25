From: David Miller <davem@davemloft.net>
Date: Wed, 25 Sep 2019 11:43:14 +0000
Subject: Re: [PATCH] hdlc: Simplify code in 'pvc_xmit()'
Message-Id: <20190925.134314.794543116027582950.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190921061738.25326-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190921061738.25326-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: khc@pm.waw.pl, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 21 Sep 2019 08:17:38 +0200

> Use __skb_pad instead of rewriting it, this saves some LoC.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only.

Please test this code and resubmit for net-next, thank you.
