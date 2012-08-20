From: David Miller <davem@davemloft.net>
Date: Mon, 20 Aug 2012 09:21:43 +0000
Subject: Re: [patch] gre: information leak in ip6_tnl_ioctl()
Message-Id: <20120820.022143.843914975656895005.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120816131404.GA23188@elgon.mountain>
In-Reply-To: <20120816131404.GA23188@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: xeb@mail.ru, kuznet@ms2.inr.ac.ru, jmorris@namei.org, yoshfuji@linux-ipv6.org, kaber@trash.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 16 Aug 2012 16:14:04 +0300

> There is a one byte hole between p->hop_limit and p->flowinfo where
> stack memory is leaked to the user.  This was introduced in c12b395a46
> "gre: Support GRE over IPv6".
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
