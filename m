From: David Miller <davem@davemloft.net>
Date: Mon, 26 Feb 2018 16:37:18 +0000
Subject: Re: [PATCH][next] xen-netback: make function xenvif_rx_skb static
Message-Id: <20180226.113718.2265855249140521271.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180223171657.5748-1-colin.king@canonical.com>
In-Reply-To: <20180223171657.5748-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: wei.liu2@citrix.com, paul.durrant@citrix.com, xen-devel@lists.xenproject.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri, 23 Feb 2018 17:16:57 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> The function xenvif_rx_skb is local to the source and does not need
> to be in global scope, so make it static.
> 
> Cleans up sparse warning:
> drivers/net/xen-netback/rx.c:422:6: warning: symbol 'xenvif_rx_skb'
> was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
