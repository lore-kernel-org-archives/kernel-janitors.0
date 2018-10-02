From: David Miller <davem@davemloft.net>
Date: Tue, 02 Oct 2018 05:34:28 +0000
Subject: Re: [PATCH net] net: sched: act_ipt: check for underflow in __tcf_ipt_init()
Message-Id: <20181001.223428.810557942317894005.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180922134648.GA7027@mwanda>
In-Reply-To: <20180922134648.GA7027@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jhs@mojatatu.com, kaber@trash.net, xiyou.wangcong@gmail.com, jiri@resnulli.us, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 22 Sep 2018 16:46:48 +0300

> If "td->u.target_size" is larger than sizeof(struct xt_entry_target) we
> return -EINVAL.  But we don't check whether it's smaller than
> sizeof(struct xt_entry_target) and that could lead to an out of bounds
> read.
> 
> Fixes: 7ba699c604ab ("[NET_SCHED]: Convert actions from rtnetlink to new netlink API")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
