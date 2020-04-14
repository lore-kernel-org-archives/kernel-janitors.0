From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 14 Apr 2020 15:09:17 +0000
Subject: Re: [PATCH] qtnfmac: Simplify code in _attach functions
Message-Id: <20200414150917.1E73AC433CB@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200407193233.9439-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200407193233.9439-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: imitsyanko@quantenna.com, avinashp@quantenna.com, smatyukevich@quantenna.com, davem@davemloft.net, huangfq.daxian@gmail.com, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> There is no need to re-implement 'netdev_alloc_skb_ip_align()' here.
> Keep the code simple.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Reviewed-by: Sergey Matyukevich <sergey.matyukevich.os@quantenna.com>

Patch applied to wireless-drivers-next.git, thanks.

c960e2b384ef qtnfmac: Simplify code in _attach functions

-- 
https://patchwork.kernel.org/patch/11478939/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
