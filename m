From: David Miller <davem@davemloft.net>
Date: Wed, 25 Jul 2018 23:38:12 +0000
Subject: Re: [PATCH net-next] net: igmp: make function __ip_mc_inc_group() static
Message-Id: <20180725.163812.466815319087153540.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1532498773-188363-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1532498773-188363-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org, liuhangbin@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 25 Jul 2018 06:06:13 +0000

> Fixes the following sparse warnings:
> 
> net/ipv4/igmp.c:1391:6: warning:
>  symbol '__ip_mc_inc_group' was not declared. Should it be static?
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied to 'net'.
