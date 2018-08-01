From: David Miller <davem@davemloft.net>
Date: Wed, 01 Aug 2018 16:57:26 +0000
Subject: Re: [PATCH net-next] tcp: remove set but not used variable 'skb_size'
Message-Id: <20180801.095726.1922061289191949611.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1533048144-39731-1-git-send-email-weiyongjun1@huawei.com>
        <1533088796-149451-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1533088796-149451-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: edumazet@google.com, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 1 Aug 2018 01:59:56 +0000

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> net/ipv4/tcp_output.c: In function 'tcp_collapse_retrans':
> net/ipv4/tcp_output.c:2700:6: warning:
>  variable 'skb_size' set but not used [-Wunused-but-set-variable]
>   int skb_size, next_skb_size;
>       ^
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied, thanks.
