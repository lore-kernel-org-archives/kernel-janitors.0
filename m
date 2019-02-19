From: David Miller <davem@davemloft.net>
Date: Tue, 19 Feb 2019 00:36:19 +0000
Subject: Re: [PATCH] net: sched: using kfree_rcu() to simplify the code
Message-Id: <20190218.163619.570942752266231184.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190216081955.93243-1-weiyongjun1@huawei.com>
In-Reply-To: <20190216081955.93243-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: jhs@mojatatu.com, xiyou.wangcong@gmail.com, jiri@resnulli.us, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Sat, 16 Feb 2019 08:19:55 +0000

> The callback function of call_rcu() just calls a kfree(), so we
> can use kfree_rcu() instead of call_rcu() + callback function.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.
