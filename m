From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 04 Apr 2019 15:05:09 +0000
Subject: Re: [PATCH] tcp: remove redundant check on tskb
Message-Id: <20190404150508.GL32590@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190404144603.27682-1-colin.king@canonical.com>
In-Reply-To: <20190404144603.27682-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Eric Dumazet <edumazet@google.com>, "David S . Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Apr 04, 2019 at 03:46:03PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The non-null check on tskb is always false because it is in an else
> path of a check on tskb and hence tskb is null in this code block.
> This is check is therefore redundant and can be removed as well
> as the label coalesc.
> 
> if (tsbk) {
>         ...
> } else {
>         ...
>         if (unlikely(!skb)) {
>                 if (tskb)       /* can never be true, redundant code */
>                         goto coalesc;
>                 return;
>         }
> }
> 
> Addresses-Coverity: ("Logically dead code")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

This was fallout from commit 75c119afe14f ("tcp: implement rb-tree based
retransmit queue").

regards,
dan carpenter
