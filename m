From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 25 Sep 2019 06:12:53 +0000
Subject: Re: [PATCH] wil6210: use after free in wil_netif_rx_any()
Message-Id: <20190925061253.8F93560E73@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190921060145.GD18726@mwanda>
In-Reply-To: <20190921060145.GD18726@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Maya Erez <merez@codeaurora.org>, Dedy Lansky <dlansky@codeaurora.org>, linux-wireless@vger.kernel.org, wil6210@qti.qualcomm.com, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The debug code dereferences "skb" to print "skb->len" so we have to
> print the message before we free "skb".
> 
> Fixes: f99fe49ff372 ("wil6210: add wil_netif_rx() helper function")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied to wireless-drivers.git, thanks.

2b481835cf4e wil6210: use after free in wil_netif_rx_any()

-- 
https://patchwork.kernel.org/patch/11155359/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
