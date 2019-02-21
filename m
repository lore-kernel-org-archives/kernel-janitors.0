From: David Miller <davem@davemloft.net>
Date: Thu, 21 Feb 2019 21:11:28 +0000
Subject: Re: [PATCH net-next] net: sched: potential NULL dereference in tcf_block_find()
Message-Id: <20190221.131128.1615110783597157620.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190218092632.GB7712@kadam>
In-Reply-To: <20190218092632.GB7712@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jhs@mojatatu.com, vladbu@mellanox.com, xiyou.wangcong@gmail.com, jiri@resnulli.us, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 18 Feb 2019 12:26:32 +0300

> The error code isn't set on this path so it would result in returning
> ERR_PTR(0) and a NULL dereference in the caller.
> 
> Fixes: 18d3eefb17cf ("net: sched: refactor tcf_block_find() into standalone functions")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.
