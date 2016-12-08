From: David Miller <davem@davemloft.net>
Date: Thu, 08 Dec 2016 16:30:53 +0000
Subject: Re: [patch] drivers: net: xgene: uninitialized variable in xgene_enet_free_pagepool()
Message-Id: <20161208.113053.539814359496613991.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161207111424.GA5507@elgon.mountain>
In-Reply-To: <20161207111424.GA5507@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: isubramanian@apm.com, kchudgar@apm.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 7 Dec 2016 14:14:24 +0300

> We never set "slots" in this function.
> 
> Fixes: a9380b0f7be8 ("drivers: net: xgene: Add support for Jumbo frame")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
