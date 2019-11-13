From: David Miller <davem@davemloft.net>
Date: Wed, 13 Nov 2019 22:38:37 +0000
Subject: Re: [PATCH net-next] cxgb4: Fix an error code in cxgb4_mqprio_alloc_hw_resources()
Message-Id: <20191113.143837.1464059114762484823.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191113182548.vtmyryulik4gxnrv@kili.mountain>
In-Reply-To: <20191113182548.vtmyryulik4gxnrv@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: vishal@chelsio.com, rahul.lakkireddy@chelsio.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Nov 2019 21:25:48 +0300

> "ret" is zero or possibly uninitialized on this error path.  It
> should be a negative error code instead.
> 
> Fixes: 2d0cb84dd973 ("cxgb4: add ETHOFLD hardware queue support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
