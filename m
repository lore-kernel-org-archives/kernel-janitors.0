From: David Ahern <dsahern@gmail.com>
Date: Fri, 24 May 2019 22:04:54 +0000
Subject: Re: [PATCH][next] ipv4: remove redundant assignment to n
Message-Id: <fece118c-22ca-30c5-51b7-b6e9dc56ae59@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190524215658.25432-1-colin.king@canonical.com>
In-Reply-To: <20190524215658.25432-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, "David S . Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 5/24/19 3:56 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer n is being assigned a value however this value is
> never read in the code block and the end of the code block
> continues to the next loop iteration. Clean up the code by
> removing the redundant assignment.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  net/ipv4/fib_trie.c | 1 -
>  1 file changed, 1 deletion(-)
> 

This looks right to me -- n should have been dropped. It is used in
fib_trie_free from which I created  __fib_info_notify_update but
__fib_info_notify_update does do the put_child_root or node_free, it
only walks the tree looking for relevant entries that need to send the
NEWROUTE notifications.

Fixes: 1bff1a0c9bbda ("ipv4: Add function to send route updates")
Reviewed-by: David Ahern <dsahern@gmail.com>
