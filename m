From: David Miller <davem@davemloft.net>
Date: Thu, 14 Feb 2019 06:13:39 +0000
Subject: Re: [PATCH 1/3 net-next] lib: objagg: Fix an error code in objagg_hints_get()
Message-Id: <20190213.221339.674810113139257631.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190213085650.GB14113@kadam>
In-Reply-To: <20190213085650.GB14113@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jiri@mellanox.com, netdev@vger.kernel.org, idosch@mellanox.com, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Feb 2019 11:56:50 +0300

> We need to set the error code on this path otherwise we return
> ERR_PTR(0) which would result in a NULL dereference in the caller.
> 
> Fixes: 9069a3817d82 ("lib: objagg: implement optimization hints assembly and use hints for object creation")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
