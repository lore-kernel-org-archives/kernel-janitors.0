From: David Miller <davem@davemloft.net>
Date: Fri, 27 Sep 2019 08:00:37 +0000
Subject: Re: [PATCH net] cxgb4: Signedness bug in init_one()
Message-Id: <20190927.100037.1433103283572314359.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925105459.GB3264@mwanda>
In-Reply-To: <20190925105459.GB3264@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: vishal@chelsio.com, ganeshgr@chelsio.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Sep 2019 13:54:59 +0300

> The "chip" variable is an enum, and it's treated as unsigned int by GCC
> in this context so the error handling isn't triggered.
> 
> Fixes: e8d452923ae6 ("cxgb4: clean up init_one")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
