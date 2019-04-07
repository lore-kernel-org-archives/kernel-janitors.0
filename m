From: David Miller <davem@davemloft.net>
Date: Sun, 07 Apr 2019 01:18:34 +0000
Subject: Re: [PATCH] tcp: remove redundant check on tskb
Message-Id: <20190406.181834.995998216821289412.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190404144603.27682-1-colin.king@canonical.com>
In-Reply-To: <20190404144603.27682-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: edumazet@google.com, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu,  4 Apr 2019 15:46:03 +0100

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

Applied to net-next.
