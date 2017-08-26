From: David Miller <davem@davemloft.net>
Date: Sat, 26 Aug 2017 00:14:03 +0000
Subject: Re: [PATCH] hinic: skb_pad() frees on error
Message-Id: <20170825.171403.275382416735776894.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170825082428.hpnbs4i74bubm4cz@mwanda>
In-Reply-To: <20170825082428.hpnbs4i74bubm4cz@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: aviad.krawczyk@huawei.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 25 Aug 2017 11:24:28 +0300

> The skb_pad() function frees the skb on error, so this code has a double
> free.
> 
> Fixes: 00e57a6d4ad3 ("net-next/hinic: Add Tx operation")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.
