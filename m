From: David Miller <davem@davemloft.net>
Date: Mon, 06 Aug 2018 00:26:04 +0000
Subject: Re: [PATCH net-next] net: sched: cls_flower: Fix an error code in fl_tmplt_create()
Message-Id: <20180805.172604.633565255902664874.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180803192754.vggls5m46jw6ynfc@kili.mountain>
In-Reply-To: <20180803192754.vggls5m46jw6ynfc@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jhs@mojatatu.com, jiri@mellanox.com, xiyou.wangcong@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 3 Aug 2018 22:27:55 +0300

> We forgot to set the error code on this path, so we return NULL instead
> of an error pointer.  In the current code kzalloc() won't fail for small
> allocations so this doesn't really affect runtime.
> 
> Fixes: b95ec7eb3b4d ("net: sched: cls_flower: implement chain templates")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
