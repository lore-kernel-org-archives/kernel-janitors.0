From: David Miller <davem@davemloft.net>
Date: Thu, 13 Oct 2016 16:10:40 +0000
Subject: Re: [patch] tipc: info leak in __tipc_nl_add_udp_addr()
Message-Id: <20161013.121040.414946493107087613.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161013080606.GA3389@mwanda>
In-Reply-To: <20161013080606.GA3389@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jon.maloy@ericsson.com, richard.alpe@ericsson.com, ying.xue@windriver.com, netdev@vger.kernel.org, tipc-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Oct 2016 11:06:06 +0300

> We should clear out the padding and unused struct members so that we
> don't expose stack information to userspace.
> 
> Fixes: fdb3accc2c15 ('tipc: add the ability to get UDP options via netlink')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.
