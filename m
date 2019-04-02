From: David Miller <davem@davemloft.net>
Date: Tue, 02 Apr 2019 17:56:41 +0000
Subject: Re: [PATCH net-next] openvswitch: use after free in __ovs_ct_free_action()
Message-Id: <20190402.105641.1982090676927808825.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190402065314.GA14444@kadam>
In-Reply-To: <20190402065314.GA14444@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: pshelar@ovn.org, yihung.wei@gmail.com, netdev@vger.kernel.org, dev@openvswitch.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 2 Apr 2019 09:53:14 +0300

> We free "ct_info->ct" and then use it on the next line when we pass it
> to nf_ct_destroy_timeout().  This patch swaps the order to avoid the use
> after free.
> 
> Fixes: 06bd2bdf19d2 ("openvswitch: Add timeout support to ct action")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.
