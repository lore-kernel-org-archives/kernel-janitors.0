From: Vlad Buslov <vladbu@mellanox.com>
Date: Mon, 18 Feb 2019 12:26:35 +0000
Subject: Re: [PATCH net-next] net: sched: potential NULL dereference in tcf_block_find()
Message-Id: <vbfftslqo7c.fsf@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190218092632.GB7712@kadam>
In-Reply-To: <20190218092632.GB7712@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>, "David S. Miller" <davem@davemloft.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Mon 18 Feb 2019 at 09:26, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> The error code isn't set on this path so it would result in returning
> ERR_PTR(0) and a NULL dereference in the caller.
>
> Fixes: 18d3eefb17cf ("net: sched: refactor tcf_block_find() into standalone functions")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Hi Dan,

Thank you for finding and fixing this!

Regards,
Vlad
