From: David Miller <davem@davemloft.net>
Date: Wed, 04 Jul 2018 13:09:55 +0000
Subject: Re: [PATCH net-next] net: sched: act_pedit: fix possible memory leak in tcf_pedit_init()
Message-Id: <20180704.220955.1860389897740014414.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1530625512-122785-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1530625512-122785-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: jhs@mojatatu.com, xiyou.wangcong@gmail.com, jiri@resnulli.us, amir@vadai.me, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 3 Jul 2018 13:45:12 +0000

> 'keys_ex' is malloced by tcf_pedit_keys_ex_parse() in tcf_pedit_init()
> but not all of the error handle path free it, this may cause memory
> leak. This patch fix it.
> 
> Fixes: 71d0ed7079df ("net/act_pedit: Support using offset relative to the conventional network headers")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.
