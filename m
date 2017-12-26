From: David Miller <davem@davemloft.net>
Date: Tue, 26 Dec 2017 22:42:31 +0000
Subject: Re: [PATCH] tcp: make function tcp_recv_timestamp static
Message-Id: <20171226.174231.1806242838460429411.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171222010135.12204-1-colin.king@canonical.com>
In-Reply-To: <20171222010135.12204-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri, 22 Dec 2017 01:01:35 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> The function tcp_recv_timestamp is local to the source and does not
> need to be in global scope, so make it static.
> 
> Cleans up sparse warning:
> symbol 'tcp_recv_timestamp' was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

This doesn't apply cleanly to any of my trees, please be explicit about
which tree you are targetting once you fix this up, also:

> @@ -1729,7 +1729,7 @@ static void tcp_update_recv_tstamps(struct sk_buff *skb,
>  }
>  
>  /* Similar to __sock_recv_timestamp, but does not require an skb */
> -void tcp_recv_timestamp(struct msghdr *msg, const struct sock *sk,
> +static void tcp_recv_timestamp(struct msghdr *msg, const struct sock *sk,
>  			       struct scm_timestamping *tss)

If you change where the openning parenthesis of a function definition
occurs, you have to adjust the indentation of the second line of
arguments so that it starts precisely at the first column after the
openning parenthesis.

Thank you.
