From: David Miller <davem@davemloft.net>
Date: Sat, 09 Sep 2017 04:09:05 +0000
Subject: Re: [PATCH net] phy: mvebu-cp110: checking for NULL instead of IS_ERR()
Message-Id: <20170908.210905.626281012369795940.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170908103137.zck6bw66sge4fhua@mwanda>
In-Reply-To: <20170908103137.zck6bw66sge4fhua@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: kishon@ti.com, antoine.tenart@free-electrons.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 8 Sep 2017 13:31:37 +0300

> devm_ioremap_resource() never returns NULL, it only returns error
> pointers so this test needs to be changed.
> 
> Fixes: d0438bd6aa09 ("phy: add the mvebu cp110 comphy driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This driver apparently is going through the net tree, but netdev isn't
> listed as handling it in MAINTAINERS.  Kishon, do you know what's up
> with that?

Yeah let's sort this out before I apply this fix to my tree.
