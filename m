From: David Miller <davem@davemloft.net>
Date: Tue, 27 Mar 2018 14:39:11 +0000
Subject: Re: [PATCH] net/ncsi: check for null return from call to nla_nest_start
Message-Id: <20180327.103911.924179090835764688.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180326112712.31165-1-colin.king@canonical.com>
In-Reply-To: <20180326112712.31165-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: dan.carpenter@oracle.com, sam@mendozajonas.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Mon, 26 Mar 2018 12:27:12 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The call to nla_nest_start calls nla_put which can lead to a NULL
> return so it's possible for attr to become NULL and we can potentially
> get a NULL pointer dereference on attr.  Fix this by checking for
> a NULL return.
> 
> Detected by CoverityScan, CID#1466125 ("Dereference null return")
> 
> Fixes: 955dc68cb9b2 ("net/ncsi: Add generic netlink family")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, but...

Colin, please start marking your Subject lines properly with "[PATCH
net-next]" for patches targetting net-next as opposed to net.

Thank you.
