From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Wed, 01 Aug 2018 02:36:05 +0000
Subject: Re: [PATCH net-next] tcp: remove set but not used variable 'skb_size'
Message-Id: <20e888fa-8c14-ee70-fd1e-4d9d44c67a66@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1533048144-39731-1-git-send-email-weiyongjun1@huawei.com>
 <1533088796-149451-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1533088796-149451-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Eric Dumazet <edumazet@google.com>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org



On 07/31/2018 06:59 PM, Wei Yongjun wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> net/ipv4/tcp_output.c: In function 'tcp_collapse_retrans':
> net/ipv4/tcp_output.c:2700:6: warning:
>  variable 'skb_size' set but not used [-Wunused-but-set-variable]
>   int skb_size, next_skb_size;
>       ^
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>


Signed-off-by: Eric Dumazet <edumazet@google.com>

Thanks.

