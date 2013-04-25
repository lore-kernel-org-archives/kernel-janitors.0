From: David Miller <davem@davemloft.net>
Date: Thu, 25 Apr 2013 05:48:44 +0000
Subject: Re: [patch] appletalk: info leak in ->getname()
Message-Id: <20130425.014844.1797382708245977114.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130423062215.GA15893@elgon.mountain>
In-Reply-To: <20130423062215.GA15893@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: acme@ghostprotocols.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 23 Apr 2013 09:22:15 +0300

> There is a one byte hole between ->sat_port and ->sat_addr.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
