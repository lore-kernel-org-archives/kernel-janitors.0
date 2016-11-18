From: David Miller <davem@davemloft.net>
Date: Fri, 18 Nov 2016 19:04:03 +0000
Subject: Re: [patch net-next] liquidio CN23XX: bitwise vs logical AND typo
Message-Id: <20161118.140403.2109023792867040848.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161118114734.GB3281@mwanda>
In-Reply-To: <20161118114734.GB3281@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: derek.chickles@caviumnetworks.com, raghu.vatsavayi@caviumnetworks.com, satananda.burla@caviumnetworks.com, felix.manlunas@caviumnetworks.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 Nov 2016 14:47:35 +0300

> We obviously intended a bitwise AND here, not a logical one.
> 
> Fixes: 8c978d059224 ("liquidio CN23XX: Mailbox support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
