From: David Miller <davem@davemloft.net>
Date: Fri, 16 Mar 2018 13:49:28 +0000
Subject: Re: [PATCH] rxrpc: remove redundant initialization of variable 'len'
Message-Id: <20180316.094928.699803274284942791.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180312172538.31707-1-colin.king@canonical.com>
In-Reply-To: <20180312172538.31707-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Mon, 12 Mar 2018 17:25:38 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable 'len' is being initialized with a value that is never
> read and it is re-assigned later, hence the initialization is redundant
> and can be removed.
> 
> Cleans up clang warning:
> net/rxrpc/recvmsg.c:275:15: warning: Value stored to 'len' during its
> initialization is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Hehe, if the diff provided just 2 more lines of context at the bottom
we'd be able to see the overriding assignment :-)

> @@ -272,7 +272,7 @@ static int rxrpc_locate_data(struct rxrpc_call *call, struct sk_buff *skb,
>  			     unsigned int *_offset, unsigned int *_len)
>  {
>  	unsigned int offset = sizeof(struct rxrpc_wire_header);
> -	unsigned int len = *_len;
> +	unsigned int len;
>  	int ret;
>  	u8 annotation = *_annotation;
>  
> -- 
> 2.15.1
> 

Applied, thanks Colin.
