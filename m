From: David Miller <davem@davemloft.net>
Date: Wed, 05 Apr 2017 13:54:27 +0000
Subject: Re: [PATCH -next] net: sched: choke: remove some dead code
Message-Id: <20170405.065427.1390314194128386572.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170403181629.GA22938@mwanda>
In-Reply-To: <20170403181629.GA22938@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jhs@mojatatu.com, jiri@mellanox.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 3 Apr 2017 21:18:41 +0300

> We accidentally left this dead code behind after commit 5952fde10c35
> ("net: sched: choke: remove dead filter classify code").
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
