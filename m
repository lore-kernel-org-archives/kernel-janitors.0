From: David Miller <davem@davemloft.net>
Date: Wed, 25 Jan 2017 17:41:50 +0000
Subject: Re: [patch net-next] tipc: uninitialized return code in tipc_setsockopt()
Message-Id: <20170125.124150.1969743532489529180.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170124094935.GA19984@mwanda>
In-Reply-To: <20170124094935.GA19984@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jon.maloy@ericsson.com, ying.xue@windriver.com, netdev@vger.kernel.org, tipc-discussion@lists.sourceforge.net, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 24 Jan 2017 12:49:35 +0300

> We shuffled some code around and added some new case statements here and
> now "res" isn't initialized on all paths.
> 
> Fixes: 01fd12bb189a ("tipc: make replicast a user selectable option")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
