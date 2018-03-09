From: David Miller <davem@davemloft.net>
Date: Fri, 09 Mar 2018 02:50:15 +0000
Subject: Re: [PATCH 1/2 net-next] net/ncsi: use kfree_skb() instead of kfree()
Message-Id: <20180308.215015.1257788036813023220.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180308093604.GC16525@mwanda>
In-Reply-To: <20180308093604.GC16525@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: sam@mendozajonas.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 8 Mar 2018 12:36:04 +0300

> We're supposed to use kfree_skb() to free these sk_buffs.
> 
> Fixes: 955dc68cb9b2 ("net/ncsi: Add generic netlink family")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
