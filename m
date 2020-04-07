From: Sergey Matyukevich <sergey.matyukevich.os@quantenna.com>
Date: Tue, 07 Apr 2020 19:48:13 +0000
Subject: Re: [PATCH] qtnfmac: Simplify code in _attach functions
Message-Id: <20200407194812.aziu2hedsfkwh7lg@bars>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200407193233.9439-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200407193233.9439-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: imitsyanko@quantenna.com, avinashp@quantenna.com, smatyukevich@quantenna.com, kvalo@codeaurora.org, davem@davemloft.net, huangfq.daxian@gmail.com, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


Hello Christophe,

> There is no need to re-implement 'netdev_alloc_skb_ip_align()' here.
> Keep the code simple.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thanks for cleaning this up!

Reviewed-by: Sergey Matyukevich <sergey.matyukevich.os@quantenna.com>

Regards,
Sergey
