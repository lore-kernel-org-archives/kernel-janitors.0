From: David Miller <davem@davemloft.net>
Date: Fri, 28 Sep 2018 18:06:38 +0000
Subject: Re: [PATCH net-next] net: sched: make function qdisc_free_cb() static
Message-Id: <20180928.110638.1342180191872443696.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1538059676-71316-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1538059676-71316-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: jhs@mojatatu.com, xiyou.wangcong@gmail.com, jiri@resnulli.us, vladbu@mellanox.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 27 Sep 2018 14:47:56 +0000

> Fixes the following sparse warning:
> 
> net/sched/sch_generic.c:944:6: warning:
>  symbol 'qdisc_free_cb' was not declared. Should it be static?
> 
> Fixes: 3a7d0d07a386 ("net: sched: extend Qdisc with rcu")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.
