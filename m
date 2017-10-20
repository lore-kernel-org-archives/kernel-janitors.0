From: David Miller <davem@davemloft.net>
Date: Fri, 20 Oct 2017 07:34:30 +0000
Subject: Re: [PATCH net-next] tipc: checking for NULL instead of IS_ERR()
Message-Id: <20171020.083430.260489693883420009.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171018074825.2bi42vewrqhdbte3@mwanda>
In-Reply-To: <20171018074825.2bi42vewrqhdbte3@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jon.maloy@ericsson.com, ying.xue@windriver.com, netdev@vger.kernel.org, tipc-discussion@lists.sourceforge.net, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 18 Oct 2017 10:48:25 +0300

> The tipc_alloc_conn() function never returns NULL, it returns error
> pointers, so I have fixed the check.
> 
> Fixes: 14c04493cb77 ("tipc: add ability to order and receive topology events in driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
