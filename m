From: David Miller <davem@davemloft.net>
Date: Thu, 21 Apr 2016 18:08:19 +0000
Subject: Re: [patch -next] geneve: testing the wrong variable in geneve6_build_skb()
Message-Id: <20160421.140819.672617348227733752.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160419143056.GD4876@mwanda>
In-Reply-To: <20160419143056.GD4876@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: aduyck@mirantis.com, jesse@kernel.org, linville@tuxdriver.com, pshelar@nicira.com, jbenc@redhat.com, daniel@iogearbox.net, tom@herbertland.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 19 Apr 2016 17:30:56 +0300

> We intended to test "err" and not "skb".
> 
> Fixes: aed069df099c ('ip_tunnel_core: iptunnel_handle_offloads returns int and doesn't free skb')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
