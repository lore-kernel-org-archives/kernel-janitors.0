From: David Miller <davem@davemloft.net>
Date: Wed, 25 Jul 2018 23:36:11 +0000
Subject: Re: [PATCH net-next] tcp: make function tcp_retransmit_stamp() static
Message-Id: <20180725.163611.91815153690923600.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1532498767-188296-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1532498767-188296-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: edumazet@google.com, jmaxwell37@gmail.com, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 25 Jul 2018 06:06:07 +0000

> Fixes the following sparse warnings:
> 
> net/ipv4/tcp_timer.c:25:5: warning:
>  symbol 'tcp_retransmit_stamp' was not declared. Should it be static?
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied, thank you.
