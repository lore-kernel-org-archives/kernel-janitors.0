From: Wei Liu <wei.liu2@citrix.com>
Date: Fri, 23 Feb 2018 17:32:48 +0000
Subject: Re: [PATCH][next] xen-netback: make function xenvif_rx_skb static
Message-Id: <20180223173248.ltt2f5ek2bfzesxt@citrix.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180223171657.5748-1-colin.king@canonical.com>
In-Reply-To: <20180223171657.5748-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Feb 23, 2018 at 05:16:57PM +0000, Colin King wrote:
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

Acked-by: Wei Liu <wei.liu2@citrix.com>

Thanks
